---
title: portfolio
slug: portfolio
subtitle: Interactive stories about climate, movement, music, food, microbes, and energy
summary: Interactive stories about climate, movement, music, food, microbes, and energy
layout: portfolio
projects: []
date: '2020-12-13T00:00:00Z'
lastmod: '2026-08-14T00:00:00Z'
draft: false
featured: false
image:
  caption: ''
  focal_point: Center
  preview_only: true
authors:
  - admin
tags: [Portfolio, r]
categories:
---

<style>
.edp-portfolio{--edp-accent:#a0442e;--edp-ink:#202326;--edp-muted:#69716c;--edp-line:rgba(100,105,102,.24);--edp-panel:rgba(120,120,120,.055);width:100%;margin:.5rem 0 4rem;color:var(--edp-ink)}
body.dark .edp-portfolio{--edp-accent:#e19279;--edp-ink:#f4f1e8;--edp-muted:#b7b3aa;--edp-line:rgba(235,232,223,.2);--edp-panel:rgba(255,255,255,.045)}
.edp-portfolio *{box-sizing:border-box}
.edp-portfolio a{color:inherit;text-decoration:none}
.edp-portfolio a:focus-visible{outline:3px solid var(--edp-accent);outline-offset:5px}
.edp-intro{position:relative;isolation:isolate;display:grid;grid-template-columns:minmax(340px,.82fr) minmax(0,1.18fr);gap:clamp(2.5rem,6vw,5rem);overflow:hidden;margin-bottom:1rem;padding:clamp(2rem,4vw,3.25rem) 0;border-radius:3px;background:#fff;align-items:start}
body.dark .edp-intro{background:transparent}
.edp-intro-flow{position:static;z-index:auto;width:auto;min-width:4rem;max-width:14rem;height:3.5rem;margin:0;color:var(--primary);opacity:.24;flex:1 1 8rem;-webkit-mask-image:linear-gradient(90deg,transparent,#000 14%,#000 86%,transparent);mask-image:linear-gradient(90deg,transparent,#000 14%,#000 86%,transparent);animation:edp-flow 12s ease-in-out infinite alternate;pointer-events:none}
.edp-intro-flow path{fill:none;stroke:currentColor;stroke-linecap:round}
.edp-intro-flow path:nth-child(1){stroke-width:1.2}
.edp-intro-flow path:nth-child(2){stroke-width:.8;opacity:.62}
.edp-intro-flow path:nth-child(3){stroke-width:.55;opacity:.36}
@keyframes edp-flow{from{transform:translate3d(0,0,0)}to{transform:translate3d(-8px,-3px,0)}}
.edp-intro-heading{align-self:start}
.edp-intro-label{display:block;margin:1.35rem 0 0}
.edp-intro-label .edp-kicker{margin:0;font-size:.6rem;letter-spacing:.14em}
.edp-intro-count{margin:.38rem 0 0;color:var(--edp-muted);font-size:.55rem;font-weight:580;letter-spacing:.1em;text-transform:uppercase;white-space:nowrap}
.edp-intro h2{max-width:12ch;margin:0;color:var(--edp-ink);font-size:clamp(3rem,5.2vw,4.65rem);font-weight:480;line-height:.95;letter-spacing:-.052em;text-wrap:balance}
.edp-intro h2 em{display:block;color:var(--edp-muted);font-weight:420}
.edp-intro-copy{display:flex;max-width:none;height:100%;padding:0;flex-direction:column;align-self:stretch}
.edp-intro-copy p{margin:0;color:var(--edp-muted);font-size:1.08rem;line-height:1.62}
.edp-intro-browse{display:flex;width:100%;gap:1rem;margin-top:auto;padding-top:1.5rem;justify-content:space-between;align-items:center}
.edp-intro-browse p{font-size:.8rem;line-height:1.4;white-space:nowrap}
.edp-kicker,.edp-meta,.edp-tools{margin:0;color:var(--edp-muted);font-size:.72rem;font-weight:650;letter-spacing:.12em;text-transform:uppercase}
.edp-showcase{padding:.75rem 0 clamp(3.5rem,6vw,5rem);border-bottom:1px solid var(--edp-line)}
.edp-controls{display:flex;gap:.5rem;flex:0 0 auto}
.edp-control{display:grid;width:2.75rem;height:2.75rem;padding:0;border:1px solid var(--edp-line);border-radius:50%;place-items:center;color:var(--edp-ink);background:transparent;font:inherit;font-size:1.2rem;line-height:1;cursor:pointer;transition:border-color .18s ease,color .18s ease,transform .18s ease}
.edp-control:hover{border-color:var(--edp-ink);color:var(--edp-accent);transform:translateY(-1px)}
.edp-control:focus-visible{outline:3px solid var(--edp-accent);outline-offset:3px}
.edp-rail{display:grid;grid-auto-flow:column;grid-auto-columns:minmax(310px,390px);gap:clamp(1.35rem,2.5vw,2rem);overflow-x:auto;overscroll-behavior-inline:contain;padding:.1rem .15rem 1.3rem;scroll-behavior:smooth;scroll-padding-inline:.15rem;scroll-snap-type:inline mandatory;scrollbar-color:var(--edp-muted) transparent;scrollbar-width:thin}
.edp-rail::-webkit-scrollbar{height:8px}
.edp-rail::-webkit-scrollbar-track{background:transparent}
.edp-rail::-webkit-scrollbar-thumb{border-radius:10px;background:var(--edp-line)}
.edp-card{display:flex;min-height:660px;padding-top:1.15rem;border-top:1px solid var(--edp-line);flex-direction:column;scroll-snap-align:start}
.edp-card-meta{display:flex;min-height:2.2rem;margin-bottom:1.2rem;justify-content:space-between;gap:1.25rem;align-items:center}
.edp-card-meta .edp-meta{font-size:.64rem;letter-spacing:.1em;white-space:nowrap}
.edp-card-meta .edp-meta:last-child{text-align:right}
.edp-card-visual{display:block;overflow:hidden;margin-bottom:1.7rem;border:1px solid var(--edp-line);background:var(--edp-panel)}
.edp-card-visual img{display:block;width:100%;aspect-ratio:8/5;margin:0;object-fit:cover;filter:saturate(.88);transition:filter .3s ease,transform .35s ease}
.edp-card:hover .edp-card-visual img{filter:saturate(1);transform:scale(1.018)}
.edp-card h3{margin:0 0 .75rem;color:var(--edp-ink);font-size:clamp(1.8rem,2.6vw,2.25rem);font-weight:500;line-height:1.02;letter-spacing:-.04em;text-wrap:balance}
.edp-question{margin:0 0 1.15rem;color:var(--edp-ink);font-size:1.02rem;font-weight:500;line-height:1.45}
.edp-description{margin:0;color:var(--edp-muted);font-size:.94rem;line-height:1.58}
.edp-card-footer{margin-top:auto;padding-top:1.6rem}
.edp-tools{margin-bottom:1rem;line-height:1.55}
.edp-portfolio .edp-link{display:inline-block;padding-bottom:.2rem;border-bottom:1px solid currentColor;color:var(--primary);font-size:.92rem;font-weight:580}
.edp-earlier{display:grid;grid-template-columns:.72fr 1.5fr;gap:clamp(3rem,7vw,7rem);padding-top:clamp(3.5rem,6vw,5rem)}
.edp-earlier h2{margin:0 0 1rem;font-size:clamp(2rem,3vw,2.8rem);font-weight:500;line-height:1.06;letter-spacing:-.035em}
.edp-earlier-copy>p:last-child{max-width:350px;color:var(--edp-muted)}
.edp-index{border-top:1px solid var(--edp-line)}
.edp-index a{display:grid;grid-template-columns:70px minmax(0,1fr) 155px;gap:1rem;padding:1.35rem 0;border-bottom:1px solid var(--edp-line);align-items:baseline;transition:color .18s ease,padding .18s ease}
.edp-index a:hover{padding-left:.35rem;color:var(--edp-accent)}
.edp-index-date{color:var(--edp-muted);font-size:.77rem;letter-spacing:.06em;text-transform:uppercase}
.edp-index-title{font-weight:560}
.edp-index-type{color:var(--edp-muted);font-size:.82rem}
@media(max-width:800px){.edp-portfolio{margin-top:.25rem}.edp-intro,.edp-earlier{grid-template-columns:minmax(0,1fr)}.edp-intro{gap:1.75rem;padding:clamp(1.4rem,5vw,2rem) 0}.edp-intro-flow{display:none}.edp-intro h2{max-width:11ch;font-size:clamp(2.8rem,11.5vw,4rem)}.edp-intro-copy{max-width:36rem}.edp-card{min-height:640px}.edp-earlier{gap:1.75rem}}
@media(max-width:600px){.edp-portfolio{width:calc(100vw - 2rem)}.edp-controls{display:none}.edp-intro-label{margin-top:1rem}.edp-intro-browse{width:max-content;max-width:100%;margin-top:1.2rem;padding-top:0}.edp-rail{grid-auto-columns:84vw;gap:1.1rem;margin-right:-1rem;padding-right:1rem}.edp-card{min-height:610px}.edp-card h3{font-size:1.8rem}.edp-index a{grid-template-columns:58px minmax(0,1fr)}.edp-index-type{grid-column:2;grid-row:2}}
@media(prefers-reduced-motion:reduce){.edp-portfolio *{scroll-behavior:auto!important;transition:none!important}.edp-intro-flow{animation:none!important}}
</style>

<div class="edp-portfolio">
<section class="edp-intro" aria-labelledby="edp-intro-title">
<div class="edp-intro-heading">
<h2 id="edp-intro-title">A few things I have made <em>with data</em></h2>
<div class="edp-intro-label">
<p class="edp-kicker">Selected data stories</p>
<p class="edp-intro-count">07 projects · 2025–2026</p>
</div>
</div>
<div class="edp-intro-copy">
<p>I make these projects to understand things I care about. Climate data helps me grasp what Pacific communities are living through. My Spotify history takes me back to the year I finished my bachelor’s thesis. I always learn something while making them. Maybe one will make you curious too.</p>
<div class="edp-intro-browse">
<p>Scroll sideways or swipe through the work.</p>
<svg class="edp-intro-flow" viewBox="0 0 320 90" aria-hidden="true" focusable="false">
<path d="M2 63 C52 20 93 78 142 48 S235 19 318 43"></path>
<path d="M2 72 C55 30 98 86 148 57 S240 28 318 51"></path>
<path d="M2 81 C58 40 103 92 154 66 S245 37 318 60"></path>
</svg>
<div class="edp-controls" aria-label="Project navigation">
<button class="edp-control" type="button" aria-label="Previous projects" onclick="document.getElementById('edp-project-rail').scrollBy({left:-420})">←</button>
<button class="edp-control" type="button" aria-label="Next projects" onclick="document.getElementById('edp-project-rail').scrollBy({left:420})">→</button>
</div>
</div>
</div>
</section>
<section class="edp-showcase" id="selected-work" aria-label="Selected work">
<div class="edp-rail" id="edp-project-rail" tabindex="0" aria-label="Selected projects">
<article class="edp-card">
<div class="edp-card-meta"><time class="edp-meta" datetime="2026">2026</time><p class="edp-meta">Earth science · Visual essay</p></div>
<a class="edp-card-visual" href="https://danilyanedo7.github.io/ring_of_fire/" target="_blank" rel="noopener noreferrer" aria-label="Explore The Pacific's broken ring">
<picture>
<source media="(max-width:720px)" srcset="ring-of-fire-900.webp">
<img src="ring-of-fire-1600.webp" width="1600" height="1000" loading="eager" fetchpriority="high" alt="Hero view of The Pacific's broken ring showing earthquake lights around the Pacific and summary statistics">
</picture>
</a>
<h3>The ring of fire</h3>
<p class="edp-question">What do 358,673 earthquakes reveal about the shape, depth, and pulse of the Ring of Fire?</p>
<p class="edp-description">An interactive visual essay about the uneven horseshoe of earthquakes around the Pacific, the tectonic processes beneath it, and the limits of drawing a single Ring of Fire boundary.</p>
<div class="edp-card-footer">
<p class="edp-tools">R · D3 · Quarto</p>
<a class="edp-link" href="https://danilyanedo7.github.io/ring_of_fire/" target="_blank" rel="noopener noreferrer">Explore the full story</a>
</div>
</article>
<article class="edp-card">
<div class="edp-card-meta"><time class="edp-meta" datetime="2026">2026</time><p class="edp-meta">Climate · Interactive story</p></div>
<a class="edp-card-visual" href="https://danilyanedo7.github.io/pacific_dataviz_challenge/" target="_blank" rel="noopener noreferrer" aria-label="Explore Living with a Changing Climate Across the Pacific">
<picture>
<source media="(max-width:720px)" srcset="pacific-900.webp">
<img src="pacific-1600.webp" width="1600" height="1000" loading="eager" fetchpriority="high" alt="Opening of the Pacific climate story with the title and two figures comparing emissions and cyclone exposure">
</picture>
</a>
<h3>Living with a changing climate across the Pacific</h3>
<p class="edp-question">How does climate exposure look when a region’s contribution is measured at global scale?</p>
<p class="edp-description">A careful journey through emissions, ocean warming, cyclones, reef heat stress, rainfall, sea level, disasters, and the changing electricity mix across the Pacific.</p>
<div class="edp-card-footer">
<p class="edp-tools">R · D3 · JavaScript · Quarto</p>
<a class="edp-link" href="https://danilyanedo7.github.io/pacific_dataviz_challenge/" target="_blank" rel="noopener noreferrer">Explore the climate story</a>
</div>
</article>
<article class="edp-card">
<div class="edp-card-meta"><time class="edp-meta" datetime="2026">2026</time><p class="edp-meta">Movement · Visual essay</p></div>
<a class="edp-card-visual" href="https://danilyanedo7.github.io/bird_migration/" target="_blank" rel="noopener noreferrer" aria-label="Explore Bird migration">
<picture>
<source media="(max-width:720px)" srcset="bird-900.webp">
<img src="bird-1600.webp" width="1600" height="1000" loading="lazy" alt="Three colored GPS routes trace gull migrations from Belgium along the Atlantic coast to Morocco and Senegal">
</picture>
</a>
<h3>Bird migration</h3>
<p class="edp-question">How did three gulls from the same coast find different ways south?</p>
<p class="edp-description">Three gulls from the same coast left up to 78 days apart and wintered in different countries. Their journeys show how timing and stopovers can split a shared migration route.</p>
<div class="edp-card-footer">
<p class="edp-tools">JavaScript · SVG · Interactive map</p>
<a class="edp-link" href="https://danilyanedo7.github.io/bird_migration/" target="_blank" rel="noopener noreferrer">Follow the journeys</a>
</div>
</article>
<article class="edp-card">
<div class="edp-card-meta"><time class="edp-meta" datetime="2025">2025</time><p class="edp-meta">Geospatial · Visual essay</p></div>
<a class="edp-card-visual" href="https://danilyanedo7.github.io/living_with_volcano/" target="_blank" rel="noopener noreferrer" aria-label="Explore Living with volcano">
<picture>
<source media="(max-width:720px)" srcset="volcano-900.webp">
<img src="volcano-1600.webp" width="1600" height="1000" loading="lazy" alt="Opening view of Living with volcano, with a dramatic 3D population relief map of Java beneath the title">
</picture>
</a>
<h3>Living with volcano</h3>
<p class="edp-question">How close do millions of people actually live to an active volcano?</p>
<p class="edp-description">About 60 million people live within 30 kilometres of a Holocene volcano on Java. The number shows the scale of exposure, while distance alone cannot describe volcanic risk.</p>
<div class="edp-card-footer">
<p class="edp-tools">R · Leaflet · Rayshader · Quarto</p>
<a class="edp-link" href="https://danilyanedo7.github.io/living_with_volcano/" target="_blank" rel="noopener noreferrer">Explore the full story</a>
</div>
</article>
<article class="edp-card">
<div class="edp-card-meta"><time class="edp-meta" datetime="2026">2026</time><p class="edp-meta">Microbiology · Data story</p></div>
<a class="edp-card-visual" href="https://danilyanedo7.github.io/steady_state/" target="_blank" rel="noopener noreferrer" aria-label="Explore Growing, but not yet steady">
<picture>
<source media="(max-width:720px)" srcset="steady-900.webp">
<img src="steady-1600.webp" width="1600" height="1000" loading="lazy" alt="Paired charts compare median single cell mass with variation across cells and mark the effective steady state window">
</picture>
</a>
<h3>Growing, but not yet steady</h3>
<p class="edp-question">When does a growing microbial population actually become steady?</p>
<p class="edp-description">At a 1 to 10,000 dilution, effective steady state lasted about 90 minutes, while a 1 to 100 culture never reached it. The result shows why cloudiness alone can make a changing population appear steady.</p>
<div class="edp-card-footer">
<p class="edp-tools">R · JavaScript · Quarto</p>
<a class="edp-link" href="https://danilyanedo7.github.io/steady_state/" target="_blank" rel="noopener noreferrer">Explore the full story</a>
</div>
</article>
<article class="edp-card">
<div class="edp-card-meta"><time class="edp-meta" datetime="2026">2026</time><p class="edp-meta">Personal data · Visual essay</p></div>
<a class="edp-card-visual" href="https://danilyanedo7.github.io/spotify_redesign/" target="_blank" rel="noopener noreferrer" aria-label="Explore My year in music">
<picture>
<source media="(max-width:720px)" srcset="spotify-900.webp">
<img src="spotify-1600.webp" width="1600" height="1000" loading="lazy" alt="The Overture view from My year in music, showing a full year of Spotify listening as four rows of daily bars">
</picture>
</a>
<h3>My year in music</h3>
<p class="edp-question">What can a year of listening history remember that I forgot?</p>
<p class="edp-description">My listening reached 187.7 hours in July, more than twice the spring average, then eased after I moved to Poland. The pattern turns a year of Spotify history into a record of thesis pressure and changing routines.</p>
<div class="edp-card-footer">
<p class="edp-tools">R · JavaScript · Quarto</p>
<a class="edp-link" href="https://danilyanedo7.github.io/spotify_redesign/" target="_blank" rel="noopener noreferrer">Explore the full story</a>
</div>
</article>
<article class="edp-card">
<div class="edp-card-meta"><time class="edp-meta" datetime="2026">2026</time><p class="edp-meta">Food · Network story</p></div>
<a class="edp-card-visual" href="https://danilyanedo7.github.io/soto-one-soup-many-islands/" target="_blank" rel="noopener noreferrer" aria-label="Explore One soup, many islands">
<picture>
<source media="(max-width:720px)" srcset="soto-900.webp">
<img src="soto-1600.webp" width="1600" height="1000" loading="lazy" alt="Ingredient similarity network linking related soto variants with details for Soto Kebumen">
</picture>
</a>
<h3>One soup, many islands</h3>
<p class="edp-question">How can one dish keep the same name while changing from island to island?</p>
<p class="edp-description">Soto Kebumen and Soto Seger Boyolali share eleven recorded ingredients and differ only by galangal. Their similarity shows that names and geography do not always predict how a bowl is made.</p>
<div class="edp-card-footer">
<p class="edp-tools">D3 · JavaScript · Quarto</p>
<a class="edp-link" href="https://danilyanedo7.github.io/soto-one-soup-many-islands/" target="_blank" rel="noopener noreferrer">Explore the full story</a>
</div>
</article>
</div>
</section>
<section class="edp-earlier" aria-labelledby="edp-earlier-title">
<div class="edp-earlier-copy">
<p class="edp-kicker">From the archive</p>
<h2 id="edp-earlier-title">More experiments</h2>
<p>Smaller and earlier projects that trace how my interests in spatial analysis, R, dashboards, and teaching have developed.</p>
</div>
<div class="edp-index">
<a href="/post/coastal-vulnerability/"><span class="edp-index-date">2025</span><span class="edp-index-title">Where is Gresik’s coast most vulnerable?</span><span class="edp-index-type">Spatial investigation</span></a>
<a href="https://danilyanedo7.github.io/30dayschartchallenge/" target="_blank" rel="noopener noreferrer"><span class="edp-index-date">2023</span><span class="edp-index-title">30 day chart challenge</span><span class="edp-index-type">Visualisation tutorials</span></a>
<a href="/project/shinyapp/"><span class="edp-index-date">2024</span><span class="edp-index-title">Species distribution mapper</span><span class="edp-index-type">R Shiny experiment</span></a>
<a href="/post/dashboard_collection/"><span class="edp-index-date">2023</span><span class="edp-index-title">Dashboard collection</span><span class="edp-index-type">Interactive archive</span></a>
<a href="https://danilyanedo7.github.io/kaggle-energy/" target="_blank" rel="noopener noreferrer"><span class="edp-index-date">2026</span><span class="edp-index-title">Spain’s power grid</span><span class="edp-index-type">Energy dashboard</span></a>
</div>
</section>
</div>
