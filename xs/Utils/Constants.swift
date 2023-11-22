//
//  Constants.swift
//  xs
//
//  Created by Felipe Vallejo on 21/11/23.
//

import Firebase
// constants nos ayudara a poder referir rapidamente a las colecciones que creamos en firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
