# Search Bar SwiftUI 🔍

`search-bar-swiftui` is a customizable SwiftUI search bar component package that mimics Apple's native search interface. It is specifically designed to work seamlessly within SwiftUI sheets, navigation views, and custom contexts, addressing the limitations of the native search bar in these contexts.

## ✨ Features

- **Customizable Search Bar**: Configure the placeholder text and bind the search bar's text to a variable.
- **SwiftUI Compatibility**: Fully integrates with SwiftUI sheets, navigation views, and custom contexts, ensuring smooth operation in modals, overlays, and navigation stacks.
- **Modern Design**: Clean UI with rounded corners, including a search icon, text field, and interactive trailing buttons.
- **Focus Management**: Handles focus state to provide visual feedback and manage user interactions.
- **Custom Colors**: Option to provide custom colors for the search bar's background and elements.
- **Progress Indicator**: Replaces X button with a circular progress. Perfect for showing ongoing async queries or loading states.


### Comparison between Native Search Interface vs Search Bar SwiftUI 💁🏻‍♂️
<img src='https://github.com/KDTechniques/search-bar-swiftui/blob/main/readme_images/Comparison.gif?raw=true'>

## 🛠️ Installation

### Swift Package Manager

To integrate `search-bar-swiftui` into your Swift project, add the following dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/KDTechniques/search-bar-swiftui.git", from: "1.0.0")
]
```
### 🫛 CocoaPods
For CocoaPods, add the following to your Podfile:

```ruby
pod 'search-bar-swiftui', :git => '[https://github.com/KDTechniques/search-bar-swiftui.git](https://github.com/KDTechniques/search-bar-swiftui.git)'
```

## 📖 Usage
Here’s how you can use the `SearchBarView` in your SwiftUI project: create an instance of `SearchBarView` and provide necessary parameters:

### 1. `context: .sheet` (default context)

|Dark Mode|Light Mode|
|-|-|
|<img src='https://github.com/KDTechniques/search-bar-swiftui/blob/main/readme_images/Sheet_Context_Dark.png?raw=true'>|<img src='https://github.com/KDTechniques/search-bar-swiftui/blob/main/readme_images/Sheet_Context_Light.png?raw=true'>|

```swift
import SwiftUI
import SearchBarSwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var isSearching: Bool = false
    @FocusState private var isFocused: Bool
    
    var body: some View {
        Color.clear
            .sheet(isPresented: .constant(true)) {
                VStack {
                    SearchBarView(searchBarText: $searchText, placeholder: "Search", context: .sheet, isSearching: isSearching)
                        .padding(.top, 20)
                        .focused($isFocused)
                        .onChange(of: isFocused) { oldValue, newValue in
                            // Do something here based on Focus State changes
                        }
                    
                    Spacer()
                }
                .presentationDragIndicator(.visible)
            }
    }
}
```

<br>

### 2. `context: .navigation`

|Dark Mode|Light Mode|
|-|-|
|<img src='https://github.com/KDTechniques/search-bar-swiftui/blob/main/readme_images/Navigation_Context_Dark.png?raw=true'>|<img src='https://github.com/KDTechniques/search-bar-swiftui/blob/main/readme_images/Navigation_Context_Light.png?raw=true'>|

```swift
import SwiftUI
import SearchBarSwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var isSearching: Bool = false
    @FocusState private var isFocused: Bool
    
    var body: some View {
        Color.clear
            .sheet(isPresented: .constant(true)) {
                VStack {
                    SearchBarView(searchBarText: $searchText, placeholder: "Search", context: .navigation, isSearching: isSearching)
                        .padding(.top, 20)
                        .focused($isFocused)
                        .onChange(of: isFocused) { oldValue, newValue in
                            // Do something here based on Focus State changes
                        }
                    
                    Spacer()
                }
                .presentationDragIndicator(.visible)
            }
    }
}
```

<br>

### 3. `context: .custom` (for custom color customizations)

|Dark Mode|Light Mode|
|-|-|
|<img src='https://github.com/KDTechniques/search-bar-swiftui/blob/main/readme_images/Custom_Context_Dark.png?raw=true'>|<img src='https://github.com/KDTechniques/search-bar-swiftui/blob/main/readme_images/Custom_Context_Light.png?raw=true'>|

```swift
import SwiftUI
import SearchBarSwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var isSearching: Bool = false
    @FocusState private var isFocused: Bool
    
    var body: some View {
        Color.clear
            .sheet(isPresented: .constant(true)) {
                VStack {
                    SearchBarView(
                        searchBarText: $searchText,
                        placeholder: "Search",
                        context: .custom(.init(
                            backgroundColor: .yellow,
                            searchIconTextColor: .blue,
                            placeholderTextColor: .green,
                            textColor: .red
                        )),
                        isSearching: isSearching
                    )
                    .tint(.purple)
                    .padding(.top, 20)
                    .focused($isFocused)
                    .onChange(of: isFocused) { oldValue, newValue in
                        // Do something here based on Focus State changes
                    }
                    
                    Spacer()
                }
                .presentationDragIndicator(.visible)
            }
    }
}
```

## 🤝 Contribution
Contributions are welcome! If you have suggestions or improvements, please submit a pull request or open an issue on GitHub.

## 📜 License
search-bar-swiftui is released under the MIT License. See the [LICENSE](https://github.com/KDTechniques/search-bar-swiftui/blob/main/LICENSE) file for details.
