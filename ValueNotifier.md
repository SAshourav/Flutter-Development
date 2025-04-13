
## 🔁 What is `ValueNotifier`?

`ValueNotifier` is a **special class** in Flutter that lets you:
- Hold a single value (like an `int`, `bool`, `String`, or even a custom object)
- **Notify listeners when the value changes**.

It’s like a **lightweight state management tool**, perfect when you don’t want to use `setState()` or something heavy like Provider or Riverpod.

---

## 🔧 How Does It Work?

### Step-by-step:

#### 1️⃣ Create the Notifier:
```dart
ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);
```
This line:
- Creates a notifier object.
- Starts with an initial value (`0` in this case).
- You can change its value using `.value`.

#### 2️⃣ Use `.value` to Read or Write:
```dart
int currentPage = selectedPageNotifier.value; // Read

selectedPageNotifier.value = 1; // Write
```

Whenever you update `.value`, **it notifies all listeners**, and they rebuild.

---

### 🧠 What Listens for Changes?

#### `ValueListenableBuilder` is the listener:

```dart
ValueListenableBuilder(
  valueListenable: selectedPageNotifier,
  builder: (context, selectedPage, child) {
    return ...; // UI changes here based on selectedPage
  },
)
```

Every time `selectedPageNotifier.value` changes, this widget automatically rebuilds with the new value. No need to call `setState()` manually!

---

## 🔁 Your Code: What's Happening?

### 🔸 `ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);`

This is like a shared global variable with superpowers – it can notify widgets when it changes.

---

### 🔸 `ValueListenableBuilder` in the `body` of `WidgetTree`:

```dart
body: ValueListenableBuilder(
  valueListenable: selectedPageNotifier,
  builder: (context, selectedPage, child) {
    return pages.elementAt(selectedPage); // switch between HomePage and ProfilePage
  },
),
```

This listens to the selected page index and updates the screen when you tap the bottom nav.

---

### 🔸 `NavbarWidget` updates the value:

```dart
onDestinationSelected: (int value) {
  selectedPageNotifier.value = value;
},
```

When the user taps a nav item, you update the notifier’s value. This triggers the `ValueListenableBuilder` and refreshes the screen.

---

## 🧠 Summary

| Concept | Purpose |
|--------|---------|
| `ValueNotifier<T>` | Holds a value & notifies on changes |
| `.value` | Used to read/write the value |
| `ValueListenableBuilder` | Widget that rebuilds when value changes |
| Benefit | Avoids `setState`, easy state management |
