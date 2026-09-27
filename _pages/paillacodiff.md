---
permalink: /paillacodiff/
title: "PaillacoDiff"
author_profile: false
layout: single
---

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
</style>

<script>
marked.use(markedKatex({
  throwOnError: false
}));

const base =
  "https://raw.githubusercontent.com/moyarzoca/PaillacoDiff/refactor/public-api/";

const documents = [
  base + "README.md",
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
    documents
      .map(markdown => marked.parse(markdown))
      .join("<hr>");

  Prism.highlightAllUnder(container);
});
</script>
