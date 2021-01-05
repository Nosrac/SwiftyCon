# SwiftyCon

Quickly generate iOS and Mac app icons using SwiftUI.

## Example

FIRE:

![iOS Example](https://raw.githubusercontent.com/Nosrac/SwiftyCon/main/example-ios.png)
![Mac Example](https://raw.githubusercontent.com/Nosrac/SwiftyCon/main/example-mac.png)

```
struct Icon: View {
	var icon : some View {
		return Image(systemName: "flame.fill")
			.foregroundColor(.white)
			.font(
				Font.system(size: 650)
					.weight(.ultraLight)
			)
			.shadow(radius: 10)
	}
	
	var background : some View {
		LinearGradient(gradient: Gradient(colors: [.red, .orange, .yellow]), startPoint: .bottom, endPoint: .top)
	}
	...
}
```

## Usage
1. Edit Icon.swift, create your icon using SwiftUI
2. Run via Command Line: `swift run`.  This will generate your icon for you and select it in Finder.

## Recognition
- Rasterizing code written by eneko: https://github.com/eneko/ConsoleUI
