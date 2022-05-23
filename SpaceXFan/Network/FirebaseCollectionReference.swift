//
//  FirebaseCollectionReference.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 23.05.2022.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
    
    case User
}


func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference{
    
    return Firestore.firestore().collection(collectionReference.rawValue)
    
}
