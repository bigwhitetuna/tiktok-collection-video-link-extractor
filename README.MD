# TikTok Video Link Extractor

A lightweight, privacy-respecting browser extension that extracts video links from TikTok collection pages and downloads them as a JSON file.

Designed to work alongside [TikTok Recipe Builder](https://github.com/bigwhitetuna/TikTok-Recipe-Builder) as it evolves.

---

## 🔍 Features

- Extracts all TikTok video links from collection or profile pages
- Smart toast notifications for extraction and download status
- Detects when you're not on TikTok and disables the UI
- Automatically downloads links as `tiktok_links.json`
- **Privacy-first**: Runs entirely client-side — no network requests, no tracking

---

## 🧭 How to Use

1. Navigate to a TikTok collection or user video grid.
2. Scroll to the bottom to load all videos.
3. Click the extension icon in your browser toolbar.
4. Click **"Download TikTok Links"**.
5. You'll receive a JSON file with all video URLs.

---

## 🛠️ Installation

### 🔌 Coming soon
- [Firefox Add-ons (AMO)](https://addons.mozilla.org/en-US/firefox/addon/tiktok-video-link-extractor/)
- [Chrome Web Store](https://chrome.google.com/webstore/category/extensions)

### 🧪 Manual Installation (for now)
Download the latest release ZIP:

📦 [Direct Download (GitHub Releases)](https://github.com/bigwhitetuna/tiktok-link-extractor/releases/latest)

#### Firefox (Temporary Install)
1. Download or clone this repository.
2. Open `about:debugging#/runtime/this-firefox` in Firefox.
3. Click **“Load Temporary Add-on…”** and select `manifest.json`.

---

## 🔐 Privacy

This extension **does not collect, track, or transmit** any data. It processes everything locally in the browser, and only requests access to TikTok tabs where you manually activate it.

---

## 🧑‍💻 For Developers

This project uses minimal tooling and can be run or extended easily.

### 🗂 Structure
.
├── manifest.json
├── background.js
├── content.js
├── popup.html
├── popup.js
├── icon.png
├── README.md
├── .github/workflows/auto-release.yml
└── build/
├── build.sh
└── bump-version.sh

### ⚙️ Scripts

#### release.sh

Accepts a version # as an argument

```bash
build/release.sh v1.0.5
```

Does the following:
- Bumps versions in each manifest doc to specified version
- git commits the version #
- git tags w/ version #
- git push w/ tag (to trigger release build in github actions)

#### 🔧 `build.sh`
Creates a ZIP of the current extension based on the `manifest.json` version. This is an optional script for generating local zips for testing.

```bash
./build/build.sh
```

Outputs a file for both chrome and firefox:
```bash
tiktok-video-link-extractor-v1.2.0.zip
```

#### 🆙 'bump-version.sh'
Updates the version field in manifest.json

```bash
./build/bump-version.sh 1.2.3
```

Use before creating a release - syncs your manifest version with GitHub Actions automation

### 🚀 GitHub Actions

When you push a version tag (e.g. v1.2.0), a GitHub Action will:
- Create a zip for both Chrome and Firefox upload, using unique manifests.<browser>.json to make the required manifest.json file
- Add both files to newest release, based on tag version pushed

No manual zipping or upload needed.


## 🐛 Issues / Feedback

Found a bug? Have a suggestion? Open an issue — contributions and feedback are very welcome.


## 📄 License

MIT — use it, modify it, share it.


## 🙌 Acknowledgements

Built to simplify scraping for use with TikTok Recipe Builder, but useful on its own.