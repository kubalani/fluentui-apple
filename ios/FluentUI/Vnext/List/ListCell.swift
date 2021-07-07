//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import UIKit
import SwiftUI

/// `MSFListCellState` contains properties that make up a cell content.
///
/// `title` is the first line of text, subsequently followed by `subtitle` on the second line and `footnote` on the third line.
/// Set line limits for text using `titleLineLimit`, `subtitleLineLimit`, and `footnoteLineLimit`.
///
/// Any label`AccessoryView` property is a custom view at the leading/trailing end of a label, including the title, subtitle, or footnote.
/// Currently only supports square views (width & height must be the same).
///
/// All `AnyView?` properties will be overwritten by its UIView equivalent. Used for SwiftUI environments.
///
/// `leadingView` and `trailingView` allows any custom views. Currently only supports square views (width & height must be the same).
/// `leadingViewSize` can be specified using `MSFListCellLeadingViewSize`.
///
/// Set `accessoryType` using the variations specified in `MSFListAccessoryType`. This is displayed in the very trailing end of a cell.
///
/// `children`: define nested cells. `isExpanded` will determine if the children are initially expanded or collapsed.
///
/// `layoutType`:  override the default cell height.
///
/// `onTapAction`: perform an action on a cell tap.
///
@objc public class MSFListCellState: NSObject, ObservableObject, Identifiable {
    public var id = UUID()

    @Published public var leadingView: AnyView?
    @Published public var titleLeadingAccessoryView: AnyView?
    @Published public var titleTrailingAccessoryView: AnyView?
    @Published public var subtitleLeadingAccessoryView: AnyView?
    @Published public var subtitleTrailingAccessoryView: AnyView?
    @Published public var footnoteLeadingAccessoryView: AnyView?
    @Published public var footnoteTrailingAccessoryView: AnyView?
    @Published public var trailingView: AnyView?

    @objc @Published public var leadingViewSize: MSFListCellLeadingViewSize = .medium {
        didSet {
            if leadingViewSize != oldValue {
                tokens.cellLeadingViewSize = leadingViewSize
                tokens.updateForCurrentTheme()
            }
        }
    }

    @objc @Published public var title: String = ""
    @objc @Published public var subtitle: String = ""
    @objc @Published public var footnote: String = ""
    @objc @Published public var accessoryType: MSFListAccessoryType = .none
    @objc @Published public var backgroundColor: UIColor?
    @objc @Published public var highlightedBackgroundColor: UIColor?
    @objc @Published public var titleLineLimit: Int = 0
    @objc @Published public var subtitleLineLimit: Int = 0
    @objc @Published public var footnoteLineLimit: Int = 0
    @objc @Published public var children: [MSFListCellState]?
    @objc @Published public var isExpanded: Bool = false
    @objc @Published public var layoutType: MSFListCellLayoutType = .automatic
    @objc @Published public var hasDivider: Bool = false
    @objc public var onTapAction: (() -> Void)?

    @objc public var leadingUIView: UIView? {
        didSet {
            guard let view = leadingUIView else {
                leadingView = nil
                return
            }

            leadingView = AnyView(UIViewAdapter(view))
        }
    }

    @objc public var titleLeadingAccessoryUIView: UIView? {
        didSet {
            guard let view = titleLeadingAccessoryUIView else {
                titleLeadingAccessoryView = nil
                return
            }

            titleLeadingAccessoryView = AnyView(UIViewAdapter(view))
        }
    }

    @objc public var titleTrailingAccessoryUIView: UIView? {
        didSet {
            guard let view = titleTrailingAccessoryUIView else {
                titleTrailingAccessoryView = nil
                return
            }

            titleTrailingAccessoryView = AnyView(UIViewAdapter(view))
        }
    }

    @objc public var subtitleLeadingAccessoryUIView: UIView? {
        didSet {
            guard let view = subtitleLeadingAccessoryUIView else {
                subtitleLeadingAccessoryView = nil
                return
            }

            subtitleLeadingAccessoryView = AnyView(UIViewAdapter(view))
        }
    }

    @objc public var subtitleTrailingAccessoryUIView: UIView? {
        didSet {
            guard let view = subtitleTrailingAccessoryUIView else {
                subtitleTrailingAccessoryView = nil
                return
            }

            subtitleTrailingAccessoryView = AnyView(UIViewAdapter(view))
        }
    }

