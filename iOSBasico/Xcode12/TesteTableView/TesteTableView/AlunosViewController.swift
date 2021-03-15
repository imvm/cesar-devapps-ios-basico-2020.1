//
//  AlunosViewController.swift
//  TesteTableView
//
//  Created by Ian Manor on 04/03/21.
//

import UIKit

enum Curso {
    case pos
    case graduacao
}

struct Aluno {
    var nome: String
    var idade: Int
    var curso: Curso
}

class AlunosViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let alunos: [Aluno] = [
        Aluno(nome: "Bruno", idade: 20, curso: .pos)
    ]

    func decidirPraOndeVai(aluno: Aluno) -> UIViewController {
        switch aluno.curso {
        case .pos:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let alunoViewController = storyboard.instantiateViewController(withIdentifier: "Aluno")
            alunoViewController.title = aluno.nome
            return alunoViewController
        case .graduacao:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let alunoViewController = storyboard.instantiateViewController(withIdentifier: "Aluno")
            alunoViewController.title = aluno.nome
            return alunoViewController
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AlunoViewController,
           let selectedRow = tableView.indexPathForSelectedRow?.row {
            destination.title = alunos[selectedRow].nome
        }
    }
}

extension AlunosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        alunos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let aluno = alunos[indexPath.row]
        cell.textLabel?.text = aluno.nome
        return cell
    }
}

extension AlunosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = indexPath.row
        let aluno = alunos[selectedRow]
        let destination = decidirPraOndeVai(aluno: aluno)
        self.navigationController?.pushViewController(destination, animated: true)
    }
}
