//
//  LivroController.swift
//  NaciOS
//
//  Created by Jaber Shamali on 26/10/18.
//  Copyright © 2018 Jaber Shamali. All rights reserved.
//

import UIKit

class LivroController: UITableViewController {

    var livros = [Livro]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirestoreService.shared.read(from: .livros, returning: Livro.self) { (livros) in
            self.livros = livros
            self.tableView.reloadData()
        }

    }

    @IBAction func addLivro(_ sender: Any) {
        AlertService.addUser(in: self) { livro in
          FirestoreService.shared.create(for: livro, in: .livros)
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return livros.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let livro = livros[indexPath.row]
        
        cell.textLabel?.text = livro.titulo
        cell.textLabel?.text = livro.autor
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let livro = livros[indexPath.row]
        
        AlertService.update(livro, in: self) { livro in
        FirestoreService.shared.update(for: livro, in: .livros)
            
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        let livro = livros[indexPath.row]
        FirestoreService.shared.delete(livro, in: .livros)
        
    }
    
}
