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
        
//        let resultsTableController = storyboard.instantiateViewController(withIdentifier: "FavouriteViewController") as! FavouriteViewController
//        resultsTableController.myLoadView()
//        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
    }
    
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        if let resultView = searchResultView  {
//            resultView.isHidden = false
//        } else {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let resultsTableController = storyboard.instantiateViewController(withIdentifier: "FavouriteViewController") as! FavouriteViewController
//            resultsTableController.myLoadView()
//            //        searchBar = resultsTableController.searchController.searchBar
//            searchResultView = resultsTableController.view
//            view.addSubview(searchResultView!)
//        }
//    }
    
    @objc override func hideKeyboardWhenTappedAround() {
        super.hideKeyboardWhenTappedAround()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        print("updateSearchResults updateSearchResults")
        sydneyCollectionView.cars?.removeAll(keepingCapacity: false)
        let array = sydneyCollectionView.cars!.filter {
            $0.brand.contains(searchController.searchBar.text!)
        }
        sydneyCollectionView.cars = array
        sydneyCollectionView.reloadData()
    }
}

