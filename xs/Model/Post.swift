//
//  Post.swift
//  xs
//
//  Created by Felipe Vallejo on 22/11/23.
//

import Firebase

// aqui vamos hacer un fetch de lo que tenemos en la carpeta "posts" en firestore
struct Post: Identifiable {
    // obligatoriamente necesitamos tener la propiedad id ya que Post es identifiable
    let id: String
    let username: String
    let profileImageUrl:String
    let fullname: String
    let caption: String
    let likes: Int
    let uid: String
    let timestamp: Timestamp
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profilelmageUrl"] as? String ??  "https://einercial.com/wp-content/uploads/2018/04/Facebook-no-profile-picture-icon-620x389.jpg"
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.uid = dictionary["uid"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
    }
    
    // se lo utiliza solo para mostrar brevemente la fecha del post
    var timestampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
    }
    
    // se utiliza para mostrar detalladamente la fecha en que se publico el post
    // para postdetailview
    var detailedTimestampString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a · MM/dd/yyyy"
        return formatter.string(from: timestamp.dateValue())
    }
}

