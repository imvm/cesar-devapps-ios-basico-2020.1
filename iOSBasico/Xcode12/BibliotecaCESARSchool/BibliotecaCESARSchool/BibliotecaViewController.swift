//
//  BibliotecaViewController.swift
//  BibliotecaCESARSchool
//
//  Created by Ian Manor on 26/03/21.
//

import UIKit
import Nuke

class BibliotecaViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    let reuseIdentifier = "LivroCell"
    let biblioteca = Biblioteca.shared
    let preheater = ImagePreheater()

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "LivroCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
        collectionView.delegate = self
    }
}

extension BibliotecaViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        biblioteca.livros.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LivroCell

        let livro = biblioteca.livros[indexPath.row]
        cell.titleLabel.text = livro.title

        if let url = livro.thumbnailUrl {
            let options = ImageLoadingOptions(
                placeholder: UIImage(systemName: "book"),
                transition: .none
            )

            Nuke.loadImage(with: url, options: options, into: cell.imageView)
        }

        return cell
    }
}

extension BibliotecaViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let columns: CGFloat = 3
        let verticalInset: CGFloat = 16
        let spacing: CGFloat = 10
        let availableWidth = screenWidth - (verticalInset * 2) - (spacing * (columns - 1))
        let cellWidth = floor(availableWidth / columns)
        let cellHeight: CGFloat = 160
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

extension BibliotecaViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        let urls = indexPaths.compactMap { indexPath in
            Biblioteca.shared.livros[indexPath.row].thumbnailUrl
        }

        preheater.startPreheating(with: urls)
    }

    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        let urls = indexPaths.compactMap { indexPath in
            Biblioteca.shared.livros[indexPath.row].thumbnailUrl
        }

        preheater.stopPreheating(with: urls)
    }
}
