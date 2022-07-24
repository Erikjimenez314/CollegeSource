//
//  AccountTableViewController.swift
//  University(Open API, Review)
//
//  Created by Erik Jimenez on 6/23/22.
//

import UIKit

class AccountTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "TumblrScapes8"))
        tableView.reloadData()
    }
    var sharedInstance = CollegeController.shared
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CollegeController.arrayOfAccounts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let instance = CollegeController.arrayOfAccounts[indexPath.row]
        
        cell.textLabel?.text = instance.name
        
        
        return cell
    }
    // MARK: - Navigation
    //
    //       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //
    //           if segue.identifier == "AccountTableViewToDetail" {
    //               guard let indexPath = tableView.indexPathForSelectedRow,
    //                     let destination = segue.destination as? AccountDetailViewController else { return }
    //               let selectedAccountViews = CollegeController.arrayOfAccounts[indexPath.row]
    //               destination.accountViews = selectedAccountViews
    
    //               var AccountViews = CollegeController.arrayOfAccounts[indexPath.row]
    //           }
    //       }
}


 
