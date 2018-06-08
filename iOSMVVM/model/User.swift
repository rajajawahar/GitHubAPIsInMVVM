//
//  User.swift
//  iOSMVVM
//
//  Created by Raja Jawahar on 06/06/18.
//  Copyright © 2018 Raja Jawahar. All rights reserved.
//

import UIKit


struct User: Codable {
    
    var login : String?
    var id : Int32?
    var avatarUrl : String?
    var followersUrl : String?
    var reposUrl : String?
    var organisationUrl : String?
    
    private enum CodingKeys: String, CodingKey{
        case login
        case id
        case followersUrl = "followers_url"
        case avatarUrl = "avatar_url"
        case organisationUrl = "organisations_url"
    }

}
