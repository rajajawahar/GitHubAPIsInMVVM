//
//  APIManager.swift
//  iOSMVVM
//
//  Created by Raja Jawahar on 08/06/18.
//  Copyright © 2018 Raja Jawahar. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {
    
    func getUsersList() -> [User]{
        var userList : [User] = [User]()
        Alamofire.request("https://api.github.com/users")
            .responseJSON { response in
                do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode([User].self, from: response.data!)
                    userList.append(contentsOf: user)
                } catch let err {
                    print("Err", err)
                }
        }
        return userList
    }
}
