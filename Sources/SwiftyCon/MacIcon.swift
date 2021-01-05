//
//  File.swift
//  
//
//  Created by Kyle on 1/4/21.
//

import Foundation
import SwiftUI

@available(OSX 11.0, *)
struct MacIcon: View {
	
	var size : Int
	
	// These sizes in Template.appiconset correspond to Mac app icons
	static var sizes = [16, 32, 64, 128, 256, 512, 1024]
	
	var body: some View {
		Icon(size: size)
			.cornerRadius(200)
			.scaleEffect(0.82)
	}
}

@available(OSX 11.0, *)
struct MacIcon_Previews: PreviewProvider {
	static var previews: some View {
		Icon(size: 256)
	}
}
