// ButtonType.swift
// Created by Nate Birkholz

import SwiftUI

enum ButtonType {
    case paste
    case copy
    case clear
    
    var imageString: String {
        switch self {
        case .paste:
            return "square.and.arrow.down.on.square"
        case .copy:
            return "square.and.arrow.up.on.square"
        case .clear:
            return "minus.square.fill"
        }
    }
    
    var labelString: String {
        switch self {
        case .paste:
            return StringConstants.pasteButton
        case .copy:
            return StringConstants.copyButton
        case .clear:
            return StringConstants.clearButton
        }
    }
    
    var color: Color {
        switch self {
        case .paste:
            return Color.green
        case .copy:
            return Color.green
        case .clear:
            return Color.red
        }
    }
}
