# iSearchBar 🔍

`iSearchBar` is a customizable SwiftUI search bar component that mimics Apple's native search interface. It is specifically designed to work seamlessly within SwiftUI sheets, navigation views, and custom contexts, addressing the limitations of the native search bar in these contexts.

## Features ✨

- **Customizable Search Bar**: Configure the placeholder text and bind the search bar's text to a variable.
- **SwiftUI Compatibility**: Fully integrates with SwiftUI sheets, navigation views, and custom contexts, ensuring smooth operation in modals, overlays, and navigation stacks.
- **Modern Design**: Clean UI with rounded corners, including a search icon, text field, and interactive trailing buttons.
- **Focus Management**: Handles focus state to provide visual feedback and manage user interactions.
- **Custom Colors**: Option to provide custom colors for the search bar's background and elements.

### Comparison between Native Search Interface vs iSearchBar 💁🏻‍♂️
<img src='https://github.com/KDTechniques/iSearchBar/blob/main/readme_images/Comparison.gif?raw=true'>

## Installation 🛠️

### Swift Package Manager

To integrate `iSearchBar` into your Swift project, add the following dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/KDTechniques/iSearchBar.git", from: "1.0.0")
]
```
### CocoaPods
For CocoaPods, add the following to your Podfile:

```ruby
pod 'iSearchBar', :git => '[https://github.com/yourusername/iSearchBar.git](https://github.com/KDTechniques/iSearchBar.git)'
```

## Usage 📖
Here’s how you can use the `iSearchBarView` in your SwiftUI project: create an instance of `iSearchBarView` and provide necessary parameters:

### 1. `context: .sheet` (default context)

|Dark Mode|Light Mode|
|-|-|
|<img src='https://github.com/KDTechniques/iSearchBar/blob/main/readme_images/Sheet_Context_Dark.png?raw=true'>|<img src='https://github.com/KDTechniques/iSearchBar/blob/main/readme_images/Sheet_Context_Light.png?raw=true'>|

```swift
import SwiftUI
import iSearchBar

struct ContentView: View {
    @State private var text: String = ""

    var body: some View {
        Color.clear
            .sheet(isPresented: .constant(true)) {
                VStack {
                    iSearchBarView(searchBarText: $text, placeholder: "Search", context: .sheet, customColors: nil)
                        .padding(.top, 20)
                    
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
|<img src='https://github.com/KDTechniques/iSearchBar/blob/main/readme_images/Navigation_Context_Dark.png?raw=true'>|<img src='https://github.com/KDTechniques/iSearchBar/blob/main/readme_images/Navigation_Context_Light.png?raw=true'>|

```swift
import SwiftUI
import iSearchBar

struct ContentView: View {
    @State private var text: String = ""

    var body: some View {
        VStack {
            iSearchBarView(
                searchBarText: $text,
                placeholder: "Search",
                context: .navigation,
                customColors: nil
            )
            .padding(.top, 20)
            
            Spacer()
        }
    }
}
```

<br>

### 3. `context: .custom` (for custom color customizations)

|Dark Mode|Light Mode|
|-|-|
|<img src='https://github.com/KDTechniques/iSearchBar/blob/main/readme_images/Custom_Context_Dark.png?raw=true'>|<img src='https://github.com/KDTechniques/iSearchBar/blob/main/readme_images/Custom_Context_Light.png?raw=true'>|

```swift
import SwiftUI
import iSearchBar

struct ContentView: View {
    @State private var text: String = ""

    var body: some View {
        VStack {
            iSearchBarView(
                searchBarText: $text,
                placeholder: "Search",
                context: .custom,
                customColors: .init(
                    backgroundColor: .yellow,
                    searchIconTextColor: .blue,
                    placeholderTextColor: .green,
                    textColor: .red
                )
            )
            .tint(.purple)
            .padding(.top, 20)
                    
            Spacer()
        }
    }
}
```

## Contribution 🤝
Contributions are welcome! If you have suggestions or improvements, please submit a pull request or open an issue on GitHub.

## License 📜
iSearchBar is released under the MIT License. See the [LICENSE](https://github.com/KDTechniques/iSearchBar/blob/main/LICENSE) file for details.
