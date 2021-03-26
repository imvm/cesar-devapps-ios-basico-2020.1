//
//  CodeFont.swift
//  CatalogoDeSnippets
//
//  Created by Ian Manor on 17/03/21.
//

import UIKit

/// The basic font used for code in the app, scaled up for Dynamic Type.
var codeFont: UIFont {
    let metrics = UIFontMetrics(forTextStyle: .body)
    let baseFont = UIFont(name: "Menlo", size: 17) ?? UIFont.systemFont(ofSize: 17)
    return metrics.scaledFont(for: baseFont)
}
