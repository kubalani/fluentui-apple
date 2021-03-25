//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import AppKit
import SwiftUI

/// Pre-defined styles of the avatar
@objc public enum MSFAvatarStyle: Int, CaseIterable {
    case `default`
    case accent
    case group
    case outlined
    case outlinedPrimary
    case overflow
}

/// Pre-defined sizes of the avatar
@objc public enum MSFAvatarSize: Int, CaseIterable {
    case xsmall
    case small
    case medium
    case large
    case xlarge
    case xxlarge
}

/// Representation of design tokens to buttons at runtime which interfaces with the Design Token System auto-generated code.
/// Updating these properties causes the SwiftUI button to update its view automatically.
class MSFAvatarTokens: ObservableObject {
    @Published public var avatarSize: CGFloat!
    @Published public var borderRadius: CGFloat!
    @Published public var textFont: NSFont!

    @Published public var ringDefaultColor: NSColor!
    @Published public var ringGapColor: NSColor!
    @Published public var ringThickness: CGFloat!
    @Published public var ringInnerGap: CGFloat!
    @Published public var ringOuterGap: CGFloat!

    @Published public var presenceIconSize: CGFloat!
    @Published public var presenceIconOutlineThickness: CGFloat!
    @Published public var presenceOutlineColor: NSColor!

    @Published public var backgroundCalculatedColorOptions: [NSColor]!
    @Published public var backgroundDefaultColor: NSColor!
    @Published public var foregroundCalculatedColorOptions: [NSColor]!
    @Published public var foregroundDefaultColor: NSColor!

    var style: MSFAvatarStyle {
        didSet {
            if oldValue != style {
                updateForCurrentTheme()
            }
        }
    }

    var size: MSFAvatarSize {
        didSet {
            if oldValue != size {
                updateForCurrentTheme()
            }
        }
    }

    init(style: MSFAvatarStyle,
         size: MSFAvatarSize) {
        self.style = style
        self.size = size
        updateForCurrentTheme()
    }

	func updateForCurrentTheme() {
		ringDefaultColor = Colors.primaryTint10
		ringGapColor = NSColor.white
        presenceOutlineColor = NSColor.white
        backgroundDefaultColor = NSColor.white
        backgroundCalculatedColorOptions = [Colors.primaryShade10]
		foregroundDefaultColor = Colors.primaryTint40
        foregroundCalculatedColorOptions = [Colors.primaryTint40]

        switch size {
        case .xsmall:
            avatarSize = 16
            borderRadius = 0
            ringThickness = 1
            ringInnerGap = 2
            ringOuterGap = 2
            presenceIconSize = 0
            presenceIconOutlineThickness = 0
            textFont = NSFont.systemFont(ofSize: 9)
        case .small:
            avatarSize = 24
            borderRadius = 0
            ringThickness = 1
            ringInnerGap = 2
            ringOuterGap = 2
            presenceIconSize = 10
            presenceIconOutlineThickness = 2
            textFont = NSFont.systemFont(ofSize: 12)
        case .medium:
            avatarSize = 32
            borderRadius = 0
            ringThickness = 2
            ringInnerGap = 2
            ringOuterGap = 2
            presenceIconSize = 10
            presenceIconOutlineThickness = 2
            textFont = NSFont.systemFont(ofSize: 13)
        case .large:
            avatarSize = 40
            borderRadius = 0
            ringThickness = 2
            ringInnerGap = 2
            ringOuterGap = 2
            presenceIconSize = 12
            presenceIconOutlineThickness = 2
            textFont = NSFont.systemFont(ofSize: 15)
        case .xlarge:
            avatarSize = 50
            borderRadius = 0
            ringThickness = 2
            ringInnerGap = 2
            ringOuterGap = 2
            presenceIconSize = 12
            presenceIconOutlineThickness = 2
            textFont = NSFont.systemFont(ofSize: 20)
        case .xxlarge:
            avatarSize = 72
            borderRadius = 0
            ringThickness = 2
            ringInnerGap = 4
            ringOuterGap = 2
            presenceIconSize = 16
            presenceIconOutlineThickness = 2
            textFont = NSFont.systemFont(ofSize: 28)
        }
    }

    @objc open func didChangeAppearanceProxy() {
        updateForCurrentTheme()
    }
}
