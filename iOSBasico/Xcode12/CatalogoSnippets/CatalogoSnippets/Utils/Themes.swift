//
//  Themes.swift
//  CatalogoDeSnippets
//
//  Created by Ian Manor on 17/03/21.
//

import UIKit
import Sourceful

/// A source code theme that has a dark background and light text.
public struct DarkTheme: SourceCodeTheme {
    public var lineNumbersStyle: LineNumbersStyle? = LineNumbersStyle(font: codeFont, textColor: Color.lightGray)
    public let gutterStyle: GutterStyle = GutterStyle(backgroundColor: Color(white: 0.15, alpha: 1), minimumWidth: 32)

    public let backgroundColor = Color.black
    public let font = codeFont

    public func globalAttributes() -> [NSAttributedString.Key: Any] {
        return [.font: codeFont, .foregroundColor: UIColor.white]
    }

    public func color(for syntaxColorType: SourceCodeTokenType) -> Color {
        switch syntaxColorType {
        case .plain:
            return .white

        case .number:
            return Color(red: 150/255, green: 134/255, blue: 245/255, alpha: 1.0)

        case .string:
            return Color(red: 252/255, green: 106/255, blue: 93/255, alpha: 1.0)

        case .identifier:
            return Color(red: 122/255, green: 200/255, blue: 182/255, alpha: 1.0)

        case .keyword:
            return Color(red: 252/255, green: 95/255, blue: 163/255, alpha: 1.0)

        case .comment:
            return Color(red: 108/255, green: 121/255, blue: 134/255, alpha: 1.0)

        case .editorPlaceholder:
            return backgroundColor
        }
    }
}

/// A source code theme that has a light background and dark text. This is the default.
public struct LightTheme: SourceCodeTheme {
    public var lineNumbersStyle: LineNumbersStyle? = LineNumbersStyle(font: codeFont, textColor: Color.darkGray)
    public let gutterStyle: GutterStyle = GutterStyle(backgroundColor: Color(white: 0.95, alpha: 1), minimumWidth: 32)

    public let backgroundColor = Color.white
    public let font = codeFont

    public func globalAttributes() -> [NSAttributedString.Key: Any] {
        return [.font: codeFont, .foregroundColor: UIColor.black]
    }

    public func color(for syntaxColorType: SourceCodeTokenType) -> Color {
        switch syntaxColorType {
        case .plain:
            return .black

        case .number:
            return Color(red: 28/255, green: 0/255, blue: 207/255, alpha: 1.0)

        case .string:
            return Color(red: 196/255, green: 26/255, blue: 22/255, alpha: 1.0)

        case .identifier:
            return Color(red: 63/255, green: 110/255, blue: 116/255, alpha: 1.0)

        case .keyword:
            return Color(red: 170/255, green: 13/255, blue: 145/255, alpha: 1.0)

        case .comment:
            return Color(red: 0, green: 116/255, blue: 0, alpha: 1.0)

        case .editorPlaceholder:
            return backgroundColor
        }
    }
}
