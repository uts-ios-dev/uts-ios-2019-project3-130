//
//  SecondViewController.swift
//  CarForRent
//
//  Created by Quang Binh Dang on 20/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import UIKit

class FavouriteViewController: UITableViewController, UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {
    var carPictures = CarDetailCell()
    
    var tableData : [Car] = []
    var filteredTableData = [Car]()
    var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLoadView()
        tableView.estimatedRowHeight = 2250
        tableView.rowHeight = UITableView.automaticDimension
        NotificationCenter.default.addObserver(self, selector: #selector(finishRetrieveCars(_:)), name: Notification.Name(ConstantDefinition.NotificationMessage.FinishedRetrieveCarData.stringValue), object: nil)
        tableData = DataManager.shared.allCars
    }
    
    func myLoadView() {
        tableView.delegate = self
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        
        tableView.tableHeaderView = searchController.searchBar
        
        searchController.delegate = self
        searchController.dimsBackgroundDuringPresentation = false // The default is true.
        searchController.searchBar.delegate = self // Monitor when the search button is tapped.
        definesPresentationContext = true
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if  (searchController.isActive) {
            return filteredTableData.count
        } else {
            return tableData.count
        }
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredTableData.removeAll(keepingCapacity: false)
        let matchingModels = self.tableData.filter { $0.name.lowercased().contains(searchController.searchBar.text!.lowercased()) }
        filteredTableData = matchingModels
        
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CarDetailCell
        
        if  (searchController.isActive) {
            cell.car = filteredTableData[indexPath.row]
        } else {
            cell.car = tableData[indexPath.row]
        }
        cell.populateData()
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToCarDetail") {
            let viewController = segue.destination as! CarDetailsViewController
            let cell = sender as! CarDetailCell
            viewController.car = cell.car
            viewController.populateData()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    // MARK: Notif handler
    @objc func finishRetrieveCars(_ notification:Notification){
        print("finishRetrieveCars finishRetrieveCars finishRetrieveCars")
        tableData = DataManager.shared.getCars()
        tableView.reloadData()
    }

}

