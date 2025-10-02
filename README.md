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
## Available Modifiers

| iOS Version | Modifier                                | Description                                      |
|-------------|-----------------------------------------|--------------------------------------------------|
| iOS 17.0    | `contentTransition(_:)`                 | Applies a basic or numeric content transition    |
| iOS 17.0    | `presentationCornerRadius(_:)`          | Applies corner radius to sheet detents           |
| iOS 17.0    | `presentationContentInteraction(_:)`    | Applies content interaction mode to sheets       |
| iOS 18.0    | `matchedTransitionSource(id:in:)`       | Marks a view as a matched transition source      |
| iOS 18.0    | `presentationSizeForm()`                | Applies `.presentationSizing(.form)`             |
| iOS 18.0    | `navigationTransition(sourceId:in:)`    | Applies a zoom navigation transition             |
| iOS 18.1    | `imagePlayground(_:completion:)`        | Presents an image playground sheet               |
| iOS 18.0    | `widgetAccentedRenderingMode(_:)`       | Sets how an `Image` should render in widget accented mode |
| iOS 26.0    | `backgroundExtensionEffect()`           | Extends background beyond safe areas             |
| iOS 26.0    | `glassButtonStyle()`                    | Applies the glass button style                   |
| iOS 26.0    | `glassEffect(_:in:)`                    | Applies a glass effect                           |
| iOS 26.0    | `glassEffect(_:in:fallback:)`           | Glass effect with fallback background            |
| iOS 26.0    | `glassEffectContainer(spacing:)`        | Embed in a `GlassEffectContainer`                |
| iOS 26.0    | `glassEffectID(_:in:)`                  | Tags glass views for matched animations          |
| iOS 26.0    | `glassEffectTransition(_:)`             | Animates glass transitions                       |
| iOS 26.0    | `glassEffectUnion(_:namespace:)`         | Unites multiple glass effects by ID in a namespace |
| iOS 26.0    | `glassProminentButtonStyle()`           | Applies the glass prominent button style         |
| iOS 26.0    | `listSectionMargins(_:_: )`             | Sets margins for list sections                   |
| iOS 26.0    | `presentationBackground(in:)`           | Applies a fallback background on earlier versions|
| iOS 26.0    | `scrollEdgeEffectHidden(_:for:)`        | Hides scroll edge effects                        |
| iOS 26.0    | `scrollEdgeEffectStyle(_:for:)`         | Customizes scroll view edge effects              |
| iOS 26.0    | `symbolColorRenderingMode(_:)`          | Sets symbol image rendering mode                 |
| iOS 26.0    | `symbolVariableValueMode(_:)`           | Sets variable value rendering mode               |
| iOS 26.0    | `tabBarMinimizeBehavior(_:)`            | Sets the tab bar minimize behavior               |
| iOS 26.0    | `safeAreaBar(edge:alignment:spacing:content:)` | Shows the specified content as a custom bar above or below the modified view |
| iOS 26.0    | `sheetNavigationTransition(sourceId:in:)`| Convenience method to apply zoom transion to sheets|
