//
//  MenuViewController.swift
//  Asembl
//
//  Created by ANTHONY ORSO on 12/15/18.
//  Copyright © 2018 Chris David. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var menuLogo: UIImageView!
    
    //Array of all Menu Items
    let homeItems = ["Home", "Notifications", "Chat", "Profile", "Friends", "Settings"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make Image logo into a Circle
        menuLogo.layer.cornerRadius = 37.5
        menuLogo.clipsToBounds = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeItems.count
    }

  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : MenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "LabelCell")
            as! MenuTableViewCell
        
       
         cell.menuLabel?.text = homeItems[indexPath.row]
        
         cell.iconImage.image = UIImage(named: homeItems[indexPath.row])
  
        return cell
    }

    
    //SEGUE
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: homeItems[indexPath.row], sender: self)
        
        let selectedCell : MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        
        selectedCell.contentView.backgroundColor = UIColor.blue

        
    }
    

}
