javascript: (function () {
  function selectNode(node) {
    const range = document.createRange();
    range.selectNode(node);
    const selection = window.getSelection();
    selection.removeAllRanges();
    selection.addRange(range);
  }

  function copyLinkToClipboard(text, url) {
    if (window.clipboardData && window.clipboardData.setData) {
      return clipboardData.setData("Text", text);
    } else if (
      document.queryCommandSupported &&
      document.queryCommandSupported("copy")
    ) {
      var a = document.createElement("a");
      var linkText = document.createTextNode(text);
      a.appendChild(linkText);
      a.title = linkText;
      a.href = url;
      a.style.position = "fixed";
      document.body.appendChild(a);
      selectNode(a);
      try {
        return document.execCommand("copy");
      } catch (ex) {
        console.warn("Copy to clipboard failed.", ex);
        return false;
      } finally {
        document.body.removeChild(a);
      }
    }
  }

  function getDiffCounters() {
    const diffStats = document.querySelector(".diffstat");
    if (diffStats) {
      const diffText = diffStats.textContent.trim().replace(/\s+/g, " ");
      console.log("Found diffstat. Including in link: " + diffText);
      return diffText;
    }
    return "";
  }

  var href = window.location.href;
  var title = document.title;

  if (
    href.includes("github.com") &&
    href.includes("/pull/")
  ) {
    const diffCounters = getDiffCounters();
    if (diffCounters) {
      title += ` (${diffCounters})`;
    }
  }

  console.log(title);
  copyLinkToClipboard(title, href);
})();
