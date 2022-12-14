# NavigationStackDemo

## Overview

iOS 16 introduced new ways to manage screen navigation.

See the WWDC 2022 video on the new navigation API titled
{% aTargetBlank
"https://developer.apple.com/videos/play/wwdc2022/10054/",
"The SwiftUI cookbook for navigation" %}.

Also see the excellent YouTube videos from Stewart Lynch:

- <a href="https://www.youtube.com/watch?v=6-OeaFfDXXw">NavigationStack in iOS 16</a>
- <a href="https://www.youtube.com/watch?v=pwP3_OX2G9A">Back to Root and Deep Links</a>
- <a href="https://www.youtube.com/watch?v=RsmMLLL8FB0">NavigationSplitView in iOS 16</a>

## Example App

See
<a href="https://github.com/mvolkmann/NavigationStackDemo">NavigationStackDemo</a>
which demonstrates everything shared in the Steward Lynch videos linked above.

The app has four tabs.

### Fruits tab

The first tab "Fruits" uses a `NavigationStack` to allow the user
to select a fruit from a `List` of `NavigationLink` views.

![Fruits List](images/swiftui-navigation-01-fruits.png)

When a fruit is selected, a view that displays "You chose {fruit-emoji}."
is pushed onto the navigation stack.

![Fruits Detail](images/swiftui-navigation-02-fruit.png)

Click "< Fruits" in the upper-left to return to the list of fruits.
The "Show Favorite" button at the bottom demonstrates a `NavigationList`
that is outside of the `List`.
The "Smile" button at the bottom demonstrates a `NavigationList`
that takes advantage of the fact that the only registered
`navigationDestination` handles any `String` value.

### Authors tab

The second tab "Authors" uses a `NavigationStack` to allow the user
to select an `Author` from a `List` of `NavigationLink` views.

![Authors List](images/swiftui-navigation-03-authors.png)

When an author is selected, a view that displays specific information
about the author is pushed onto the navigation stack.

![Author Detail](images/swiftui-navigation-04-author.png)

There are four `navigationDestination` registrations that handle the types:

- `String` for author name
- `Int` for number of books by an author
- `Color` for a color associated with an author
- `Author` for an entire `Author` object

The "Random" button selects a random author
and displays information about that author.

### Countries Stack tab

The third tab "Countries Stack" uses a `NavigationStack` to allow the user
to select a `Country` from a `List` of `NavigationLink` views.

![Countries List](images/swiftui-navigation-05-stack.png)

When a country is selected, a view that displays a list of
cities in the country is pushed onto the navigation stack.

![Cities List](images/swiftui-navigation-06-stack.png)

Each city is represented by a `NavigationLink`. Tapping one of these pushes
a view onto the stack that displays detailed information about that city.
A star icon is displayed behind the information
if the city is the capital of its country.
A bar chart showing the population of each supported city in the same country
is displayed below the city data.
The "Back to Countries" button demonstrates popping back to
the initial view in this tab.

![City Detail](images/swiftui-navigation-07-stack.png)

### Countries Split tab

The fourth tab "Countries Split" is similar to the third tab,
but uses a `NavigationSplitView` instead of a `NavigationStack`.
This provides a three-column view where
the first column contains a list of countries,
the second column contains a list of cities in the selected country,
and the third column contains detail about the selected city.
Having a "Back to Countries" button doesn't apply in this scenario.

![Countries List](images/swiftui-navigation-08-split.png)

![Cities List](images/swiftui-navigation-09-split.png)

![City Detail](images/swiftui-navigation-10-split.png)

## Deep Linking

This app supports navigation via a URL.

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

To configure use of URLs:

- In the App subclass, add the `onOpenURL` view modifier to the initial view
  (`ContentView` here).

To test use of URLS:

- Launch the Simulator. The app does not need to be running in the Simulator.
- In a terminal window, enter a command like these:

  - `xcrun simctl openurl booted NavStack://Canada`
  - `xcrun simctl openurl booted NavStack://Canada/Vancouver`

- The URLs above can also be links in an email or reminder.
  Clicking these links will launch the app if it is not already running
  and will navigate to the appropriate navigation path.
- The app will ask for permission to receive a URL
  the first time a request is received.
