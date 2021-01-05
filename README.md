# SwiftyCon

Quickly generate iOS icons using SwiftUI.

## Example

```
struct Icon: View {
	
	var background : some View {
		LinearGradient(gradient: Gradient(colors: [.red, .orange, .yellow]), startPoint: .bottom, endPoint: .top)
	}
	
	var icon : some View {
		return Image(systemName: "flame.fill")
			.foregroundColor(.white)
			.font(
				Font.system(size: 650)
					.weight(.ultraLight)
			)
			.frame(width: 1024, height: 1024)
	}
	
	...
}
```
