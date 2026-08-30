/*************************************************
 *  Wowchemy
 *  https://github.com/wowchemy/wowchemy-hugo-themes
 *
 *  In-built Fuse based search algorithm.
 **************************************************/

import {search_config, i18n, content_type} from '@params';

/* ---------------------------------------------------------------------------
 * Configuration.
 * --------------------------------------------------------------------------- */

let fuseOptions = {
  shouldSort: true,
  includeMatches: true,
  tokenize: true,
  threshold: search_config.threshold,
  location: 0,
  distance: 100,
  maxPatternLength: 32,
  minMatchCharLength: search_config.minLength,
  keys: [
    {name: 'title', weight: 0.99},
    {name: 'summary', weight: 0.6},
    {name: 'authors', weight: 0.5},
    {name: 'content', weight: 0.2},
    {name: 'tags', weight: 0.5},
    {name: 'categories', weight: 0.5},
  ],
};

let summaryLength = 60;
let searchIndexPromise;

/* ---------------------------------------------------------------------------
 * Functions.
 * --------------------------------------------------------------------------- */

function getSearchQuery(name) {
  return decodeURIComponent((location.search.split(name + '=')[1] || '').split('&')[0]).replace(/\+/g, ' ');
}

function updateURL(url) {
  if (history.replaceState) {
    window.history.replaceState({path: url}, '', url);
  }
}

function initSearch(force, fuse) {
  let query = $('#search-query').val();

  if (query.length < 1) {
    $('#search-hits').empty();
    $('#search-common-queries').show();
  }

  if (!force && query.length < fuseOptions.minMatchCharLength) return;

  $('#search-hits').empty();
  $('#search-common-queries').hide();
  searchAcademic(query, fuse);
  let newURL =
    window.location.protocol +
    '//' +
    window.location.host +
    window.location.pathname +
    '?q=' +
    encodeURIComponent(query) +
    window.location.hash;
  updateURL(newURL);
}

function searchAcademic(query, fuse) {
  let results = fuse.search(query);

  if (results.length > 0) {
    $('#search-hits').append('<h3 class="mt-0">' + results.length + ' ' + i18n.results + '</h3>');
    parseResults(query, results);
  } else {
    $('#search-hits').append('<div class="search-no-results">' + i18n.no_results + '</div>');
  }
}

function parseResults(query, results) {
  $.each(results, function (key, value) {
    let content_key = value.item.section;
    let content = '';
    let snippet = '';
    let snippetHighlights = [];

    if (['publication', 'event'].includes(content_key)) {
      content = value.item.summary;
    } else {
      content = value.item.content;
    }

    if (fuseOptions.tokenize) {
      snippetHighlights.push(query);
    } else {
      $.each(value.matches, function (matchKey, matchValue) {
        if (matchValue.key == 'content') {
          let start = matchValue.indices[0][0] - summaryLength > 0 ? matchValue.indices[0][0] - summaryLength : 0;
          let end =
            matchValue.indices[0][1] + summaryLength < content.length
              ? matchValue.indices[0][1] + summaryLength
              : content.length;
          snippet += content.substring(start, end);
          snippetHighlights.push(
            matchValue.value.substring(
              matchValue.indices[0][0],
              matchValue.indices[0][1] - matchValue.indices[0][0] + 1,
            ),
          );
        }
      });
    }

    if (snippet.length < 1) {
      snippet += value.item.summary;
    }

    let template = $('#search-hit-fuse-template').html();

    if (content_key in content_type) {
      content_key = content_type[content_key];
    }

    let templateData = {
      key: key,
      title: value.item.title,
      type: content_key,
      relpermalink: value.item.relpermalink,
      snippet: snippet,
    };
    let output = render(template, templateData);
    $('#search-hits').append(output);

    $.each(snippetHighlights, function (hlKey, hlValue) {
      $('#summary-' + key).mark(hlValue);
    });
  });
}

function render(template, data) {
  let key, find, re;
  for (key in data) {
    find = '\\{\\{\\s*' + key + '\\s*\\}\\}';
    re = new RegExp(find, 'g');
    template = template.replace(re, data[key]);
  }
  return template;
}

function loadSearchIndex() {
  if (searchIndexPromise) return searchIndexPromise;

  searchIndexPromise = new Promise((resolve, reject) => {
    if (typeof Fuse !== 'function') {
      reject(new Error('Fuse is unavailable.'));
      return;
    }

    $.getJSON(search_config.indexURI)
      .done((search_index) => resolve(new Fuse(search_index, fuseOptions)))
      .fail((jqXHR, textStatus, errorThrown) => {
        searchIndexPromise = null;
        reject(errorThrown || new Error(textStatus));
      });
  });

  return searchIndexPromise;
}

function handleSearchKeyup(e) {
  let input = this;
  loadSearchIndex().then((fuse) => {
    clearTimeout($.data(input, 'searchTimer'));
    if (e.keyCode == 13) {
      initSearch(true, fuse);
    } else {
      $(input).data(
        'searchTimer',
        setTimeout(function () {
          initSearch(false, fuse);
        }, 250),
      );
    }
  });
}

/* ---------------------------------------------------------------------------
 * Initialize.
 * --------------------------------------------------------------------------- */

if (typeof Fuse === 'function') {
  const $searchQuery = $('#search-query');

  // Opening search focuses this input, which starts the index request only when needed.
  $searchQuery.one('focus', loadSearchIndex);
  $searchQuery.keyup(handleSearchKeyup);

  // Preserve direct links such as `/?q=portfolio` by loading the index immediately.
  let query = getSearchQuery('q');
  if (query) {
    $('body').addClass('searching');
    $('.search-results').css({opacity: 0, visibility: 'visible'}).animate({opacity: 1}, 200);
    $('#search-query').val(query);
    $('#search-query').focus();
    loadSearchIndex().then((fuse) => initSearch(true, fuse));
  }
}
