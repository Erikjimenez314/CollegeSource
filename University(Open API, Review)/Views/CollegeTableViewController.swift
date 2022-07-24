//
//  CollegeTableViewController.swift
//  University(Open API, Review)
//
//  Created by Erik Jimenez on 4/25/22.
//

import UIKit

class CollegeTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CollegeController.shared.colleges.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "collegeCell", for: indexPath) as? CollegeTableViewCell else {return UITableViewCell()}
        
        let college = CollegeController.shared.colleges[indexPath.row]
        
        cell.college = college
        
        return cell
    }
}

extension CollegeTableViewController {
    //    static var fetchedColleges = CollegeController.shared.colleges
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchText = searchBar.text,
              !searchText.isEmpty else {return}
        CollegeController.fetchCollege(searchTerm: searchText) { (fetchedColleges) in
            CollegeController.shared.colleges = fetchedColleges
            DispatchQueue.main.async {
                self.tableView.reloadData()
                CollegeController.shared.colleges = fetchedColleges
            }
        }
    }
}



