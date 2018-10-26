//
//  SnapshotExtension.swift
//  NaciOS
//
//  Created by Jaber Shamali on 26/10/18.
//  Copyright © 2018 Jaber Shamali. All rights reserved.
//

import Foundation
import FirebaseFirestore

extension DocumentSnapshot{
    
    func decode<T: Decodable>(as objectType: T.Type, includingId:  Bool = true) throws -> T{
        var documentJson = data()
        if includingId{
            documentJson!["id"] = documentID
        }
        let documentData = try JSONSerialization.data(withJSONObject: documentJson!, options: [])
        let decodableObject = try JSONDecoder().decode(objectType, from: documentData)
        
        return decodableObject
        
    }
    
}
