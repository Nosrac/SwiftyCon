// Adapted from eneko's ConsoleUI
// https://github.com/eneko/ConsoleUI

import AppKit
import SwiftUI

func rasterize(view: NSView, format: NSBitmapImageRep.FileType) -> Data? {
    guard let bitmapRepresentation = view.bitmapImageRepForCachingDisplay(in: view.bounds) else {
        return nil
    }
    bitmapRepresentation.size = view.bounds.size
    view.cacheDisplay(in: view.bounds, to: bitmapRepresentation)
    return bitmapRepresentation.representation(using: format, properties: [:])
}

if #available(OSX 11.0, *) {
	let generator = IconGenerator()
	generator.generate()
	
//	let wrapper = NSHostingView(rootView: Icon())
//	wrapper.frame = CGRect(x: 0, y: 0, width: 1024, height: 1024)
//
//	let png = rasterize(view: wrapper, format: .png)
//
////	try! FileManager.default.createDirectory(atPath: "Output", withIntermediateDirectories: false, attributes: nil)
//
//	try png?.write(to: URL(fileURLWithPath: "Output/\(Date()).png"))
	
} else {
	print("Sorry! SwiftyCon requires macOS 11")
}
