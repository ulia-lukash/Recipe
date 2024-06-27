//
//  Auth.swift
//  Recipe
//
//  Created by Uliana Lukash on 27.06.2024.
//

import Foundation
import FirebaseAuth

final class AuthManager {
    
    func registerUser(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            completion(authResult, error)
        }
    }
    
    func signInUser(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            completion(authResult, error)
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        }
        catch{
            print("Error signing out")
            print(error)
        }
        
    }
    
    func isLoggedIn() -> Bool {
        if let user = Auth.auth().currentUser {
            return true
        } else {
            return false
        }
    }
    
    func restorePassword(forUser email: String) {
        Auth.auth().sendPasswordReset(withEmail: email)
    }

}