    @objc public var footnoteLeadingAccessoryUIView: UIView? {
        didSet {
            guard let view = footnoteLeadingAccessoryUIView else {
                footnoteLeadingAccessoryView = nil
                return
            }

            footnoteLeadingAccessoryView = AnyView(UIViewAdapter(view))
        }
    }

    @objc public var footnoteTrailingAccessoryUIView: UIView? {
        didSet {
            guard let view = footnoteTrailingAccessoryUIView else {
                footnoteTrailingAccessoryView = nil
                return
            }

            footnoteTrailingAccessoryView = AnyView(UIViewAdapter(view))
        }
    }

    @objc public var trailingUIView: UIView? {
        didSet {
            guard let view = trailingUIView else {
                trailingView = nil
                return
            }

            trailingView = AnyView(UIViewAdapter(view))
        }
    }

    var tokens: MSFCellBaseTokens = MSFListCellTokens(cellLeadingViewSize: .medium)
}

/// Pre-defined layout heights of cells
@objc public enum MSFListCellLayoutType: Int, CaseIterable {
    case automatic
    case oneLine
    case twoLines
    case threeLines
}

/// View for List Cells
struct MSFListCellView: View {
    @Environment(\.theme) var theme: FluentUIStyle
    @Environment(\.windowProvider) var windowProvider: FluentUIWindowProvider?
    @ObservedObject var tokens: MSFCellBaseTokens
    @ObservedObject var state: MSFListCellState

    // Accessory Views
    private var titleLeadingView: ListCellContentView<AnyView?>?
    private var titleTrailingView: ListCellContentView<AnyView?>?
    private var subtitleLeadingView: ListCellContentView<AnyView?>?
    private var subtitleTrailingView: ListCellContentView<AnyView?>?
    private var footnoteLeadingView: ListCellContentView<AnyView?>?
    private var footnoteTrailingView: ListCellContentView<AnyView?>?

    // Allows client to override cell color, if nil then defaults to token values
    var tintColor: UIColor?

    init(state: MSFListCellState) {
        self.state = state
        self.tokens = state.tokens

        // Title accessory view
        self.titleLeadingView = ListCellContentView(size: CGSize(width: tokens.labelAccessorySize, height: tokens.labelAccessorySize),
                                                    padding: tokens.labelAccessoryInterspace,
                                                    content: {
                                                        state.titleLeadingAccessoryView
                                                    })
        self.titleLeadingView = ListCellContentView(size: CGSize(width: tokens.labelAccessorySize, height: tokens.labelAccessorySize),
                                                    padding: tokens.labelAccessoryInterspace,
                                                    content: {
                                                        state.titleLeadingAccessoryView
                                                    })

        // Subtitle accessory view
        self.subtitleLeadingView = ListCellContentView(size: CGSize(width: tokens.sublabelAccessorySize, height: tokens.sublabelAccessorySize),
                                                       padding: tokens.labelAccessoryInterspace,
                                                       content: {
                                                        state.subtitleLeadingAccessoryView
                                                       })
        self.subtitleLeadingView = ListCellContentView(size: CGSize(width: tokens.sublabelAccessorySize, height: tokens.sublabelAccessorySize),
                                                       padding: tokens.labelAccessoryInterspace,
                                                       content: {
                                                        state.subtitleLeadingAccessoryView
                                                       })

        // Footonote accessory view
        self.footnoteLeadingView = ListCellContentView(size: CGSize(width: tokens.labelAccessorySize, height: tokens.labelAccessorySize),
                                                       padding: tokens.labelAccessoryInterspace,
                                                       content: {
                                                        state.footnoteLeadingAccessoryView
                                                       })
        self.footnoteTrailingView = ListCellContentView(size: CGSize(width: tokens.labelAccessorySize, height: tokens.labelAccessorySize),
                                                        padding: tokens.labelAccessoryInterspace,
                                                        content: {
                                                            state.footnoteTrailingAccessoryView
                                                        })
    }

    init(state: MSFListCellState, tintColor: UIColor?) {
        self.init(state: state)
        self.tintColor = tintColor
    }

