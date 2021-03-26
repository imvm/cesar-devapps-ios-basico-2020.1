//
//  UIApplication+activeTraitCollection.swift
//  CatalogoDeSnippets
//
//  Created by Ian Manor on 17/03/21.
//

import UIKit

extension UIApplication {
    /** Attempts to return the active trait collection for the first window, or an empty trait collection otherwise. Because this specifically uses the first window for the trait collection, it should only be used for system-wide settings – dark mode, scale, etc.
     */
    static var activeTraitCollection: UITraitCollection {
        if let activeTraits = UIApplication.shared.windows.first?.traitCollection {
            return activeTraits
        } else {
            return UITraitCollection()
        }
    }
}
