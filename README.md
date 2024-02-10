# LinkKit

![Swift version](https://img.shields.io/badge/Licsense-MIT-green)
![Swift version](https://img.shields.io/badge/Swift-5.9-orange)
![Xcode version](https://img.shields.io/badge/Xcode-15.2-blue)

Supports the DeepLink feature of your app.

With this Package, you can eliminate fat code and define complex transitions easily and clearly.

## Usage

- Define your Link.

```swift
struct MyLink: Link {

    var body: some Link {
        PopToRootLink()
        PushLink([SomeViewController(), SomeViewController()])
    }
}
```

- Start transitions of your Link.

```swift
let myLink = MyLink()
myLink.start(by: viewController)
```

You can use any conditional statements to define a complex Link.

See [Example project](./Examples/LinkSample).

## Installation

Installation from SPM (Swift Package Manager) is supportted.



