# TikTok Video Link Extractor

A lightweight, privacy-respecting Firefox extension that extracts video links from TikTok collection pages and downloads them as a JSON file.

Intended to work with [TikTok Recipe Builder](https://github.com/bigwhitetuna/TikTok-Recipe-Builder) as it is completed.

## Features

- Extracts all video links from the current TikTok collection page
- Automatically downloads the links as `tiktok_links.json`
- Smart toast notifications for status updates
- Detects when you're not on TikTok and disables the UI accordingly
- Runs entirely client-side — no tracking, no network requests

## How to Use

1. Go to a TikTok collection or profile video grid.
2. Scroll to the bottom of the page to ensure all videos are loaded.
3. Click the extension icon in your browser toolbar.
4. Click the "Download TikTok Links" button.
5. A `tiktok_links.json` file will be downloaded with all video URLs.

## Installation

Coming soon to:

- [Firefox Add-ons (AMO)](https://addons.mozilla.org/)
- [Chrome Web Store](https://chrome.google.com/webstore/category/extensions)

For now, you can install it manually:

- [Direct Download (ZIP)](https://github.com/bigwhitetuna/tiktok-link-extractor/releases/latest)

### Temporary Install (Firefox)

1. Download or clone this repository.
2. In Firefox, go to `about:debugging#/runtime/this-firefox`.
3. Click **"Load Temporary Add-on..."** and select `manifest.json`.

## Privacy

This extension does not collect or transmit any data. All processing is done locally in the browser. It requires no special permissions beyond access to the active TikTok tab.

## Development

To run locally:

```bash
git clone https://github.com/yourusername/tiktok-link-extractor.git
cd tiktok-link-extractor
```

Load the extension temporarily via about:ddbugging as described above. Changes to content or popup scripts require reloading the extension.

## Issues / Feedback
Please open an issue if you have any requests or notice a bug!

## License
MIT