    var body: some View {

        @ViewBuilder
        var cellContent: some View {
            Button(action: state.onTapAction ?? {
                if state.children != nil {
                    withAnimation {
                        state.isExpanded.toggle()
                    }
                }
            }, label: {
                HStack(spacing: 0) {
                    if let leadingView = state.leadingView {
                        leadingView
                            .frame(width: tokens.leadingViewSize, height: tokens.leadingViewSize)
                            .padding(.trailing, tokens.iconInterspace)
                    }

                    VStack(alignment: .leading, spacing: 0) {

                        // Title view
                        ListCellAccessoryView<ListCellContentView<AnyView?>> {
                            TupleView((titleLeadingView, titleTrailingView))
                        }.text(ListCellText(title: state.title,
                                            font: tokens.labelFont,
                                            foregroundColor: tintColor ?? tokens.labelColor,
                                            lineLimit: state.titleLineLimit == 0 ? nil : state.titleLineLimit))

                        // Subtitle view
                        ListCellAccessoryView<ListCellContentView<AnyView?>> {
                            TupleView((subtitleLeadingView, subtitleTrailingView))
                        }.text(ListCellText(title: state.subtitle,
                                            font: state.footnote.isEmpty ? tokens.footnoteFont : tokens.sublabelFont,
                                            foregroundColor: tintColor ?? tokens.sublabelColor,
                                            lineLimit: state.subtitleLineLimit == 0 ? nil : state.subtitleLineLimit))

                        // Footnote view
                        ListCellAccessoryView<ListCellContentView<AnyView?>> {
                            TupleView((footnoteLeadingView, footnoteTrailingView))
                        }.text(ListCellText(title: state.footnote,
                                            font: tokens.footnoteFont,
                                            foregroundColor: tintColor ?? tokens.sublabelColor,
                                            lineLimit: state.footnoteLineLimit == 0 ? nil : state.footnoteLineLimit))
                    }

                    Spacer()

                    if let trailingView = state.trailingView {
                        trailingView
                            .frame(width: tokens.trailingItemSize, height: tokens.trailingItemSize)
                            .fixedSize()
                    }

                    HStack(spacing: 0) {
                        if let accessoryType = state.accessoryType, accessoryType != .none, let accessoryIcon = accessoryType.icon {
                            let isDisclosure = accessoryType == .disclosure
                            let disclosureSize = tokens.disclosureSize
                            Image(uiImage: accessoryIcon)
                                .resizable()
                                .foregroundColor(Color(isDisclosure ? tokens.disclosureIconForegroundColor : (tintColor ?? tokens.trailingItemForegroundColor)))
                                .frame(width: isDisclosure ? disclosureSize : tokens.trailingItemSize, height: isDisclosure ? disclosureSize : tokens.trailingItemSize)
                                .padding(.leading, isDisclosure ? tokens.disclosureInterspace : tokens.iconInterspace)
                        }
                    }
                }
            })
            .buttonStyle(ListCellButtonStyle(tokens: tokens, state: state))

            if state.hasDivider {
                let padding = tokens.horizontalCellPadding +
                    (state.leadingView != nil ? (tokens.leadingViewSize + tokens.iconInterspace) : 0)
                Divider()
                    .overlay(Color(tokens.borderColor))
                    .padding(.leading, padding)
            }

            if let children = state.children, state.isExpanded == true {
                ForEach(children, id: \.self) { child in
                    MSFListCellView(state: child)
                        .frame(maxWidth: .infinity)
                        .padding(.leading, (tokens.horizontalCellPadding + tokens.leadingViewSize))
                }
            }
        }

        return cellContent.designTokens(tokens,
                                        from: theme,
                                        with: windowProvider)
    }
}

extension MSFListCellView {
    /// Modifier to update tint color for accessory views
    /// - Parameter `color`:  optional text color for override
    /// - Returns: `MSFListCellView`
    func tintColor(_ color: UIColor?) -> MSFListCellView {
        return MSFListCellView(state: state, tintColor: color)
    }

    /// Modifier to show checkmark
    /// - Parameter `enabled`:  if set then checkmark is enabled
    /// - Returns: `MSFListCellView`
    func checkMark(_ enabled: Bool) -> MSFListCellView {
        if enabled {
            state.accessoryType = .checkmark
        } else {
            state.accessoryType = .none
        }
        return MSFListCellView(state: state)
    }
}

struct ListCellContentView<Content: View>: CGView {

    var size: CGSize

    var padding: CGFloat

