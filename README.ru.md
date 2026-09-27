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

`flutter-kit` — набор небольших инструментов для веба: форматтеры, конвертеры, генераторы, видеоплеер и другие. Каждый инструмент будет опубликован как два пакета на pub.dev: логика на чистом Dart и Flutter-виджет поверх неё.

Те же инструменты запланированы на React + TypeScript в [web-kit](https://github.com/ArthurKrantsevich/web-kit), где пять из них уже работают: JSON Formatter, JSON Convert, JSON Diff, JSON Schema Validator и Text Compare — [демо](https://arthurkrantsevich.github.io/web-kit/). flutter-kit повторяет его функции и внешний вид, но общего кода у наборов нет.

**Без бэкенда.** Вся обработка идёт на устройстве пользователя. Файлы и текст не покидают браузер.

## Статус

> Ранняя стадия. Витрина и деплой готовы. Настройка workspace и первые утилиты в работе.

## Утилиты

Все Flutter-версии ниже в планах. Колонка «Веб» показывает, где тот же инструмент в [web-kit](https://github.com/ArthurKrantsevich/web-kit).

| Утилита | Категория | Flutter | Веб (web-kit) | Что умеет |
|---|---|---|---|---|
| JSON Formatter | data | в планах | [готово](https://arthurkrantsevich.github.io/web-kit/tools/json-formatter/) | Форматирование, минификация, сортировка ключей, escape и unescape; точные позиции ошибок и исправления только после проверки; дерево с поиском и JSONPath; статистика. |
| JSON Convert | data | в планах | [готово](https://arthurkrantsevich.github.io/web-kit/tools/json-convert/) | JSON в YAML, CSV, XML и TypeScript и CSV в JSON, числа сохраняют запись. |
| JSON Diff | data | в планах | [готово](https://arthurkrantsevich.github.io/web-kit/tools/json-diff/) | Каждое изменение с путём и значениями, массивы по индексу или по ключу, JSON Patch. |
| JSON Schema Validator | data | в планах | [готово](https://arthurkrantsevich.github.io/web-kit/tools/json-schema-validator/) | Draft 2020-12, каждая ошибка с путём в данных и в схеме, схема по данным. |
| Base64 | data | в планах | в планах | Кодирование и декодирование текста и файлов с корректным UTF-8. |
| URL Encoder | data | в планах | в планах | Кодирование и декодирование URL и их частей; разбор query-строки. |
| JWT Decoder | data | в планах | в планах | Заголовок, payload и срок действия; подпись не проверяется. |
| Text Compare | data | в планах | [готово](https://arthurkrantsevich.github.io/web-kit/tools/text-compare/) | Сравнение двух текстов или файлов по строкам, словам или символам, перенос изменений, экспорт патча; описано ниже. |
| UUID Generator | generators | в планах | в планах | v4 и v7, по одному или пачкой. |
| Password Generator | generators | в планах | в планах | Длина и наборы символов, криптостойкий генератор, оценка энтропии. |
| Hash Generator | generators | в планах | в планах | SHA-1, SHA-256, SHA-384, SHA-512 и MD5. |
| QR Code Generator | generators | в планах | в планах | Текст или ссылка в QR-код, сохранение в PNG или SVG. |
| Palette Generator | generators | в планах | в планах | Палитра от одного цвета с проверкой контраста WCAG. |
| Image Converter | media | в планах | в планах | PNG, JPG и WebP, изменение размера и качества. |
| Video Player | media | в планах | в планах | Скорость, субтитры VTT, горячие клавиши, картинка в картинке. |

### Text Compare

Готово в [web-kit](https://arthurkrantsevich.github.io/web-kit/tools/text-compare/), во Flutter в планах: сравнение двух текстов или файлов рядом или одной колонкой; подсветка изменённых слов или символов в изменённых строках; по желанию без учёта пробелов, регистра, пустых строк и концов строк; общая прокрутка, свёрнутые неизменённые строки и переход между изменениями; перенос изменения на другую сторону (Ctrl+Z его отменяет, кроме стороны из файла с концами строк CRLF или CR: она заменяется целиком, чтобы их сохранить); подсчёт добавленных, удалённых и изменённых строк и экспорт unified diff (`compare.patch`), который всегда применяется к Left через `git apply` (с опциями игнора он даёт Right с точностью до игнорируемых различий); открытие и перетаскивание файлов, тексты больше 1 МБ сравниваются вне основного потока.

### Что будет в каждом инструменте

Как в web-kit сейчас: открыть файл или перетащить его на поле ввода, вставить из буфера, скачать результат, загрузить по URL (прямо из браузера, без cookies), ссылка для обмена с данными после `#`, сохранение ввода в браузере (по умолчанию выключено), горячие клавиши со списком по `?`, светлая и тёмная темы и одинаковые действия на одинаковых местах во всех инструментах.

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
