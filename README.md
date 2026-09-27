<div align="center">

# flutter-kit

**Small, useful web utilities as Flutter and Dart packages. Everything runs in your browser.**

[![Deploy](https://github.com/ArthurKrantsevich/flutter-kit/actions/workflows/deploy.yml/badge.svg)](https://github.com/ArthurKrantsevich/flutter-kit/actions/workflows/deploy.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
![Flutter](https://img.shields.io/badge/Flutter-3.47-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3-0175C2?logo=dart)
![Web: WASM](https://img.shields.io/badge/web-WASM-654ff0?logo=webassembly&logoColor=white)

[**Live demo**](https://arthurkrantsevich.github.io/flutter-kit/) · [React version](https://github.com/ArthurKrantsevich/web-kit) · [Русский](README.ru.md)

</div>

---

## What is this

`flutter-kit` is a collection of small tools for the web: formatters, converters, generators, a video player and more. Each tool is published as two pub.dev packages: pure Dart logic and a Flutter widget on top of it.

The same tools exist in React + TypeScript: [web-kit](https://github.com/ArthurKrantsevich/web-kit), which already works — [try it live](https://arthurkrantsevich.github.io/web-kit/). flutter-kit follows its features and look, but the two share no code.

**No backend.** All processing happens on the user's device. Files and text never leave the browser.

## Status

> Early stage. The dashboard and the deploy pipeline are ready. The workspace setup and the first utilities are in progress.

## Utilities

Every Flutter version below is planned. The web column says where the same tool stands in [web-kit](https://github.com/ArthurKrantsevich/web-kit).

| Utility | Category | Flutter | Web (web-kit) | What it does |
|---|---|---|---|---|
| JSON Formatter | data | planned | [ready](https://arthurkrantsevich.github.io/web-kit/tools/json-formatter/) | Format, minify, sort keys, escape and unescape; exact error positions and fixes offered only after they were checked; a tree with search and JSONPath; stats. |
| JSON Convert | data | planned | [ready](https://arthurkrantsevich.github.io/web-kit/tools/json-convert/) | JSON to YAML, CSV, XML and TypeScript, and CSV to JSON, with numbers kept exactly as written. |
| JSON Diff | data | planned | [ready](https://arthurkrantsevich.github.io/web-kit/tools/json-diff/) | Every change with its path and values, arrays by index or by key, a JSON Patch. |
| JSON Schema Validator | data | planned | [ready](https://arthurkrantsevich.github.io/web-kit/tools/json-schema-validator/) | Draft 2020-12, every error with its path in the data and the schema, a schema generated from the data. |
| Base64 | data | planned | planned | Encode and decode text and files, with correct UTF-8. |
| URL Encoder | data | planned | planned | Encode and decode URLs and their parts; take a query string apart. |
| JWT Decoder | data | planned | planned | Header, payload and expiry; the signature is not checked. |
| Text Compare | data | planned | planned | Compare two texts or files, described below. |
| UUID Generator | generators | planned | planned | v4 and v7, one or many at a time. |
| Password Generator | generators | planned | planned | Length and character sets, a secure random source, an entropy estimate. |
| Hash Generator | generators | planned | planned | SHA-1, SHA-256, SHA-384, SHA-512 and MD5. |
| QR Code Generator | generators | planned | planned | Text or a link to a QR code, saved as PNG or SVG. |
| Palette Generator | generators | planned | planned | A palette from one color, with WCAG contrast checks. |
| Image Converter | media | planned | planned | PNG, JPG and WebP, resizing and quality. |
| Video Player | media | planned | planned | Speed control, VTT subtitles, keyboard shortcuts, picture-in-picture. |

### Text Compare (planned)

A plan for both collections: compare two texts or files side by side or in one column; highlight differences by line, word and character; ignore whitespace, case, empty lines and line endings if asked; scroll both sides together and jump between changes; move a change to the other side and reset; count added, removed and changed lines and export a unified diff (`.patch`); open or drop files, with large files handled off the main thread.

### What every tool will have

As in web-kit today: open a file or drop it on an input, paste, download the result, load from a URL (straight from the browser, no cookies), a share link that keeps the data after `#`, saving the input in the browser (off by default), keyboard shortcuts with a `?` list, light and dark themes, and the same actions in the same places in every tool.

## How a package will look

Every utility is two packages:

```dart
// Pure Dart logic. No Flutter SDK: works in CLI tools, servers, any Dart code.
import 'package:prefix_json_formatter_core/prefix_json_formatter_core.dart';

// Flutter widget. Also re-exports the core.
import 'package:prefix_json_formatter/prefix_json_formatter.dart';
```

Packages use `package:web` and `dart:js_interop` only, so they are WASM-ready. The package prefix will be chosen before the first release.

## Repository layout

```
apps/
  dashboard/        Flutter web showcase, deployed to GitHub Pages
packages/           core + widget packages per utility (coming soon)
tool/               build checks
.github/workflows/  build, test and deploy
```

## Development

Requirements: Flutter 3.47 (stable).

```bash
cd apps/dashboard
flutter pub get
flutter run -d chrome                                   # dev
flutter test                                            # tests
flutter build web --wasm --base-href /flutter-kit/      # production build
```

Every push to `main` builds the dashboard and deploys it to GitHub Pages.

## License

[MIT](LICENSE) © Arthur Krantsevich
