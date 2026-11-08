import PhotoSwipeLightbox from '../vendor/photoswipe-5.4.4/photoswipe-lightbox.esm.min.js';

const gallery = document.querySelector('#map-gallery');
const figures = Array.from(gallery.querySelectorAll('.map-piece'));
const links = figures.map((figure) => figure.querySelector('.map-piece__image'));
const reducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)');

function layoutGallery() {
  const width = gallery.clientWidth;
  if (width <= 640) {
    figures.forEach((figure) => figure.style.removeProperty('--map-width'));
    return;
  }

  const gap = parseFloat(getComputedStyle(gallery).columnGap);
  const targetHeight = width < 900 ? 240 : 265;
  let row = [];
  let ratioSum = 0;

  function placeRow() {
    const available = width - gap * (row.length - 1);
    const height = available / ratioSum;
    row.forEach((figure) => {
      figure.style.setProperty('--map-width', `${Math.floor(height * Number(figure.dataset.ratio) * 100) / 100}px`);
    });
    row = [];
    ratioSum = 0;
  }

  figures.forEach((figure, index) => {
    const ratio = Number(figure.dataset.ratio);
    const remaining = figures.length - index - 1;
    const nextHeight = (width - gap * row.length) / (ratioSum + ratio);
    const currentHeight = row.length ? (width - gap * (row.length - 1)) / ratioSum : Infinity;

    if (remaining > 0 && row.length >= 2 && Math.abs(currentHeight - targetHeight) < Math.abs(nextHeight - targetHeight)) {
      placeRow();
    }

    row.push(figure);
    ratioSum += ratio;
    if (remaining !== 1 && (width - gap * (row.length - 1)) / ratioSum <= targetHeight) placeRow();
  });

  if (row.length) placeRow();
}

layoutGallery();
new ResizeObserver(layoutGallery).observe(gallery);

gallery.querySelectorAll('.map-piece__image img').forEach((preview) => {
  let recovered = false;
  const useOriginal = () => {
    if (recovered) return;
    recovered = true;
    preview.removeAttribute('srcset');
    preview.removeAttribute('sizes');
    preview.src = preview.closest('.map-piece__image').href;
  };

  preview.addEventListener('error', useOriginal, { once: true });
  if (preview.complete && preview.naturalWidth === 0) useOriginal();
});

const lightbox = new PhotoSwipeLightbox({
  gallery,
  children: '.map-piece__image',
  pswpModule: () => import('../vendor/photoswipe-5.4.4/photoswipe.esm.min.js'),
  mainClass: 'map-viewer',
  bgOpacity: 1,
  loop: false,
  zoom: false,
  wheelToZoom: true,
  allowPanToNext: false,
  pinchToClose: false,
  closeOnVerticalDrag: false,
  imageClickAction: 'zoom',
  tapAction: 'zoom',
  doubleTapAction: 'zoom',
  initialZoomLevel: 'fit',
  secondaryZoomLevel: 1,
  maxZoomLevel: (zoom) => Math.max(2, zoom.fit * 4),
  showHideAnimationType: reducedMotion.matches ? 'none' : 'fade',
  zoomAnimationDuration: reducedMotion.matches ? 0 : 200,
  paddingFn: (viewport) => ({
    top: 76,
    bottom: viewport.x < 640 ? 160 : 150,
    left: viewport.x < 640 ? 10 : 64,
    right: viewport.x < 640 ? 10 : 64,
  }),
  errorMsg: 'This map could not be loaded. Close the viewer and try opening it again.',
});

let caption;
let status;
let opener;
let inertElements = [];
let openedFromHash = false;
let closingFromHistory = false;
let viewerReady = false;

function setMapHash(index, method = 'replaceState') {
  const url = new URL(window.location.href);
  url.hash = `map=${links[index].dataset.mapId}`;
  history[method](history.state, '', url);
}

function changeZoom(multiplier) {
  const slide = lightbox.pswp.currSlide;
  if (!slide) return;
  const level = Math.max(slide.zoomLevels.min, Math.min(slide.zoomLevels.max, slide.currZoomLevel * multiplier));
  lightbox.pswp.zoomTo(level);
}

function updateCaption() {
  const figure = figures[lightbox.pswp.currIndex];
  caption.replaceChildren();
  const heading = document.createElement('h2');
  heading.id = 'map-viewer-title';
  heading.textContent = figure.querySelector('h2').textContent;
  caption.append(heading);
  figure.querySelector('.map-piece__detail').childNodes.forEach((node) => caption.append(node.cloneNode(true)));
  status = document.createElement('div');
  status.className = 'map-viewer__status';
  status.setAttribute('role', 'status');
  status.textContent = 'Scroll or pinch to zoom. Drag to look around.';
  caption.append(status);
}

