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
    var searchResultView : UIView?
    
    @IBOutlet weak var brandCollectionView: ExploreCarsCollectionView!
    @IBOutlet weak var sydneyCollectionView: ExploreCarsCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hideKeyboardWhenTappedAround()
        
//        let resultsTableController = storyboard.instantiateViewController(withIdentifier: "FavouriteViewController") as! FavouriteViewController
//        resultsTableController.myLoadView()
//        
//        searchController = UISearchController(searchResultsController: resultsTableController)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if let resultView = searchResultView  {
            resultView.isHidden = false
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let resultsTableController = storyboard.instantiateViewController(withIdentifier: "FavouriteViewController") as! FavouriteViewController
            resultsTableController.myLoadView()
            //        searchBar = resultsTableController.searchController.searchBar
            searchResultView = resultsTableController.view
            view.addSubview(searchResultView!)
        }
    }
    
    @objc override func hideKeyboardWhenTappedAround() {
        super.hideKeyboardWhenTappedAround()
        
        if let resultView = searchResultView  {
            resultView.isHidden = true
        }
    }
}

