//
//  Icon.swift
//  Swiftycon
//
//  Created by Kyle on 8/1/20.
//

import SwiftUI

@available(OSX 11.0, *)
struct Icon: View {
	
	var icon : some View {
		return Image(systemName: "flame.fill")
			.foregroundColor(.white)
			.font(
				Font.system(size: 650)
					.weight(.ultraLight)
			)
	}
	
	var background : some View {
		LinearGradient(gradient: Gradient(colors: [.red, .orange, .yellow]), startPoint: .bottom, endPoint: .top)
	}
	
	/**
	Stop editing unless you know what you're doing!
	*/
	
	var body: some View {
		ZStack {
			background.edgesIgnoringSafeArea(.all)
			
			VStack {
				icon
					.frame(width: 1024, height: 1024)
			}
		}
	}
}

//struct Icon_Previews: PreviewProvider {
//	static var previews: some View {
////		PhonePreview()
//	}
//}
