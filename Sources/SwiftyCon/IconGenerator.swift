//
//  File.swift
//  
//
//  Created by Kyle on 1/4/21.
//

import Foundation
import SwiftUI

@available(OSX 11.0, *)
class IconGenerator {
	var templateDirectory : URL {
		let path = "Sources/SwiftyCon/Template.appiconset"
		if FileManager.default.fileExists(atPath: path) {
			return URL(fileURLWithPath: path)
		}
		
		print("You've encountered an error - Are you using `swift run`?")
		return URL(fileURLWithPath: path)
	}
	
	func generate() {
		let dir = self.templateDirectory
		
		let temp = URL(fileURLWithPath: NSTemporaryDirectory())
		
		let generatedIconSet = temp.appendingPathComponent("AppIcon.appiconset")
		
		if FileManager.default.fileExists(atPath: generatedIconSet.path) {
			try! FileManager.default.removeItem(at: generatedIconSet)
		}
		
		try! FileManager.default.copyItem(at: dir, to: generatedIconSet)
		
		let images =
			try! FileManager.default.contentsOfDirectory(at: generatedIconSet, includingPropertiesForKeys: nil)
			.filter { $0.pathExtension == "png"}
		
		for imageURL in images {
			
			if let filename = imageURL.lastPathComponent.components(separatedBy: CharacterSet(charactersIn: ".")).first,
			   let size = Int(filename) {
				let image = generateIcon(atSize: size)!
				try! image.write(to: imageURL)
			}
		}
		
		NSWorkspace.shared.activateFileViewerSelecting([ generatedIconSet ]);
		
		print("Outputting to: " + generatedIconSet.path)
	}

	func generateIcon(atSize size: Int) -> Data? {
		let resolutionMultiplier = Double(NSScreen.main?.backingScaleFactor ?? 1)
		let adjustedSize = Double(size) / resolutionMultiplier
		let scale : CGFloat = CGFloat(adjustedSize) / 1024.0
		
		let icon : AnyView
		if MacIcon.sizes.contains(size) {
			icon = AnyView( MacIcon(size: size) )
		} else {
			icon = AnyView( iOSIcon(size: size) )
		}
		
		let rootView = icon.frame(width: 1024, height: 1024).scaleEffect( CGFloat(scale) )
		
		let wrapper = NSHostingView(rootView: rootView )
		wrapper.frame = CGRect(x: 0, y: 0, width: adjustedSize, height: adjustedSize)
		
		return rasterize(view: wrapper, format: .png)
	}
	
	func rasterize(view: NSView, format: NSBitmapImageRep.FileType) -> Data? {
		guard let bitmapRepresentation = view.bitmapImageRepForCachingDisplay(in: view.bounds) else {
			return nil
		}
		bitmapRepresentation.size = view.bounds.size
		view.cacheDisplay(in: view.bounds, to: bitmapRepresentation)
		return bitmapRepresentation.representation(using: format, properties: [:])
	}
	
}
