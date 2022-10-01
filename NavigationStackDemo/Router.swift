import SwiftUI

/*
 To create a URL scheme:
 - select top item in Navigator
 - select the main target
 - select the Info tab
 - expand "URL Types"
 - click the "+" button
 - for "Identifier", enter the app bundle id found in the target General tab
 - for "URL Schemas", enter a name that is unique within the app such as "NavStack"
 - "Icon" is not required
 - "Role" can keep the default value of "Editor"
 - in the App subclass, add the "onOpenURL" view modifier to the initial view
   (ContentView here)
 - in a terminal window, enter
   xcrun simctl openurl booted NavStack://Canada/Vancover
 - app will ask for permission to receive a URL the first time one is received

 */
class Router: ObservableObject {
    @Published var path = NavigationPath()

    func reset() {
        path = NavigationPath()
    }
}
