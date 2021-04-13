//
//  Page.swift
//  DemoPageView
//
//  Created by Ian Manor on 12/04/21.
//

enum Page: Int, CaseIterable {
    case pageOne
    case pageTwo
    case pageThree

    var index: Int {
        rawValue
    }

    var title: String {
        switch self {
        case .pageOne:
            return "Página 1"
        case .pageTwo:
            return "Página 2"
        case .pageThree:
            return "Página 3"
        }
    }
}
