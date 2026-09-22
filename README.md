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

The same tools also exist in React + TypeScript: [web-kit](https://github.com/ArthurKrantsevich/web-kit). Both collections have the same features and a similar look, but they share no code.

**No backend.** All processing happens on the user's device. Files and text never leave the browser.

## Status

> Early stage. The dashboard and the deploy pipeline are ready. The workspace setup and the first utilities are in progress.

## Utilities

| Utility | Category | Status |
|---|---|---|
| JSON formatter | data | planned |
| Base64 encode/decode | data | planned |
| URL encode/decode | data | planned |
| JWT decoder | data | planned |
| UUID generator (v4, v7) | generators | planned |
| Password generator | generators | planned |
| Hash generator (SHA, MD5) | generators | planned |
| QR code generator | generators | planned |
| Color palette generator | generators | planned |
| Image converter | media | planned |
| Video player | media | planned |

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