    var content: () -> Content

    var body: some View {
        content()
    }

    init(size: CGSize, padding: CGFloat, @ViewBuilder content: @escaping () -> Content) {
        self.size = size
        self.padding = padding
        self.content = content
    }
}

struct ListCellText: UIText {

    var title: String

    var font: UIFont

    var foregroundColor: UIColor

    var lineLimit: Int?

    init(title: String, font: UIFont, foregroundColor: UIColor, lineLimit: Int?) {
        self.title = title
        self.font = font
        self.foregroundColor = foregroundColor
        self.lineLimit = lineLimit
    }
}

// Represents a UIKit View
protocol CGView: View {

    var size: CGSize { get set }

    var padding: CGFloat { get set }
}

// Represents a UiKit Text attributes
protocol UIText {

    var title: String { get set }

    var font: UIFont { get set }

    var foregroundColor: UIColor { get set }

    var lineLimit: Int? { get set }
}

// MARK: - Accessory View

struct ListCellAccessoryView<Content: CGView>: View {

    var leadingView: Content?

    var trailingView: Content?

    let spacing: CGFloat = 0

    var text: UIText?

    typealias LeadingView<Content> = Content?

    typealias TrailingView<Content> = Content?

    var body: some View {
        HStack(spacing: spacing) {
            if let leadingView = leadingView {
                leadingView
                    .frame(width: leadingView.size.width, height: leadingView.size.height)
                    .padding(.trailing, leadingView.padding)
            }
            if let text = text, !text.title.isEmpty {
                Text(text.title)
                    .scalableFont(font: text.font)
                    .foregroundColor(Color(text.foregroundColor))
                    .lineLimit(text.lineLimit == 0 ? nil : text.lineLimit)
            }
            if let trailingView = trailingView {
                trailingView
                    .frame(width: trailingView.size.width, height: trailingView.size.height)
                    .padding(.leading, trailingView.padding)
            }
        }
    }

    init(text: UIText?, @ViewBuilder _ contentView: @escaping () -> TupleView<(Content?, Content?)>) {
        let (leadingAccessoryView, trailingAccessoryView) = contentView().value
        self.text = text
        self.leadingView = leadingAccessoryView
        self.trailingView = trailingAccessoryView
    }

    init(@ViewBuilder _ contentView: @escaping () -> TupleView<(Content?, Content?)>) {
        let (leadingAccessoryView, trailingAccessoryView) = contentView().value
        self.leadingView = leadingAccessoryView
        self.trailingView = trailingAccessoryView
    }
}

// MARK: - View Modifier

private extension ListCellAccessoryView {

    /// Modifier to update optional text within the accessory view.
    /// - Parameter `text`:  optional text with attributes for rendering
    /// - Returns: `ListCellAccessoryView`
    func text(_ text: UIText?) -> ListCellAccessoryView {
        return ListCellAccessoryView(text: text) {
            TupleView((leadingView, trailingView))
        }
    }
}

// MARK: - Style

struct ListCellButtonStyle: ButtonStyle {
    let tokens: MSFCellBaseTokens
    let state: MSFListCellState

    func makeBody(configuration: Self.Configuration) -> some View {
        let height: CGFloat
        switch state.layoutType {
        case .automatic:
            height = !state.footnote.isEmpty ? tokens.cellHeightThreeLines :
                (!state.subtitle.isEmpty ? tokens.cellHeightTwoLines : tokens.cellHeightOneLine)
        case .oneLine:
            height = tokens.cellHeightOneLine
        case .twoLines:
            height = tokens.cellHeightTwoLines
        case .threeLines:
            height = tokens.cellHeightThreeLines
        }
        return configuration.label
            .contentShape(Rectangle())
            .padding(EdgeInsets(top: tokens.horizontalCellPadding / 2,
                                leading: tokens.horizontalCellPadding,
                                bottom: tokens.horizontalCellPadding / 2,
                                trailing: tokens.horizontalCellPadding))
            .frame(minHeight: height)
            .background(backgroundColor(configuration.isPressed))
    }

    private func backgroundColor(_ isPressed: Bool = false) -> Color {
        if isPressed {
            return Color(state.highlightedBackgroundColor ?? tokens.highlightedBackgroundColor)
        }
        return Color(state.backgroundColor ?? tokens.backgroundColor)
    }
}
