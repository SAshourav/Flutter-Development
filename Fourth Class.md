### 📱 Flutter Fourth Class - Settings, Navigation & UI Components

#### 🚀 Project Overview
This Flutter project introduces key widgets and concepts related to:
- Navigating between pages using `Navigator.push` and `Navigator.pop`
- Building a customizable **Settings Page**
- Using various **UI controls** like `TextField`, `Checkbox`, `Switch`, `Slider`
- Incorporating `Snackbar`, `AlertDialog`, and `AboutDialog`
- Working with `Hero` animations and background visuals
- Managing state with `setState` and form input with `TextEditingController`

---

### 📁 File Breakdown

| File | Description |
|------|-------------|
| `setting_page.dart` | Stateful settings page that uses a variety of UI widgets. |
| `welcome_page.dart` | Login-style welcome screen with background animation. |
| `profile_page.dart` | Displays user profile and logout functionality. |
| `hero_widget.dart` | Hero widget showing a background image with animation. |

---

### 🧩 Widget Breakdown (setting_page.dart)

- ✅ `TextField`: Captures user input with live display.
- 🔲 `Checkbox` & `CheckboxListTile`: Allows 3-state checking (`true`, `false`, `null`).
- 🔘 `Switch` & `SwitchListTile`: Toggle on/off state.
- 🎚️ `Slider`: Adjust a value from 0 to 10.
- 🖼️ `GestureDetector` / `InkWell`: Tappable containers/images.
- 🎛️ `DropdownButton`: Choose between "Element 1", "Element 2", or "Element 3".
- 📣 `Snackbar`: Shows floating temporary message.
- ⚠️ `AlertDialog`: Popup dialog with confirmation.
- 📝 `AboutDialog`: Displays app info.
- ➕ `Divider` & `VerticalDivider`: Separators for better layout visuals.
- 🎨 `FilledButton`, `ElevatedButton`, `OutlinedButton`, `TextButton`: Various button styles.

---

### 🔄 Navigation in Flutter: `push` vs `pop`

| Method | Description | Use When |
|--------|-------------|----------|
| `Navigator.push(context, ...)` | Adds a new page to the navigation stack. | Moving **forward** to a new screen. |
| `Navigator.pop(context)` | Removes the current page and returns to the previous one. | Going **back** to the previous screen (like with a Back button). |

**Example from your code:**
```dart
leading: BackButton(onPressed: () {
  Navigator.pop(context); // Go back to the previous screen
});
```

> ❗ Use `pop` when the current page was reached via `push`, and you want to return.

---

### 🔔 SnackBar

```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text("Snackbar"),
    behavior: SnackBarBehavior.floating,
  ),
);
```
- Lightweight notification
- Useful for temporary messages (e.g., form submitted, item deleted)

---

### ⚠️ AlertDialog

```dart
showDialog(
  context: context,
  builder: (context) {
    return AlertDialog(
      title: Text("Alert title"),
      content: Text("Alert content"),
      actions: [
        FilledButton(onPressed: () {
          Navigator.pop(context); // Dismiss alert
        }, child: Text("Close"))
      ],
    );
  },
);
```
- Use for critical messages, confirmations, or decision prompts.

---

### ℹ️ AboutDialog

```dart
showDialog(
  context: context,
  builder: (context) {
    return AboutDialog();
  },
);
```
- Prebuilt dialog to display application name, version, legal notices, etc.

---

### 🖼️ Hero Animation (hero_widget.dart)

```dart
Hero(
  tag: 'hero1',
  child: Image.asset('assets/images/bg.jpg')
);
```
- Enables **smooth transitions** between screens using a shared `Hero` tag.
- Useful for **image or avatar transitions** between pages.

---

### 🔚 Logout Flow (profile_page.dart)

- Uses `FilledButton.icon` to navigate back to the Welcome screen:
```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => const WelcomePage()),
);
```

---

### 📝 Summary

This project is a practical example of combining multiple Flutter concepts:
- Basic navigation (`push`, `pop`)
- Form input
- UI interaction with buttons, sliders, switches
- Displaying dialogs/snackbars
- Animations with Hero widgets
- Organizing screens with modern Material Design principles
