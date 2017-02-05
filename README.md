# CascadePresenter

[![CI Status](http://img.shields.io/travis/git/CascadePresenter.svg?style=flat)](https://travis-ci.org/git/CascadePresenter)
[![Version](https://img.shields.io/cocoapods/v/CascadePresenter.svg?style=flat)](http://cocoapods.org/pods/CascadePresenter)
[![License](https://img.shields.io/cocoapods/l/CascadePresenter.svg?style=flat)](http://cocoapods.org/pods/CascadePresenter)
[![Platform](https://img.shields.io/cocoapods/p/CascadePresenter.svg?style=flat)](http://cocoapods.org/pods/CascadePresenter)

## Usage
To use animator, just add following code to `UIViewControllerTransitioningDelegate` instance.
```swift
extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Cascade.animator(for: .present)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Cascade.animator(for: .dismiss)
    }
}
```

You can also change animation parameters
```swift
struct Params: CascadeAnimationParameters {
    var animationDuration: TimeInterval = 1.5
    var presentingVCAlpha: CGFloat = 0.97
    var presentingTopMargin: CGFloat = 25
    var presentedTopMargin: CGFloat  = 50
    var scale: CGFloat = 1
    var backgroundColor: UIColor = .green
    var cornerRadius: CGFloat = 15
}

// ...

class ViewController: UIViewController {
    let params = Params()
}

// ...

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Cascade.animator(for: .present, animationParams: params)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Cascade.animator(for: .dismiss, animationParams: params)
    }
}

```

And don't forget to set transitioningDelegate for presented view contreller.
For example:

```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    segue.destination.transitioningDelegate = self
}
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

CascadePresenter is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "CascadePresenter"
```

## Author

git, nick.kibish@gmail.com

## License

CascadePresenter is available under the MIT license. See the LICENSE file for more info.
