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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userList") as! UserTableViewCell
        let user = userList[indexPath.row]
        cell.name.text = user.login
        cell.url.text = user.followersUrl
        return cell
        
    }
    
    @IBOutlet weak var userTableView: UITableView!
    
    var apiManager : APIManager?
    var userList  = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.delegate = self
        userTableView.dataSource = self
        apiManager = APIManager()        
        Alamofire.request("https://api.github.com/users")
            .responseJSON { response in
                do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode([User].self, from: response.data!)
                    self.userList.append(contentsOf: user)
                    self.userTableView.reloadData()
                } catch let err {
                    print("Err", err)
                }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

