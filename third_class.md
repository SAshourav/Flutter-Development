
# 📘 Second Class - Widget Tree, Theme Switching, Navigation, and UI Widgets

## 🧠 Objectives
- Understand how to manage **Dark/Light Theme** using `ValueNotifier`.
- Learn how to **navigate between pages** using bottom navigation and buttons.
- Explore commonly used **Flutter widgets** inside a settings screen.
- Practice responsive UI building using `StatefulWidget` and `setState()`.

---

## 🌗 Theme Switching

### ✅ Uses:
- `ValueNotifier<bool>` named `isDarkNotifier`
- `ValueListenableBuilder` inside `main.dart` and `widget_tree.dart`

```dart
return ValueListenableBuilder(
  valueListenable: isDarkNotifier,
  builder: (context, isDarkMode, child) {
    return MaterialApp(
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

# ⚙️ How `SettingPage` Works in Flutter

---

## 🧭 Navigation using `Navigator` Module

In your app, you are using the **Navigator module** to switch between different screens.

### ✅ Navigation Trigger:
In `HomePage` or another screen, you navigate to the settings page like this:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => SettingPage(title: 'Settings'),
  ),
);
```

- This pushes the `SettingPage` onto the navigation stack.
- `SettingPage` is passed a `title` via its constructor.
- You can go **back** to the previous page using `Navigator.pop(context);`

---

## ⚙️ How `SettingPage` Manages Data

### 🧠 State Management
- `SettingPage` is a `StatefulWidget`.
- It stores and updates values using local state variables and `setState()`.

### 🗃️ Data Fields (State Variables)
```dart
bool? isChecked;
bool isSwitched = false;
double sliderValue = 0;
String? menuItem = "Element 1";
TextEditingController controller = TextEditingController();
```

These variables store the current state of:
- Checkboxes
- Switch
- Slider
- Dropdown
- TextField

### 🔄 Data Update Mechanism
Every interactive widget (like `Slider`, `Switch`, etc.) calls `setState()` inside their `onChanged`:

```dart
onChanged: (val) {
  setState(() {
    isChecked = val;
  });
}
```

This ensures the UI **rebuilds** and shows the latest value.

---

## 🧰 Widget Components Breakdown

### 📝 TextField
- Text is stored and displayed live using `TextEditingController`.

```dart
Text("You typed: ${controller.text}")
```

### ✅ Checkbox
- Can be null (tristate), true, or false.

### 🔀 Switch
- Toggles between true/false states.

### 🎚️ Slider
- Drag to change numeric values.
- Displayed live as: `You slided: ${sliderValue}`

### 🔽 DropdownButton
- Allows selection of one item from a list.
- The selected item is saved in `menuItem`.

---

## 🎯 Buttons in the Settings Page

You’ve used almost all types of **Flutter buttons**. Here’s a quick breakdown:

| Button Type       | Purpose                                                                 |
|--------------------|-------------------------------------------------------------------------|
| `ElevatedButton`   | Raised button, commonly used for main actions                          |
| `FilledButton`     | Filled background, modern variant for elevated                         |
| `OutlinedButton`   | Border-only, used for less-prominent actions                           |
| `TextButton`       | Minimal, text-only button                                               |
| `CloseButton`      | Automatically calls `Navigator.pop()` to close the current screen      |
| `BackButton`       | Goes back to the previous screen                                       |

### Example:
```dart
ElevatedButton(
  onPressed: () {
    Navigator.pop(context); // go back
  },
  child: Text("Back"),
)
```

These buttons show how to trigger navigation manually or perform other actions.

---

## 🖼️ Interaction Components

### 📸 GestureDetector
Wraps an image and prints a message on tap:
```dart
GestureDetector(
  onTap: () {
    print("Image Selected!");
  },
  child: Image.asset("assets/images/bg.jpg"),
)
```

### 💧 InkWell
Similar to `GestureDetector` but gives **ripple effects** (material-style feedback):
```dart
InkWell(
  splashColor: Colors.cyanAccent,
  onTap: () => print("Image Selected"),
  child: Container(...),
)
```

---

## 📂 Summary

| Feature             | Implementation                                                                 |
|----------------------|---------------------------------------------------------------------------------|
| Navigation           | `Navigator.push()` and `Navigator.pop()`                                       |
| Theme Switching      | `ValueNotifier` + `ValueListenableBuilder`                                     |
| UI Data Handling     | Stateful variables + `setState()`                                               |
| Input Controls       | `TextField`, `Dropdown`, `Slider`, `Checkbox`, `Switch`, `Radio` (can add)     |
| Buttons              | All types: `Elevated`, `Outlined`, `Text`, `Filled`, `Back`, `Close`           |
| Image Interaction    | With `GestureDetector` and `InkWell`                                           |

---

## 📌 Things to Try for Next Class

1. Add `RadioListTile` for user preferences.
2. Implement saving data permanently using `SharedPreferences`.
3. Modularize the widget sections using `Custom Widgets`.

---
