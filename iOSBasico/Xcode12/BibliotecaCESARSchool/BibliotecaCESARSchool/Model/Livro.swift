//
//  Livro.swift
//  BibliotecaCESARSchool
//
//  Created by Ian Manor on 26/03/21.
//

import Foundation

struct Livro: Codable {
    var title: String
    var isbn: String?
    var pageCount: Int
    var thumbnailUrl: URL?
    var shortDescription: String?
    var longDescription: String?
    var authors: [String]
    var categories: [String]
    var publishedDate: Date?
    var quantity: Int
}
