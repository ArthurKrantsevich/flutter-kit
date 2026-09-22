<div align="center">

# flutter-kit

**Небольшие полезные веб-утилиты в виде пакетов на Flutter и Dart. Всё работает в браузере.**

[![Deploy](https://github.com/ArthurKrantsevich/flutter-kit/actions/workflows/deploy.yml/badge.svg)](https://github.com/ArthurKrantsevich/flutter-kit/actions/workflows/deploy.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
![Flutter](https://img.shields.io/badge/Flutter-3.47-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3-0175C2?logo=dart)
![Web: WASM](https://img.shields.io/badge/web-WASM-654ff0?logo=webassembly&logoColor=white)

[**Демо**](https://arthurkrantsevich.github.io/flutter-kit/) · [Версия на React](https://github.com/ArthurKrantsevich/web-kit) · [English](README.md)

</div>

---

## Что это

`flutter-kit` — набор небольших инструментов для веба: форматтеры, конвертеры, генераторы, видеоплеер и другие. Каждый инструмент публикуется как два пакета на pub.dev: логика на чистом Dart и Flutter-виджет поверх неё.

Те же инструменты есть на React + TypeScript: [web-kit](https://github.com/ArthurKrantsevich/web-kit). Функции и внешний вид совпадают, но общего кода у наборов нет.

**Без бэкенда.** Вся обработка идёт на устройстве пользователя. Файлы и текст не покидают браузер.

## Статус

> Ранняя стадия. Витрина и деплой готовы. Настройка workspace и первые утилиты в работе.

## Утилиты

| Утилита | Категория | Статус |
|---|---|---|
| JSON-форматтер | data | в планах |
| Base64 encode/decode | data | в планах |
| URL encode/decode | data | в планах |
| JWT-декодер | data | в планах |
| Генератор UUID (v4, v7) | generators | в планах |
| Генератор паролей | generators | в планах |
| Генератор хешей (SHA, MD5) | generators | в планах |
| Генератор QR-кодов | generators | в планах |
| Генератор цветовых палитр | generators | в планах |
| Конвертер изображений | media | в планах |
| Видеоплеер | media | в планах |

## Как будет выглядеть пакет

У каждой утилиты два пакета:

```dart
// Логика на чистом Dart. Flutter SDK не нужен: работает в CLI, на сервере, в любом Dart-коде.
import 'package:prefix_json_formatter_core/prefix_json_formatter_core.dart';

// Flutter-виджет. Реэкспортирует core.
import 'package:prefix_json_formatter/prefix_json_formatter.dart';
```

Пакеты используют только `package:web` и `dart:js_interop`, поэтому совместимы с WASM. Префикс пакетов выберем перед первым релизом.

## Структура репозитория

```
apps/
  dashboard/        витрина на Flutter web, деплой на GitHub Pages
packages/           core- и widget-пакеты для каждой утилиты (скоро)
tool/               проверки сборки
.github/workflows/  сборка, тесты, деплой
```

## Разработка

Нужен Flutter 3.47 (stable).

```bash
cd apps/dashboard
flutter pub get
flutter run -d chrome                                   # разработка
flutter test                                            # тесты
flutter build web --wasm --base-href /flutter-kit/      # production-сборка
```

Каждый push в `main` собирает витрину и деплоит её на GitHub Pages.

## Лицензия

[MIT](LICENSE) © Arthur Krantsevich
