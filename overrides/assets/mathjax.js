// MathJax configuration for the arithmatex "generic" output mode.
window.MathJax = {
  tex: {
    inlineMath: [["\\(", "\\)"]],
    displayMath: [["\\[", "\\]"]],
    processEscapes: true,
    processEnvironments: true,
  },
  options: {
    ignoreHtmlClass: ".*|",
    processHtmlClass: "arithmatex",
  },
};

// Material's instant navigation swaps page content without a reload, so the
// equations on the newly loaded page have to be typeset again.
if (typeof document$ !== "undefined") {
  document$.subscribe(function () {
    MathJax.startup.output.clearCache();
    MathJax.typesetClear();
    MathJax.texReset();
    MathJax.typesetPromise();
  });
}
