//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import AppKit

public extension Colors {
	@objc static var avatarColors: [ColorSet] = [
		ColorSet(background: DynamicColor(light: Colors.Palette.darkRedTint40.color, dark: Colors.Palette.darkRedShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.darkRedShade30.color, dark: Colors.Palette.darkRedTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.cranberryTint40.color, dark: Colors.Palette.cranberryShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.cranberryShade30.color, dark: Colors.Palette.cranberryTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.redTint40.color, dark: Colors.Palette.redShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.redShade30.color, dark: Colors.Palette.redTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.pumpkinTint40.color, dark: Colors.Palette.pumpkinShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.pumpkinShade30.color, dark: Colors.Palette.pumpkinTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.peachTint40.color, dark: Colors.Palette.peachShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.peachShade30.color, dark: Colors.Palette.peachTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.marigoldTint40.color, dark: Colors.Palette.marigoldShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.marigoldShade30.color, dark: Colors.Palette.marigoldTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.goldTint40.color, dark: Colors.Palette.goldShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.goldShade30.color, dark: Colors.Palette.goldTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.brassTint40.color, dark: Colors.Palette.brassShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.brassShade30.color, dark: Colors.Palette.brassTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.brownTint40.color, dark: Colors.Palette.brownShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.brownShade30.color, dark: Colors.Palette.brownTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.forestTint40.color, dark: Colors.Palette.forestShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.forestShade30.color, dark: Colors.Palette.forestTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.seafoamTint40.color, dark: Colors.Palette.seafoamShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.seafoamShade30.color, dark: Colors.Palette.seafoamTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.darkGreenTint40.color, dark: Colors.Palette.darkGreenShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.darkGreenShade30.color, dark: Colors.Palette.darkGreenTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.lightTealTint40.color, dark: Colors.Palette.lightTealShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.lightTealShade30.color, dark: Colors.Palette.lightTealTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.tealTint40.color, dark: Colors.Palette.tealShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.tealShade30.color, dark: Colors.Palette.tealTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.steelTint40.color, dark: Colors.Palette.steelShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.steelShade30.color, dark: Colors.Palette.steelTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.blueTint40.color, dark: Colors.Palette.blueShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.blueShade30.color, dark: Colors.Palette.blueTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.royalBlueTint40.color, dark: Colors.Palette.royalBlueShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.royalBlueShade30.color, dark: Colors.Palette.royalBlueTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.cornFlowerTint40.color, dark: Colors.Palette.cornFlowerShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.cornFlowerShade30.color, dark: Colors.Palette.cornFlowerTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.navyTint40.color, dark: Colors.Palette.navyShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.navyShade30.color, dark: Colors.Palette.navyTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.lavenderTint40.color, dark: Colors.Palette.lavenderShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.lavenderShade30.color, dark: Colors.Palette.lavenderTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.purpleTint40.color, dark: Colors.Palette.purpleShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.purpleShade30.color, dark: Colors.Palette.purpleTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.grapeTint40.color, dark: Colors.Palette.grapeShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.grapeShade30.color, dark: Colors.Palette.grapeTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.lilacTint40.color, dark: Colors.Palette.lilacShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.lilacShade30.color, dark: Colors.Palette.lilacTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.pinkTint40.color, dark: Colors.Palette.pinkShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.pinkShade30.color, dark: Colors.Palette.pinkTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.magentaTint40.color, dark: Colors.Palette.magentaShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.magentaShade30.color, dark: Colors.Palette.magentaTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.plumTint40.color, dark: Colors.Palette.plumShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.plumShade30.color, dark: Colors.Palette.plumTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.beigeTint40.color, dark: Colors.Palette.beigeShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.beigeShade30.color, dark: Colors.Palette.beigeTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.minkTint40.color, dark: Colors.Palette.minkShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.minkShade30.color, dark: Colors.Palette.minkTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.platinumTint40.color, dark: Colors.Palette.platinumShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.platinumShade30.color, dark: Colors.Palette.platinumTint40.color)),
		ColorSet(background: DynamicColor(light: Colors.Palette.anchorTint40.color, dark: Colors.Palette.anchorShade30.color),
				 foreground: DynamicColor(light: Colors.Palette.anchorShade30.color, dark: Colors.Palette.anchorTint40.color))
	]
}

// MARK: InitialsView

/**
 `InitialsView` is used to present the initials of an entity such as a person within an avatar view.
 The initials are generated from a provided primary text (e.g. a name) or secondary text (e.g. an email address) and placed as a label above a colored background.
 */
class InitialsView: NSView {

	static func initialsHashCode(fromPrimaryText primaryText: String?, secondaryText: String?) -> Int {
		var combined: String
		if let secondaryText = secondaryText, let primaryText = primaryText, secondaryText.count > 0 {
			combined = primaryText + secondaryText
		} else if let primaryText = primaryText {
			combined = primaryText
		} else {
			combined = ""
		}

		let combinedHashable = combined as NSString
		return Int(abs(javaHashCode(combinedHashable)))
	}

	static func initialsCalculatedColor(fromPrimaryText primaryText: String?, secondaryText: String?, colorOptions: [NSColor]? = nil) -> NSColor {
		guard let colors = colorOptions else {
			return .black
		}

		// Set the color based on the primary text and secondary text
		let hashCode = initialsHashCode(fromPrimaryText: primaryText, secondaryText: secondaryText)
		return colors[hashCode % colors.count]
	}

	private static func initialsColorSet(fromPrimaryText primaryText: String?, secondaryText: String?) -> ColorSet {
		let hashCode = initialsHashCode(fromPrimaryText: primaryText, secondaryText: secondaryText)
		let colorSets = Colors.avatarColors
		return colorSets[hashCode % colorSets.count]
	}

	static func initialsText(fromPrimaryText primaryText: String?, secondaryText: String?) -> String {
		var initials = ""

		if let primaryText = primaryText, primaryText.count > 0 {
			initials = initialLetters(primaryText)
		} else if let secondaryText = secondaryText, secondaryText.count > 0 {
			// Use first letter of the secondary text
			initials = String(secondaryText.prefix(1))
		}

		return initials.uppercased()
	}

	private static func initialLetters(_ text: String) -> String {
		var initials = ""

		// Use the leading character from the first two words in the user's name
		let nameComponents = text.components(separatedBy: " ")
		for nameComponent: String in nameComponents {
			let trimmedName = nameComponent.trimmingCharacters(in: [" "])
			if trimmedName.count < 1 {
				continue
			}
			let initial = trimmedName.index(trimmedName.startIndex, offsetBy: 0)
			let initialLetter = String(trimmedName[initial])
			let initialUnicodeScalars = initialLetter.unicodeScalars
			let initialUnicodeScalar = initialUnicodeScalars[initialUnicodeScalars.startIndex]
			// Discard name if first char is not a letter
			let isInitialLetter: Bool = initialLetter.count > 0 && CharacterSet.letters.contains(initialUnicodeScalar)
			if isInitialLetter && initials.count < 2 {
				initials += initialLetter
			}
		}

		return initials
	}

	/// To ensure iOS and Android achieve the same result when generating string hash codes (e.g. to determine avatar colors) we've copied Java's String implementation of `hashCode`.
	/// Must use Int32 as JVM specification is 32-bits for ints
	/// - Returns: hash code of string
	private static func javaHashCode(_ text: NSString) -> Int32 {
		var hash: Int32 = 0
		for i in 0..<text.length {
			// Allow overflows, mimicking Java behavior
			hash = 31 &* hash &+ Int32(text.character(at: i))
		}
		return hash
	}
}
