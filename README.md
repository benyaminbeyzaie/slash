# Slash/

<a href="https://github.com/benyaminbeyzaie/slash/actions"><img src="https://github.com/benyaminbeyzaie/slash/workflows/test/badge.svg" alt="Build Status"></a>

Slash is a simple wallpaper app.

|           Wallpapers           |      Single Wallpaper       |
| :----------------------------: | :-------------------------: |
| ![Wallpapers](/screenshots/1.png) | ![Single Wallpaper ](/screenshots/2.png) |

## Decisions, Technologies and Reasons

- **Folder Architecture**: semi-clean-architecture
  Semi-Clean Architecture helps you organize your Flutter project's codebase following a variation of Clean Architecture principles. It provides a structured approach to separate business logic from presentation, making the codebase more maintainable and scalable.

- **Routing**: auto_route
  Auto Route is a powerful routing package for Flutter that simplifies the process of handling navigation in your app. The best feature is under the hood code generation and passing params between pages, Also it supports web and url params.

- **State Management**: flutter_bloc
  It facilitates the separation of UI and business logic. It uses streams to manage application state and events, making it easier to handle complex state changes and interactions.

- **Unit Test**: mocktail, flutter_test
  Mocktail is a mocking library that enables you to create mock objects for testing purposes. Combined with Flutter's built-in testing framework, flutter_test, you can efficiently write unit tests to verify the behavior of individual components in isolation. I selected both for simplicity and they take care of all of my needs.

- **UI test, Golden Test**: golden_toolkit
  Backed by eBay, Ease of use, Many features, Running on the CI. Built upon flutter test bloc and can be changed with those APIs.

- **Cache**: cached_network_image
  [Flutter official recommendation](https://docs.flutter.dev/cookbook/images/cached-images)

- **Code Quality and Linters**: flutter_lints, dart_code_metrics
  They provide predefined lint rules and static analysis tools to detect and enforce consistent coding patterns, leading to cleaner and more maintainable code.

  - **Dependency Injection**: get_it

## Features

- Get list of wallpapers form api with cached iamges
- Pagination and infinite list
- See the each wallpaper in single page with more details
- Supporting Web (Specially done good work on url handling and navigation)
- Supporting iOS and Android
- Downloader feature with Progress Indicator, Saves file to the gallery, Optimized for large files and small memories (Implemented with BLoC)
- Hero animation between page changes
- Well tested page controllers and Golden tested UI
- Fully decomposed UI from Logic
- CI running pipeline for tests
- Dependency injection and abstraction on repositories
- Threashhold on golden tests
- Native splash screen on every platfrom
- Improve user experince with Shimmers
