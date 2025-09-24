# SwuifUI AppSupport

A swiftUI package for adding support for new modifiers with backwards compatibility.

```swift
import AppSupport

struct ContentView: View {
    var body: some View {
        SomeView()
            .apply.glassEffect()
    }
}
```
