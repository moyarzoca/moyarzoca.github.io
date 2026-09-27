---
permalink: /paillacodiff/
title: "PaillacoDiff"
author_profile: false
layout: single
---

<nav id="paillacodiff-index">
  <a href="#differential-forms">Differential forms</a>
  <span>·</span>
  <a href="#tensor-manipulation">Tensor manipulation</a>
  <span>·</span>
  <a href="#conventions">Conventions</a>
</nav>

<div id="paillacodiff-docs">
  Loading documentation...
</div>

<!-- KaTeX -->
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/katex.min.css"
>

<script src="https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/katex.min.js"></script>

<!-- Prism -->
<script src="https://cdn.jsdelivr.net/npm/prismjs/prism.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/prismjs/components/prism-wolfram.min.js"></script>

<!-- Markdown -->
<script src="https://cdn.jsdelivr.net/npm/marked/lib/marked.umd.js"></script>
<script src="https://cdn.jsdelivr.net/npm/marked-katex-extension/lib/index.umd.js"></script>

<style>

/* Hide personal website navigation on this page */
.masthead {
  display: none;
}

/* Make the page title less dominant */
.page__title {
  text-align: center;
  font-size: 1.9em;
  margin-bottom: 1.8rem;
}

/* Small documentation index */
#paillacodiff-index {
  margin-bottom: 2.5rem;
  font-size: 0.9em;
}

#paillacodiff-index span {
  margin: 0 0.6em;
}

/* Main documentation sections */
#differential-forms,
#tensor-manipulation,
#conventions {
  scroll-margin-top: 1rem;
}

/* Code blocks: use the site's own theme colors */
#paillacodiff-docs pre[class*="language-"] {
  background: var(--global-code-background-color);
  border: 1px solid var(--global-border-color);
  border-radius: 4px;
  padding: 1em;
  overflow: auto;
  text-shadow: none;
}

#paillacodiff-docs code[class*="language-"] {
  background: transparent;
  font-family: Monaco, Consolas, "Lucida Console", monospace;
  text-shadow: none;
}

/* Prism tokens, matching the site's existing Solarized highlighting */
#paillacodiff-docs .token.comment,
#paillacodiff-docs .token.prolog,
#paillacodiff-docs .token.doctype,
#paillacodiff-docs .token.cdata {
  color: #93a1a1;
}

#paillacodiff-docs .token.punctuation {
  color: #586e75;
}

#paillacodiff-docs .token.property,
#paillacodiff-docs .token.tag,
#paillacodiff-docs .token.constant,
#paillacodiff-docs .token.symbol {
  color: #cb4b16;
}

#paillacodiff-docs .token.boolean,
#paillacodiff-docs .token.number,
#paillacodiff-docs .token.string {
  color: #2aa198;
}

#paillacodiff-docs .token.operator,
#paillacodiff-docs .token.keyword {
  color: #859900;
}

#paillacodiff-docs .token.function,
#paillacodiff-docs .token.builtin {
  color: #22b3eb;
}

/* Function entries */
#paillacodiff-reference h3 {
  border-bottom: none;
  margin-top: 2rem;
  margin-bottom: 0.8rem;
}

#paillacodiff-reference hr {
  border: 0;
  border-top: 2px solid var(--global-border-color);
  margin: 2rem 0;
}

/* Separate conventions from the function reference */
#paillacodiff-conventions {
  margin-top: 4rem;
  padding-top: 2rem;
}

</style>

<script>

marked.use(markedKatex({
  throwOnError: false
}));

const base =
  "https://raw.githubusercontent.com/moyarzoca/PaillacoDiff/refactor/public-api/";

const documents = [
  base + "docs/reference.md",
  base + "docs/conventions.md"
];

Promise.all(
  documents.map(url =>
    fetch(url).then(response => response.text())
  )
).then(documents => {

  const container = document.getElementById("paillacodiff-docs");

  container.innerHTML =
    `<div id="paillacodiff-reference">
      ${marked.parse(documents[0])}
    </div>

    <div id="paillacodiff-conventions">
      ${marked.parse(documents[1])}
    </div>`;

  /* Give the main Markdown headings stable links */
  const sectionIds = {
    "Differential forms": "differential-forms",
    "Tensor manipulation": "tensor-manipulation",
    "Conventions": "conventions"
  };

  container.querySelectorAll("h1").forEach(heading => {
    const id = sectionIds[heading.textContent.trim()];

    if (id) {
      heading.id = id;
    }
  });

  Prism.highlightAllUnder(container);

});

</script>
