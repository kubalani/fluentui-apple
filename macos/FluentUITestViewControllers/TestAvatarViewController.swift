//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import AppKit
import FluentUI

/// A test identity to facilitate creating avatar views
private struct TestIdentity {
	let name: String?
	let email: String?
	let image: NSImage?
}

/// Some sample identities
private struct TestData {
	static let annie = TestIdentity(name: "Annie Lindqvist", email: "Annie.Lindqvist@example.com", image: NSImage(named: TestAvatarViewController.personaFemale))
	static let maor = TestIdentity(name: "Maor Sharett", email: "Maor.Sharett@example.com", image: nil)
	static let annieBoyl = TestIdentity(name: "Annie Boyl Lind", email: "annie.boyl@example.com", image: nil)
	static let kat = TestIdentity(name: nil, email: "Kat.Larrson@example.com", image: nil)
	static let anonymous = TestIdentity(name: nil, email: nil, image: nil)
	private init() {}
}

/// Test view controller for the AvatarView class
class TestAvatarViewController: NSViewController {

	// Create various sizes of avatar views from our testa data
	let displayedAvatarViews: [[MSFAvatar]] = avatarViews(sizes: [.xsmall, .small, .medium, .large, .xlarge, .xxlarge],
														   identities: [
															TestData.annie,
															TestData.maor,
															TestData.annieBoyl,
															TestData.kat,
															TestData.anonymous
		])

	override func loadView() {

		// Create a vertical stack view for each of our test identities
		let stackViews = displayedAvatarViews.map { avatarViews -> NSStackView in
			let nativeView = avatarViews.map { (avatarView) -> NSView in
				avatarView.view
			}
			let stackView = NSStackView(views: nativeView)
			stackView.orientation = .vertical
			let spacing = stackView.spacing
			stackView.edgeInsets = NSEdgeInsets(top: spacing, left: 0, bottom: spacing, right: 0)
			return stackView
		}

		// set our view to a horizontal stack view containing the vertical stack views
		let avatarViewsContentView = NSStackView(views: stackViews)
		avatarViewsContentView.alignment = .top

		let spacing = avatarViewsContentView.spacing
		avatarViewsContentView.edgeInsets = NSEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)

		let containerView = NSStackView(views: [
			avatarViewsContentView,
			NSButton(title: "Update Avatar Images", target: self, action: #selector(updateAvatarImages)),
			NSButton(title: "Update Avatar Background Colors", target: self, action: #selector(updateAvatarBackgroundColors)),
			NSButton(title: "Repurpose Avatar View", target: self, action: #selector(reuseAvatarView))
			])

		containerView.orientation = .vertical

		view = containerView
	}

	/// Create a single avatar view from a given size and test identity
	private static func avatarView(size: MSFAvatarSize, identity: TestIdentity) -> MSFAvatar {
		let avatar = MSFAvatar(style: .default, size: size)
		avatar.state.isRingVisible = true
		avatar.state.primaryText = identity.name
		avatar.state.secondaryText = identity.email
		avatar.state.image = identity.image
		return avatar
	}

	/// For each identity passed in, return an array of avatar views in the given sizes
	private static func avatarViews(sizes: [MSFAvatarSize], identities: [TestIdentity]) -> [[MSFAvatar]] {
		return identities.map { identity in
			sizes.map { avatarView(size: $0, identity: identity) }
		}
	}

	// test setting an image on an existing avatar view
	@objc private func updateAvatarImages() {
		let maleImage = NSImage(named: TestAvatarViewController.personaMale)
		displayedAvatarViews[TestAvatarViewController.testDataIndexForImages].forEach { $0.state.image = maleImage }
	}

	// test setting custom avatar background color
	@objc private func updateAvatarBackgroundColors() {
		displayedAvatarViews[TestAvatarViewController.testDataIndexForBackroundColor].forEach { $0.state.backgroundColor = .systemBlue }
	}

	// test repurposing an avatar view
	@objc private func reuseAvatarView() {
		displayedAvatarViews[TestAvatarViewController.testDataIndexForReuse].forEach {
			$0.state.primaryText = "Ted Randall"
			$0.state.secondaryText = "ted.randall@example.com"
			$0.setSize(size: .large)
		}
	}

	static let testDataIndexForImages: Int = 1
	static let testDataIndexForBackroundColor: Int = 2
	static let testDataIndexForReuse: Int = 3
	static let personaMale: String = "persona-male"
	static let personaFemale: String = "persona-female"
}
