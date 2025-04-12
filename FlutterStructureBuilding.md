### 📄 **Flutter UI Cheat Sheet: `MyApp` Project**

#### ✅ What does this code do?
This Flutter app shows a basic UI with:
- A top app bar
- A drawer (side menu)
- Two floating action buttons
- A bottom navigation bar

---

### 🔍 **Code Breakdown**

---

#### 🚀 `void main() => runApp(MyApp());`
- This is the starting point of every Flutter app.
- It runs your app by calling the `MyApp` class.

---

#### 🧱 `class MyApp extends StatelessWidget`
- A **stateless widget** means the screen doesn’t change unless rebuilt from scratch.
- You’re using it to define the main structure of your app.

---

#### 🧪 `MaterialApp(...)`
- This wraps the entire app and gives it a **Material Design** look (Google’s design style).
- Key options:
  - `debugShowCheckedModeBanner: false`: Hides the red "debug" banner.
  - `theme: ThemeData(...)`: Sets the app’s color scheme using a dark theme with `Colors.teal`.

---

#### 🏗️ `Scaffold(...)`
The scaffold provides the **basic visual layout structure** like:
- AppBar
- Drawer
- Body
- Floating buttons
- Bottom navigation

---

### 📌 `AppBar(...)`
- The top bar of your app.
- `title: Text('Structure')`: App title text.
- `centerTitle: true`: Centers the title.
- `actions`: Adds a Login text and icon to the right.
- `backgroundColor: Colors.teal`: Sets the AppBar color.

📌 ❗You commented out `leading: Icon(...)`, which allowed the **default Drawer icon (hamburger menu)** to show.

---

### 📂 `drawer: Drawer(...)`
- Adds a **side menu** that slides in from the left.
- Includes:
  - `DrawerHeader`: A header at the top.
  - `ListTile`: A clickable row (currently just saying "Logout?").

---

### 🎈 `floatingActionButton: Column(...)`
- Floating buttons that appear at the bottom right.
- You used `Column` to stack **two floating action buttons**:
  - One with an `add` icon.
  - One with a `delete` icon.
- `heroTag` ensures buttons don’t crash when multiple FABs are used.

---

### 📱 `bottomNavigationBar: NavigationBar(...)`
- A modern-style **bottom navigation bar**.
- Contains two items:
  - Home
  - Profile
- `onDestinationSelected: (int value) => print(value)`: Prints the index (0 or 1) when user taps a tab.

---

### ✅ Summary of What You Learned

| Widget                | Purpose |
|----------------------|---------|
| `MaterialApp`         | Wraps the whole app and defines theme |
| `Scaffold`            | Creates the screen layout |
| `AppBar`              | Top bar with title and icons |
| `Drawer`              | Side menu (swipe from left) |
| `FloatingActionButton`| Floating buttons for actions |
| `NavigationBar`       | Bottom navigation between pages |

---

### 🎓 Tips for Next Steps

- Try using `StatefulWidget` if you want to change content when a nav item is clicked.
- Add more `ListTile` items in the drawer.
- Replace the `print()` statements with actual functionality.
