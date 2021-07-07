//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import UIKit
import SwiftUI

/// Properties that make up list content
@objc public class MSFSelectableListState: MSFListState {
    @objc @Published public var selectedIndex: [IndexPath] = []
    @objc @Published public var disabledIndex: [IndexPath] = []
}

public struct MSFSelectableListView: View {
    @Environment(\.theme) var theme: FluentUIStyle
    @Environment(\.windowProvider) var windowProvider: FluentUIWindowProvider?
    @ObservedObject var tokens: MSFListTokens
    @ObservedObject var state: MSFSelectableListState

    public init(sections: [MSFListSectionState]) {
        self.state = MSFSelectableListState()
        self.tokens = MSFListTokens()
        self.state.sections = sections
    }

    public var body: some View {
        let sections = self.updateCellDividers()
        ScrollView {
            VStack(spacing: 0) {
                ForEach(sections.indices, id: \.self) { sectionIndex in
                    let section = sections[sectionIndex]
                    if let sectionTitle = section.title, !sectionTitle.isEmpty {
                        Header(state: section)
                    }

                    ForEach(section.cells.indices, id: \.self) { index in
                        let cellState = section.cells[index]
                        let isSelected = self.state.selectedIndex.contains(IndexPath(item: index, section: sectionIndex))
                        let isDisabled = self.state.disabledIndex.contains(IndexPath(item: index, section: sectionIndex))
                        MSFListCellView(state: cellState)
                            .checkMark(isSelected)
                            .tintColor(isDisabled ? .darkGray : (isSelected ? .blue : .black))
                            .frame(maxWidth: .infinity)
                    }
                    if section.hasDividers {
                        Divider()
                            .overlay(Color(tokens.borderColor))
                    }
                }
            }
        }
        .environment(\.defaultMinListRowHeight, 0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .designTokens(tokens,
                      from: theme,
                      with: windowProvider)
    }

    private func updateCellDividers() -> [MSFListSectionState] {
        state.sections.forEach { section in
            section.cells.forEach { cell in
                cell.hasDivider = section.hasDividers
            }
            section.cells.last?.hasDivider = false
        }
        return state.sections
    }
}

/// UIKit wrapper that exposes the SwiftUI List implementation
@objc open class MSFSelectableList: NSObject, FluentUIWindowProvider {

    @objc public init(sections: [MSFListSectionState],
                      theme: FluentUIStyle? = nil) {
        super.init()

        listView = MSFSelectableListView(sections: sections)
        hostingController = UIHostingController(rootView: AnyView(listView
                                                                    .windowProvider(self)
                                                                    .modifyIf(theme != nil, { listView in
                                                                        listView.customTheme(theme!)
                                                                    })))
        view.backgroundColor = UIColor.clear
    }

    @objc public convenience init(sections: [MSFListSectionState]) {
        self.init(sections: sections,
                  theme: nil)
    }

    @objc open var view: UIView {
        return hostingController.view
    }

    @objc open var state: MSFSelectableListState {
        return listView.state
    }

    var window: UIWindow? {
        return self.view.window
    }

    private var hostingController: UIHostingController<AnyView>!

    private var listView: MSFSelectableListView!
}
