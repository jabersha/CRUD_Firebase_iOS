//
//  CadastroController.swift
//  NaciOS
//
//  Created by Jaber Shamali on 26/10/18.
//  Copyright © 2018 Jaber Shamali. All rights reserved.
//

import UIKit

class CadastroController: UIViewController {

    @IBOutlet weak var livroLb: UITextField!
    
    @IBOutlet weak var autorLb: UITextField!
    
    @IBAction func salvarLivro(_ sender: Any) {
        AlertService.add(in: self) { livro in
            FirestoreService.shared.create(for: livro, in: .livros)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}
