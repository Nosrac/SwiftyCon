// Adapted from eneko's ConsoleUI
// https://github.com/eneko/ConsoleUI

import AppKit
import SwiftUI

if #available(OSX 11.0, *) {
	let generator = IconGenerator()
	generator.generate()
} else {
	print("Sorry! SwiftyCon requires macOS 11")
}
