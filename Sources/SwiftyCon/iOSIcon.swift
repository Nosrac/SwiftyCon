//
//  File.swift
//  
//
//  Created by Kyle on 1/4/21.
//

import Foundation
import SwiftUI

@available(OSX 11.0, *)
struct iOSIcon: View {
	
	var size : Int
	
	var body: some View {
		Icon(size: size)
	}
}

@available(OSX 11.0, *)
struct iOSIcon_Previews: PreviewProvider {
	static var previews: some View {
		Icon(size: 256)
	}
}
