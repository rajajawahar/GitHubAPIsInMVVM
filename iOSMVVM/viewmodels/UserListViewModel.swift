//
//  EmployeeViewModel.swift
//  iOSMVVM
//
//  Created by Raja Jawahar on 05/04/18.
//  Copyright © 2018 Raja Jawahar. All rights reserved.
//

import UIKit
import Alamofire

class UserListViewModel {
  
  var users = [User]()
  
  func fetchUserList(completion: @escaping() -> Void) {
    Alamofire.request("https://api.github.com/users")
      .responseJSON { response in
        do {
          let decoder = JSONDecoder()
          let user = try decoder.decode([User].self, from: response.data!)
          self.users.append(contentsOf: user)
          completion()
        } catch let err {
          print("Err", err)
        }
    }
  }
}


