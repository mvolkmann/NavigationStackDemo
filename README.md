# NavigationStackDemo

This supports navigation via a URL.
To create a URL scheme:

- Select the top item in Navigator.
- Select the main target.
- Select the Info tab.
- Expand "URL Types".
- Click the "+" button.
- For "Identifier", enter the app bundle id found in the target General tab.
- For "URL Schemas", enter a name that is unique within the app
  such as "NavStack".
- "Icon" is not required.
- "Role" can keep the default value of "Editor".
- In the App subclass, add the "onOpenURL" view modifier to the initial view
  (ContentView here).
- In a terminal window, enter a command like these:

  - `xcrun simctl openurl booted NavStack://Canada`
  - `xcrun simctl openurl booted NavStack://Canada/Vancover`
  
- The app will ask for permission to receive a URL
  the first time a request is received.