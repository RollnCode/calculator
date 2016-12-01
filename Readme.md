# Simple expression solver for iOS and macOS. 

## Install with Crathage:

```
github "Rollncode/calculator"
```

## Supported operators

Here is the list of currently supported operators and operations in the order of applying.

* Round brackets (also supporting nested brackets)
* Unary minus
* Unary plus
* Multiplication
* Division
* Subtraction
* Addition

And by the way, spces, tabs and other spacing symbols are ignored.

## Using

```swift
let calc = Calculator()

let _ = calc.solve("(2 + 3) * 4") //20

let _ = calc.solve("-1 + ((2 + 3) * 4) / 2 + 2*3") //16

```

For more usecases please see tests.
