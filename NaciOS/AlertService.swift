//
//  AlertService.swift
//  NaciOS
//
//  Created by Jaber Shamali on 26/10/18.
//  Copyright © 2018 Jaber Shamali. All rights reserved.
//

import UIKit

class AlertService{
    
    private init() {}
    
    // add
    
    static func add(in vc: UIViewController, completion: @escaping (Livro) -> Void) {
        let alert = UIAlertController(title: "Add Livro", message: nil, preferredStyle: .alert)
        alert.addTextField { (livroTF) in
            livroTF.placeholder = "Titulo"
        }
        alert.addTextField { (autorTF) in
            autorTF.placeholder = "Autor"
        }
        let add = UIAlertAction(title: "Add", style: .default) { _ in
            guard
                let titulo = alert.textFields?.first?.text,
                let autor = alert.textFields?.last?.text
                else { return }
            
            let livro = Livro(titulo: titulo, autor: autor)
            completion(livro)
        }
        alert.addAction(add)
        vc.present(alert, animated: true)
    }
    
    
    
    
    
    //update
    static func update(_ livro: Livro, in vc: UIViewController, completion: @escaping (Livro) -> Void) {
        let alert = UIAlertController(title: "Update Livro", message: nil, preferredStyle: .alert)
        alert.addTextField { (livroTF) in
            livroTF.placeholder = "Titulo"
            livroTF.text = livro.titulo
        }
        alert.addTextField { (autorTF) in
            autorTF.placeholder = "Autor"
            autorTF.text = livro.autor
        }
        let update = UIAlertAction(title: "Update", style: .default) { _ in
            guard
                let titulo = alert.textFields?.first?.text,
                let autor = alert.textFields?.last?.text
                else { return }
            
            var updateLivro = livro
            updateLivro.titulo = titulo
            updateLivro.autor = autor
            
            completion(updateLivro)
        }
        alert.addAction(update)
        vc.present(alert, animated: true)
    }
}
