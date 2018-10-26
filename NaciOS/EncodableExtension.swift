//
//  EncodableExtension.swift
//  NaciOS
//
//  Created by Jaber Shamali on 26/10/18.
//  Copyright © 2018 Jaber Shamali. All rights reserved.
//

import Foundation

enum MyError: Error {
    case encodingError
}

extension Encodable{
    
    func toJson(excluding keys: [String] = [String]())throws -> [String: Any]{
        
        let objectData = try JSONEncoder().encode(self)
        let jsonObject = try JSONSerialization.jsonObject(with: objectData, options: [])
        guard var json = jsonObject as? [String: Any] else{ throw MyError.encodingError }
        return json
        
        for key in keys{
            json[key] = nil
        }
        
    }
}