lightbox.on('uiRegister', () => {
  const pswp = lightbox.pswp;
  const registerButton = (name, label, html, order, onClick) => {
    pswp.ui.registerElement({ name, title: label, ariaLabel: label, html, order, isButton: true, onClick });
  };

  registerButton('map-out', 'Zoom out', '−', 6, () => changeZoom(1 / 1.5));
  registerButton('map-in', 'Zoom in', '+', 7, () => changeZoom(1.5));
  registerButton('map-fit', 'Fit the whole map to the screen', 'Fit map', 8, () => {
    if (pswp.currSlide) pswp.zoomTo(pswp.currSlide.zoomLevels.initial);
  });
  registerButton('map-share', 'Copy a link to this map', 'Copy link', 9, async () => {
    const shareStatus = status;
    try {
      await navigator.clipboard.writeText(window.location.href);
      shareStatus.textContent = 'Map link copied.';
    } catch {
      shareStatus.textContent = 'Copy the address from your browser to share this map.';
    }
  });

  pswp.ui.registerElement({
    name: 'map-caption',
    className: 'map-viewer__caption',
    appendTo: 'root',
    onInit: (element) => { caption = element; },
  });

  const updateZoomButtons = () => {
    const slide = pswp.currSlide;
    if (!slide) return;
    pswp.element.querySelector('.pswp__button--map-out').disabled = slide.currZoomLevel <= slide.zoomLevels.min + .001;
    pswp.element.querySelector('.pswp__button--map-in').disabled = slide.currZoomLevel >= slide.zoomLevels.max - .001;
  };
  pswp.on('zoomPanUpdate', updateZoomButtons);
  pswp.on('change', updateZoomButtons);
});

lightbox.on('beforeOpen', () => {
  opener = document.activeElement;
  closingFromHistory = false;
  viewerReady = false;
});

lightbox.on('afterInit', () => {
  const pswp = lightbox.pswp;
  pswp.element.setAttribute('aria-modal', 'true');
  pswp.element.setAttribute('aria-labelledby', 'map-viewer-title');
  document.body.classList.add('map-viewer-open');
  inertElements = Array.from(document.body.children).filter((element) => element !== pswp.element && !element.inert);
  inertElements.forEach((element) => { element.inert = true; });
  updateCaption();
  viewerReady = true;
  setMapHash(pswp.currIndex, openedFromHash ? 'replaceState' : 'pushState');
});

lightbox.on('change', () => {
  if (!viewerReady) return;
  updateCaption();
  setMapHash(lightbox.pswp.currIndex);
});

lightbox.on('close', () => {
  viewerReady = false;
  if (closingFromHistory) return;
  if (openedFromHash) {
    const url = new URL(window.location.href);
    url.hash = '';
    history.replaceState(history.state, '', url);
  } else {
    history.back();
  }
});

lightbox.on('destroy', () => {
  document.body.classList.remove('map-viewer-open');
  inertElements.forEach((element) => { element.inert = false; });
  inertElements = [];
  caption = null;
  status = null;
  if (opener instanceof HTMLElement && opener !== document.body) opener.focus({ preventScroll: true });
});

lightbox.on('keydown', (event) => {
  const key = event.originalEvent;
  if (key.altKey || key.ctrlKey || key.metaKey) return;
  const slide = lightbox.pswp.currSlide;
  if (!slide) return;

  if ((key.key === 'ArrowLeft' || key.key === 'ArrowRight') && slide.currZoomLevel > slide.zoomLevels.fit + .001) {
    event.preventDefault();
    key.preventDefault();
    slide.panTo(slide.pan.x + (key.key === 'ArrowLeft' ? 80 : -80), slide.pan.y);
  }
});

function followHash() {
  const id = window.location.hash.startsWith('#map=') ? window.location.hash.slice(5) : null;
  const index = links.findIndex((link) => link.dataset.mapId === id);
  if (index >= 0) {
    if (lightbox.pswp) {
      if (lightbox.pswp.currIndex !== index) lightbox.pswp.goTo(index);
    } else {
      openedFromHash = true;
      lightbox.loadAndOpen(index);
    }
  } else if (lightbox.pswp) {
    closingFromHistory = true;
    lightbox.pswp.close();
  }
}

// A normal gallery click creates one history entry; moving between maps replaces it.
gallery.addEventListener('click', () => { openedFromHash = false; }, true);
window.addEventListener('hashchange', followHash);
lightbox.init();
followHash();
