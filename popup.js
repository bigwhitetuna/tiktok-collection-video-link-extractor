const extractButton = document.getElementById("extract");

// Get the active tab
browser.tabs.query({ active: true, currentWindow: true }, (tabs) => {
  const tab = tabs[0];
  const url = new URL(tab.url);

  const isTikTok = url.hostname.endsWith("tiktok.com");

  if (isTikTok) {
    extractButton.disabled = false;
    extractButton.addEventListener("click", () => {
      browser.tabs.executeScript(tab.id, {
        file: "content.js"
      });
    });
  } else {
    extractButton.disabled = true;
    extractButton.textContent = "❌ Not on TikTok";
    extractButton.style.backgroundColor = "#666";
    extractButton.style.cursor = "not-allowed";
    extractButton.title = "This extension only works on tiktok.com";
  }
});