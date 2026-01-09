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

  function getPRNumber() {
    const href = window.location.href;
    const match = href.match(/\/pull\/(\d+)/);
    return match ? match[1] : null;
  }

  function getDiffCounters() {
    const diffStats = document.querySelector(".diffstat");
    if (diffStats) {
      const diffText = diffStats.textContent.trim().replace(/\s+/g, " ");
      console.log("Found diffstat: " + diffText);
      return diffText;
    }
    return "";
  }

  var href = window.location.href;
  var title = document.title;

  title = title.replace(/Pull Request #\d+/g, "");
  title = title.replace(/\s*by\s+[\w-]+\s*/g, "");
  title = title.replace(/\s*·\s*·\s*/g, " · ");
  title = title.trim();

  if (
    (href.includes("github.com")) &&
    href.includes("/pull/")
  ) {
    const prNumber = getPRNumber();
    const diffCounters = getDiffCounters();

    if (prNumber) {
      let formattedTitle = "#" + prNumber;

      if (diffCounters) {
        formattedTitle += " (" + diffCounters + ")";
      }

      formattedTitle += " " + title;
      title = formattedTitle;
    }
  }

  console.log(title);
  copyLinkToClipboard(title, href);
})();
