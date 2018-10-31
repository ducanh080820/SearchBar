//
//  TableViewController.swift
//  SearchBar
//
//  Created by Trần Đức Anh on 10/23/18.
//  Copyright © 2018 Trần Đức Anh. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var nameCity = ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX",
                    "Philadelphia, PA", "Phoenix, AZ", "San Diego, CA", "San Antonio, TX",
                    "Dallas, TX", "Detroit, MI", "San Jose, CA", "Indianapolis, IN",
                    "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Austin, TX",
                    "Memphis, TN", "Baltimore, MD", "Charlotte, ND", "Fort Worth, TX"]
    var filterData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        searchBar.delegate = self
        filterData = nameCity
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filterData[indexPath.row]
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterData = searchText.isEmpty ? nameCity : nameCity.filter { (item: String) -> Bool in
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        tableView.reloadData()
    }
    
    func filtedData(data: String, value: Character) -> Bool {
        <#function body#>
    }
    
    func check(char: Character) -> Bool {
        let value = ""
        for i in value {
            if i == char {
                return true
            }
        }
        
        return false
    }
    
}
