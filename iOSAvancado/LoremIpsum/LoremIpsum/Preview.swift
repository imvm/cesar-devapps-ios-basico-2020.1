//
//  Preview.swift
//  LoremIpsum
//
//  Created by Ian Manor on 30/03/21.
//

import SwiftUI

struct ContestView_Previews: PreviewProvider {
    static var previews: some View {
        ConteinerView().edgesIgnoringSafeArea(.all)
    }

    struct ConteinerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> ViewController {
            ViewController()
        }

        func updateUIViewController(_ uiViewController: ViewController, context: Context) {}
    }
}
