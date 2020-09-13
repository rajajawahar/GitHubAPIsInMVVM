//
//  ViewController.swift
//  iOSMVVM
//
//  Created by Raja Jawahar on 05/04/18.
//  Copyright © 2018 Raja Jawahar. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

  @IBOutlet weak var userTableView: UITableView!
  
  var userListViewModel = UserListViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    userTableView.delegate = self
    userTableView.dataSource = self
    userListViewModel.fetchUserList { [weak self]  in
      self?.userTableView.reloadData()
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return userListViewModel.users.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "userList") as! UserTableViewCell
    let user = userListViewModel.users[indexPath.row]
    cell.name.text = user.login
    cell.url.text = user.followersUrl
    cell.avatar.imageFromUrl(urlString: user.avatarUrl!)
    cell.avatar.layer.cornerRadius = cell.avatar.frame.size.width / 2;
    cell.avatar.layer.masksToBounds = true;
    return cell
  }
  
}

