# 📘 Flutter App Cheat Sheet (Second Class)

This file documents and explains your basic Flutter app setup with complete code, focused on:
- App structure
- Widget usage
- Navigation
- Dark mode toggle using `ValueNotifier`

---

## 📦 File: `main.dart`

```dart
import 'package:flutter/material.dart';
import 'package:practice_3/data/notifiers.dart';
import 'package:practice_3/views/widget_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return ValueListenableBuilder(
      valueListenable: isDarkNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
            ),
          ),
          home: WidgetTree(),
        );
      },
    );
  }
}
```

### 🧠 Explanation:
- `ValueListenableBuilder`: Listens for changes in the `isDarkNotifier` boolean.
- `MaterialApp`: Uses `ThemeData` to change theme dynamically based on the `isDarkNotifier` value.

---

## 📦 File: `notifiers.dart`

```dart
import 'package:flutter/cupertino.dart';

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);
ValueNotifier<bool> isDarkNotifier = ValueNotifier(true);
```

### 🧠 Explanation:
- `ValueNotifier`: A special Flutter class used to update UI reactively without `setState()`.
- `selectedPageNotifier`: Tracks the current index of the bottom navigation.
- `isDarkNotifier`: Toggles between dark and light themes.

---

## 📦 File: `widget_tree.dart`

```dart
import 'package:flutter/material.dart';
import 'package:practice_3/data/notifiers.dart';
import 'package:practice_3/views/pages/home_page.dart';
import 'package:practice_3/views/pages/profile_page.dart';
import 'package:practice_3/views/widgets/navbar_widget.dart';

List<Widget> pages = [
  HomePage(),
  ProfilePage(),
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Structure'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                isDarkNotifier.value = !isDarkNotifier.value;
              },
              icon: ValueListenableBuilder(
                valueListenable: isDarkNotifier,
                builder: (context, isDarkMode, child) {
                  return Icon(
                    isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  );
                },
              ),
            ),
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: selectedPageNotifier,
          builder: (context, selectedPage, child) {
            return pages.elementAt(selectedPage);
          },
        ),
        bottomNavigationBar: NavbarWidget(),
      ),
    );
  }
}
```

### 🧠 Explanation:
- `SafeArea`: Prevents UI from being drawn under system UI (like status bar).
- `AppBar`: Includes a toggle button to switch between dark and light modes.
- `ValueListenableBuilder`: Listens to `selectedPageNotifier` to show the correct page.

---

## 📦 File: `navbar_widget.dart`

```dart
import 'package:flutter/material.dart';
import 'package:practice_3/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          ],
          onDestinationSelected: (int value) {
            selectedPageNotifier.value = value;
          },
          selectedIndex: selectedPage,
        );
      },
    );
  }
}
```

### 🧠 Explanation:
- This widget listens to `selectedPageNotifier` and updates the bottom navigation bar accordingly.

---

## 📦 File: `home_page.dart`

```dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Homepage page"),
    );
  }
}
```

---

## 📦 File: `profile_page.dart`

```dart
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Profile page"),
    );
  }
}
```

---

## 🌙 Dark Mode Toggle Explained

**Logic:**
- Controlled by `isDarkNotifier`.
- When `IconButton` is tapped:
  ```dart
  isDarkNotifier.value = !isDarkNotifier.value;
  ```
- This triggers `ValueListenableBuilder` in `main.dart`, changing the theme.
- `MaterialApp` rebuilds with either:
  - `Brightness.dark` 🌑
  - `Brightness.light` ☀️

---

## 📌 Summary
- `ValueNotifier`: Manages reactive state.
- `ValueListenableBuilder`: Reactively updates UI.
- `SafeArea`: Keeps UI elements safe from notches/status bars.
- `NavigationBar`: Provides bottom navigation.
- `MaterialApp` and `ThemeData`: Used for dark/light mode theming.

> ✅ This app is a great first step in mastering Flutter. It combines navigation, theme switching, and state management basics with clean architecture.


Let me know if you'd like a downloadable `.md` or `.pdf` version!

