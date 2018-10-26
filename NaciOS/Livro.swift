//
//  Livro.swift
//  NaciOS
//
//  Created by Jaber Shamali on 26/10/18.
//  Copyright © 2018 Jaber Shamali. All rights reserved.
//

import Foundation

protocol Identifiable{
    var id: String?{ get set }
}

struct  Livro: Codable, Identifiable {
    var id: String? = nil
    var titulo : String
    var autor : String
    
    init(titulo: String, autor: String) {
        self.titulo = titulo
        self.autor = autor
    }
}
