## 📝 Flutter Beginner Cheat Sheet  
### 🔧 Project: `MyApp` UI Structure  
---

### ✅ What This App Does  
This Flutter app creates a simple user interface with:

- A top AppBar (title and login icon)  
- A Drawer (side navigation menu)  
- Two FloatingActionButtons  
- A Bottom Navigation Bar  
- It wraps everything in a `SafeArea` for safety from notches, system UI, etc.

---

## 🧱 Code Explanation  
Let's break this down step by step:

---

### 🚀 `void main() => runApp(MyApp());`  
- Entry point of the app.
- It runs the Flutter app and loads `MyApp`.

---

### 🌱 `StatelessWidget: MyApp`  
- This widget does **not store or update any state** (it stays the same unless the whole widget is rebuilt).
- Good for layouts that don’t need to change based on user interaction.

---

### 🎨 `MaterialApp`  
- Wraps the entire app.
- Provides default material design style, theme, and navigation.
- `debugShowCheckedModeBanner: false` removes the red debug label.
- `theme:` sets the app’s **dark theme** with a **teal seed color**.

---

### 🛡️ `SafeArea`  
✅ **What it does**:  
- Ensures that the UI **doesn't get cut off** by the phone's notch, status bar, or navigation bar.  
- Helps your app look better on all devices (especially new ones with curved edges or camera cutouts).

🔍 **Where you used it**:  
```dart
home: SafeArea(
  child: Scaffold(...),
)
```
- You wrapped your `Scaffold` in `SafeArea`, so everything (AppBar, Drawer, FAB, etc.) is kept **inside safe screen boundaries**.

---

### 🏗️ `Scaffold`  
- Provides basic visual layout: AppBar, Drawer, FAB, NavigationBar.

---

### 🔝 `AppBar`  
- Displays at the top of the screen.
- `title`: "Structure"
- `actions`: Login text and icon
- `centerTitle`: true — centers the title
- `backgroundColor`: teal

---

### 📂 `Drawer`  
- Slide-out menu from the left.
- Includes one `ListTile` with "Logout ?"

❗ You didn't use `DrawerHeader`, so it shows just the text item.

---

### 🎈 `FloatingActionButton`  
- You used **two FABs** inside a `Column`.
- Each button has:
  - `heroTag`: to prevent animation tag conflict.
  - `onPressed`: prints "Checking !"
  - Icons: `add` and `delete`
- `SizedBox(height: 10)`: Adds spacing between them.

---

### 📱 `NavigationBar` (Bottom Nav)  
- Displays two navigation options:
  - Home
  - Profile
- `onDestinationSelected`: prints the index (0 or 1) when clicked.

---

## ✅ Summary of Widgets Used

| Widget             | What It Does |
|--------------------|--------------|
| `MaterialApp`       | Main app setup with theme |
| `SafeArea`          | Keeps UI inside visible screen area |
| `Scaffold`          | Main layout structure |
| `AppBar`            | Top bar with title & icons |
| `Drawer`            | Side menu |
| `FloatingActionButton` | Action buttons at bottom right |
| `NavigationBar`     | Bottom tab bar with pages |

---

### 🧠 Things to Explore Next:
- Add `body:` inside `Scaffold` and show dynamic screen based on bottom navigation index.
- Use `StatefulWidget` to manage selected screen state.
- Style the `Drawer` with user profile image, background, etc.
