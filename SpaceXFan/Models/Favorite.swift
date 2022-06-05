//
//  Favorite.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 23.05.2022.
//

import Foundation

class Favorite {
    var favId: String?
    var rocketId: String
    var userId: String
    var rocketName: String
    var description: String
    var height: String
    var diameter: String
    var mass: String
    var enginesType: String
    var firstFlight: String
    var imageLink: [String]
    var defaultImageLinks: [String]!
    
    init(favId: String, rocketId: String, userId: String, rocketName: String,
         description: String, height: String, diameter: String, mass: String,
         enginesType: String, firstFlight: String, imageLink: [String]) {
        
        self.favId = favId
        self.rocketId = rocketId
        self.userId = userId
        self.rocketName = rocketName
        self.description = description
        self.height = height
        self.diameter = diameter
        self.mass = mass
        self.enginesType = enginesType
        self.firstFlight = firstFlight
        self.imageLink = imageLink
    }
    
    
    init(dictionary: NSDictionary) {
        favId = dictionary[kFAVID] as? String
        
        if let rocket = dictionary[kROCKETID] {
            rocketId = rocket as! String
        } else { rocketId = "" }
        
        if let user = dictionary[kUSERID] {
            userId = user as! String
        } else { userId = "" }
        
        if let rName = dictionary[kROCKETNAME] {
            rocketName = rName as! String
        } else { rocketName = "" }
        
        if let rDescription = dictionary[kDESCRIPTION] {
            description = rDescription as! String
        } else { description = "" }
        
        if let rHeight = dictionary[kHEIGHT] {
            height = rHeight as! String
        } else { height = "" }
        
        if let rDiameter = dictionary[kDIAMETER] {
            diameter = rDiameter as! String
        } else { diameter = "" }
        
        if let rMass = dictionary[kMASS] {
            mass = rMass as! String
        } else { mass = "" }
        
        if let rEngines = dictionary[kENGINESTYPE] {
            enginesType = rEngines as! String
        } else { enginesType = "" }
        
        if let rFlight = dictionary[kFIRSTFLIGHT] {
            firstFlight = rFlight as! String
        } else { firstFlight = "" }
        
        if let image = dictionary[kIMAGELINK] {
            imageLink = image as! [String]
        } else { imageLink = [] }
        
        defaultImageLinks = dictionary[kDEFAULTIMAGELINK] as? [String]
    }
}


//MARK: Save items func
func saveFavoriteToFirebase(favorite: Favorite) {
    FirebaseReference(.Favorite).document(favorite.favId!).setData(favoriteDictionaryFrom(favorite: favorite) as! [String:Any]) { (error) in
        if error != nil {
            print("Favori kayıt hatası \(error!.localizedDescription)")
        }
    }
}

//MARK: For favorite to dictionary func
func favoriteDictionaryFrom(favorite: Favorite) -> NSDictionary {
    return NSDictionary(objects: [favorite.favId, favorite.rocketId, favorite.userId, favorite.rocketName, favorite.description, favorite.height, favorite.diameter, favorite.mass, favorite.enginesType, favorite.firstFlight, favorite.imageLink, favorite.defaultImageLinks], forKeys: [kFAVID as NSCopying,kROCKETID as NSCopying, kUSERID as NSCopying, kROCKETNAME as NSCopying,kDESCRIPTION as NSCopying,kHEIGHT as NSCopying,kDIAMETER as NSCopying,kMASS as NSCopying,kENGINESTYPE as NSCopying,kFIRSTFLIGHT as NSCopying,kIMAGELINK as NSCopying, kDEFAULTIMAGELINK as NSCopying])
}

func downloadItemsWithIdFromFirebase(with userId: String, with favId: String, completion: @escaping (_ isFav: Bool) -> Void ) {
    FirebaseReference(.Favorite).whereField(kUSERID, isEqualTo: userId).whereField(kFAVID, isEqualTo: favId).getDocuments { (snapshot, error) in
        
        if let snapshot = snapshot {
            if snapshot.isEmpty {
                completion(false)
            } else {
                completion(true)
            }
        }
    }
}

//MARK: Download Item Func
func downloadItemsFromFirebase(with id: String, completion: @escaping (_ favoriteArray: [Favorite]) -> Void){
    var favoriteArray: [Favorite] = []
    FirebaseReference(.Favorite).whereField(kUSERID, isEqualTo: id).getDocuments { (snapshot, error) in
        guard let snapshot = snapshot else {
            completion(favoriteArray)
            return
        }
        if !snapshot.isEmpty {
            
            for favoriteDict in snapshot.documents{
                
                favoriteArray.append(Favorite(dictionary: favoriteDict.data() as NSDictionary))
            }
        }
        completion(favoriteArray)
    }
}

func deleteToFirebase(with favId: String) {
    FirebaseReference(.Favorite).document("\(favId)").delete()
}
