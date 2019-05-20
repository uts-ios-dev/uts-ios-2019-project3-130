//
//  FirstViewController.swift
//  CarForRent
//
//  Created by Quang Binh Dang on 20/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController, UISearchControllerDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultsTableController = storyboard.instantiateViewController(withIdentifier: "SearchResultTableViewController") as! SearchResultTableViewController
        resultsTableController.myLoadView()
//        searchBar = resultsTableController.searchController.searchBar
        
        view.addSubview(resultsTableController.view)
    }
}

