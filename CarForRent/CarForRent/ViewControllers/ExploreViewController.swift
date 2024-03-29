//
//  FirstViewController.swift
//  CarForRent
//
//  Created by Quang Binh Dang on 20/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController, UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var searchController = UISearchController()
    
    @IBOutlet weak var brandCollectionView: ExploreCarsCollectionView!
    @IBOutlet weak var sydneyCollectionView: ExploreCarsCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hideKeyboardWhenTappedAround()
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        brandCollectionView.isBrandCollection = true
        title = "Explore"
    }
    
    @objc override func hideKeyboardWhenTappedAround() {
        super.hideKeyboardWhenTappedAround()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        sydneyCollectionView.cars?.removeAll(keepingCapacity: false)
        let array = sydneyCollectionView.cars!.filter {
            $0.brand.contains(searchController.searchBar.text!)
        }
        sydneyCollectionView.cars = array
        sydneyCollectionView.reloadData()
    }
}

