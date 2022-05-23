//
//  User.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 23.05.2022.
//

import Foundation
import FirebaseAuth
import UIKit

class User {
    var userId: String
    var name: String
    var email: String
    var phone: String
    var country: String
    var password: String
    
    init(userId: String, name: String, email: String, phone: String, country: String, password: String) {
        self.userId = userId
        self.name = name
        self.email = email
        self.phone = phone
        self.country = country
        self.password = password
    }
    
    init(dictionary: NSDictionary){
        //userId = dictionary[kUSERID] as! String
        
        if let id = dictionary[kUSERID] {
            userId = id as! String
        } else { userId = "" }
        
        if let userName = dictionary[kNAME] {
            name = userName as! String
        } else { name = "" }
        
        if let mail = dictionary[kEMAIL] {
            email = mail as! String
        } else { email = "" }
        
        if let number = dictionary[kPHONE] {
            phone = number as! String
        } else { phone = "" }
        
        if let userCountry = dictionary[kCOUNTRY] {
            country = userCountry as! String
        } else { country = "" }
        
        if let userPassword = dictionary[kPASSWORD] {
            password = userPassword as! String
        } else { password = "" }
    }
    //sefaabicerr@gmail.com
    
    
    //MARK: - Return current user
    class func currentId() -> String {
        return Auth.auth().currentUser!.uid
    }
    
    class func currentUser() -> User? {
        if Auth.auth().currentUser != nil {
            if let dictionary = UserDefaults.standard.object(forKey: kCURRENTUSER) {
                return User.init(dictionary: dictionary as! NSDictionary)
            }
        }
        return nil
    }


    
    
    //MARK: - For register user func
    class func registerUserWith(email: String, password: String,
                                completion: @escaping (_ error: Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            completion(error)
            
            if error == nil {
                //email doğrulama gönder
                authDataResult?.user.sendEmailVerification { (error) in
                    print("doğrulama hatası: ", error?.localizedDescription as Any)
                }
            }
        }
    }
    
    
    //MARK: - Login Func
    class func loginUserWith(email: String, password: String,
                             completion: @escaping (_ error: Error?, _ isEmailVerified: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
            if error == nil {
                if authDataResult!.user.isEmailVerified {
                    downloadUserFromFirebase(userId: authDataResult!.user.uid, email: email)
                    completion(error, true)
                } else {
                    print("email doğrulanmamış")
                    completion(error, false)
                }
            } else {
                completion(error, false)
            }
        }
    }
    
    class func resendEmailVerification(email : String, completion: @escaping (_ error: Error?) -> Void) {
        Auth.auth().currentUser?.reload() { error in
            Auth.auth().currentUser?.sendEmailVerification() { error in
                print("Email doğrulama gönderme hatası")
                completion(error)
            }
        }
    }
    
    //MARK: - Reset the password request func
    class func resetPasswordFor(email: String, completion: @escaping (_ error: Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            completion(error)
        }
    }
}

//MARK: Download User
func downloadUserFromFirebase(userId: String, email: String) {
    FirebaseReference(.User).document().getDocument() { (snapshot, error) in
        guard let snapshot = snapshot else { return }
        if snapshot.exists {
            print("kullanıcı firebaseden çekildi")
            saveUserLocally(userDictionary: snapshot.data()! as NSDictionary)
        } else {
            //kullanıcı yok, firebase yeni kullanıcı olarak ekle
            /*let currentUser = UserDefaults.standard.object(forKey: kCURRENTUSER)
            let user = User.init(dictionary: currentUser as! NSDictionary)
            user.userId = userId
            saveUserLocally(userDictionary: userDictionaryFrom(user: user))
            saveUserToFirebase(user: user)*/
        }
    }
}

//MARK: Save user to Firebase
func saveUserToFirebase(user: User) {
    FirebaseReference(.User).document(user.userId).setData(userDictionaryFrom(user: user) as! [String:Any]) { (error) in
        if error != nil {
            print("kullanıcı kayıt hatası \(error!.localizedDescription)")
        }
    }
}

//MARK: - Save user infos for Userdefaults func
func saveUserLocally(userDictionary: NSDictionary) {
    UserDefaults.standard.set(userDictionary, forKey: kCURRENTUSER)
    UserDefaults.standard.synchronize()
}

//MARK: - User to Dict func
func userDictionaryFrom(user:User) -> NSDictionary {
    return NSDictionary(objects: [user.userId, user.name, user.email, user.phone, user.country, user.password], forKeys: [kUSERID as NSCopying,kNAME as NSCopying,kEMAIL as NSCopying,kPHONE as NSCopying,kCOUNTRY as NSCopying, kPASSWORD as NSCopying])
    
}
