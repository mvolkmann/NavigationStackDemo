# NavigationStackDemo

This application demonstrates the new navigation API added in iOS 16.

<img href="images/swiftui-navigation-01-fruits.png" />
<img href="images/swiftui-navigation-02-fruit.png" />
<img href="images/swiftui-navigation-03-authors.png" />
<img href="images/swiftui-navigation-04-author.png" />
<img href="images/swiftui-navigation-05-stack.png" />
<img href="images/swiftui-navigation-06-stack.png" />
<img href="images/swiftui-navigation-07-stack.png" />
<img href="images/swiftui-navigation-08-split.png" />
<img href="images/swiftui-navigation-09-split.png" />
<img href="images/swiftui-navigation-10-split.png" />

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
- Launch the Simulator.  The app does not need to be running in the Simulator.
- In a terminal window, enter a command like these:

  - `xcrun simctl openurl booted NavStack://Canada`
  - `xcrun simctl openurl booted NavStack://Canada/Vancover`
  
- The URLs above can also be links in an email or reminder.
  Clicking these links will launch the app if it is not already running
  and will navigate to the appropriate navigation path.  
  
- The app will ask for permission to receive a URL
  the first time a request is received.
