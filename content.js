(() => {
  // Set the regex for finding appropriate links
  const videoRegex = /^https:\/\/www\.tiktok\.com\/@[^/]+\/video\/\d+\/?$/;

  // Alerts
  function showToast(message, duration = 5000) {
  // Ensure a container exists
  let container = document.getElementById("tiktok-toast-container");
  if (!container) {
    container = document.createElement("div");
    container.id = "tiktok-toast-container";
    container.style.cssText = `
      position: fixed;
      top: 20px;
      left: 20px;
      display: flex;
      flex-direction: column;
      gap: 10px;
      z-index: 9999;
    `;
    document.body.appendChild(container);
  }

  // Create individual toast
  const toast = document.createElement("div");
  toast.textContent = message;
  toast.style.cssText = `
    background-color: #323232;
    color: #fff;
    padding: 14px 20px;
    border-radius: 10px;
    font-size: 16px;
    font-weight: 500;
    box-shadow: 0 3px 12px rgba(0, 0, 0, 0.25);
    max-width: 280px;
    opacity: 0;
    transform: translateY(-10px);
    transition: opacity 0.2s ease-out, transform 0.2s ease-out;
  `;

  container.appendChild(toast);

  // Animate in
  requestAnimationFrame(() => {
    toast.style.opacity = "1";
    toast.style.transform = "translateY(0)";
  });

  // Remove after delay
  setTimeout(() => {
    toast.style.opacity = "0";
    toast.style.transform = "translateY(-10px)";
    setTimeout(() => toast.remove(), 200); // remove after fade out
  }, duration);
}


    // Collect all anchor hrefs
  try{
    const links = Array.from(document.querySelectorAll("a"))
      .map(a => a.href)
      .filter(href => videoRegex.test(href));

    const uniqueLinks = [...new Set(links)];
    // If no usable links are found
    if (uniqueLinks.length === 0) {
    showToast("⚠️ No TikTok video links found.");
    } else {
    // If usable links are found, let them know we're starting downloading
      showToast(`✅ Found ${uniqueLinks.length} video links. Downloading...`);
    }
  } catch (err) {
      console.error("❌ Unexpected error during link extraction:", err);
      showToast("❌ Failed to extract links. Please try again.");
  }

  // Create a trigger download for file with links
  try {
    const blob = new Blob([JSON.stringify(uniqueLinks, null, 2)], {
      type: "application/json"
    });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = "tiktok_links.json";
    document.body.appendChild(a);
    a.click();

  // Sets timeout if download gets hung, otherwise completes
    setTimeout(() => {
      URL.revokeObjectURL(url);
      a.remove();
      showToast("💾 Download complete.");
    }, 1000);
  } catch (err) {
    console.error("❌ Error during file download:", err);
    showToast("❌ Download failed. Try refreshing the page.");
  }

})();