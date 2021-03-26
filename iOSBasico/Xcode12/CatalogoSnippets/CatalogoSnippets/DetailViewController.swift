//
//  DetailViewController.swift
//  CatalogoSnippets
//
//  Created by Ian Manor on 25/03/21.
//

import UIKit
import Sourceful

class DetailViewController: UIViewController {
    @IBOutlet weak var textView: SyntaxTextView!
    let lexer = SwiftLexer()

    var snippet: Snippet? {
        didSet {
            refreshUI()
        }
    }

    private func refreshUI() {
        loadViewIfNeeded()
        title = snippet?.name ?? "New Snippet"
        textView.text = snippet?.content ?? ""
    }

    var sourceCodeTheme: SourceCodeTheme {
        if UIApplication.activeTraitCollection.userInterfaceStyle == .dark {
            return DarkTheme()
        } else {
            return LightTheme()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        textView.theme = sourceCodeTheme
        textView.delegate = self

        // Attach a toolbar with common key symbols to make typing easier.
        textView.contentTextView.inputAccessoryView = UIView.editingToolbar(target: self, action: #selector(insertCharacter))
    }

    /// Called when the user taps a key symbol in our input accessory view.
    @objc func insertCharacter(_ sender: UIBarButtonItem) {
        guard let value = UnicodeScalar(sender.tag) else { return }
        let string = String(value)
        textView.insertText(string)
        UIDevice.current.playInputClick()
    }
}

extension DetailViewController: SnippetSelectionDelegate {
    func snippetSelected(_ newSnippet: Snippet) {
        snippet = newSnippet
    }
}

extension DetailViewController: SyntaxTextViewDelegate {
    /// Send back our Swift lexer for this source code.
    func lexerForSource(_ source: String) -> Lexer {
        return lexer
    }
}
