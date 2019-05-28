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
    let car1 = Car(id: 1, name:"Swift",brand:"Suzuki",price:50,location:"58 Bay street, Ultimo, Sydney", carImages : ["large","Suzuki-Swift-side","Suzuki-Swift-back","Suzuki-Swift-inside"])
    let car2 = Car(id: 2,name:"CX-5 SUV",brand:"Mazda",price:75,location:"101 Water street, Cabramatta West, Sydney" , carImages : ["MazdaCX-5","Mada-CX5-side","Mazda-CX5-back","Mazda-CX5-inside"])
    let car3 = Car(id: 3,name:"Q50 Sedan",brand:"Infiniti",price:150,location:"50 Rich street, Marrickville, Sydney", carImages : ["InfinitiQ50","Infiniti-q50-side","Infiniti-Q50-back","Infiniti-Q50-Inside"])
    
    var tableData : [Car] = []
    var filteredTableData = [Car]()
    var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableData = [car1,car2,car3]
        myLoadView()
        tableView.estimatedRowHeight = 2250
        tableView.rowHeight = UITableView.automaticDimension
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
        
        /** Search presents a view controller by applying normal view controller presentation semantics.
         This means that the presentation moves up the view controller hierarchy until it finds the root
         view controller or one that defines a presentation context.
         */
        
        /** Specify that this view controller determines how the search controller is presented.
         The search controller should be presented modally and match the physical size of this view controller.
         */
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

}

