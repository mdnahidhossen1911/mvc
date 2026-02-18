# mvc

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


~~~

assets/
├── fonts/
├── icons/
└── images/

lib/
├── main.dart
├── app.dart
│
├── core/
│   ├── constants/
│   │   ├── app_urls.dart
│   │   ├── assets_icon.dart
│   │   └── assets_image.dart
│   ├── dependency/
│   │   └── app_binding.dart
│   ├── error/
│   │   └── app_exception.dart
│   ├── extensions/
│   │   └── space_gap.dart
│   ├── network/
│   │   ├── base_api.dart
│   │   └── network_api.dart
│   ├── router/
│   │   └── app_router.dart
│   ├── theme/
│   │   ├── app_color.dart
│   │   └── app_theme.dart
│   └── utils/
│       ├── logger.dart
│       ├── message.dart
│       └── validators.dart
│
├── controller/
│   └── auth/
│       ├── sign_in_controller.dart
│       └── sign_up_controller.dart
│
├── model/
│   └── auth/
│       └── login_request_model.dart
│
├── repository/
│   └── auth/
│       └── auth_repo.dart
│
├── shared/
│   ├── app_text.dart
│   ├── app_text_field.dart
│   ├── button_with_loading.dart
│   ├── custom_app_bar.dart
│   ├── lebeled_text_field.dart
│   └── or_divider.dart
│
└── view/
    ├── auth/
    │   └── sign_in_view.dart
    └── home/
        ├── widget/
        │   └── h_app_bar.dart
        └── home_view.dart


~~~