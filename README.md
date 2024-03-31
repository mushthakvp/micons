# M-Icons

M-Icons is a free icon pack for Flutter applications, providing a wide range of high-quality icons to enhance your Flutter projects. Our icons are designed to be simple, scalable, and adaptable to any application theme.

![Flutter Iconly Web](assets/icons.png)

## Installation

To use M-Icons in your Flutter project, add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  micons: ^0.1.0
```

## Usage

After installation, you can start using the icons in your Flutter application. Here is a simple example of how to use an icon from M-Icons using the MIcons widget:

```dart
import 'package:flutter/material.dart';
import 'package:m_icons/m_icons.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MIcons(
      icon: MiCons.badgeCheck, // Use the icon you need from MIcons
      color: Colors.black, // Icon color
      size: 80, // Icon size
      filled: true, // Filled style if available
    );
  }
}
```

In this example, MiCons.badgeCheck is the icon being used, but you can replace MiCons.badgeCheck with any icon name from the M-Icons pack that suits your needs.

