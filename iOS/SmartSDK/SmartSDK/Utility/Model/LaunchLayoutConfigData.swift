//
//  LaunchLayoutConfigData.swift
//  SmartShell
//
//  Created by Rajkumar.Panneerselvam on 21/02/24.
//

import Foundation

// MARK: - Welcome
public class LaunchLayoutConfigData: Codable {
    let buttons: [Button]

    init(buttons: [Button]) {
        self.buttons = buttons
    }
}

// MARK: - Button
class Button: Codable {
    let text, renderMode, windowType: String
    let url: String
    let header: Header

    init(text: String, renderMode: String, windowType: String, url: String, header: Header) {
        self.text = text
        self.renderMode = renderMode
        self.windowType = windowType
        self.url = url
        self.header = header
    }
}

// MARK: - Header
class Header: Codable {
    let isVisible, showClose, showBack: Bool

    init(isVisible: Bool, showClose: Bool, showBack: Bool) {
        self.isVisible = isVisible
        self.showClose = showClose
        self.showBack = showBack
    }
}
