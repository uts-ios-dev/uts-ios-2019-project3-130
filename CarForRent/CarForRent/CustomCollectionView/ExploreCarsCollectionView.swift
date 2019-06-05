//
//  ExploreCarsCollectionView.swift
//  CarForRent
//
//  Created by Quang Binh Dang on 28/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import Foundation
import UIKit

class ExploreCarsCollectionView : UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var user : User?
    var cars : [Car]?
    var isBrandCollection = false
    let reuseIdentifier = "ExploreCarsCollectionCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        register(ExploreCarsCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        delegate = self
        dataSource = self
        reload()
        NotificationCenter.default.addObserver(self, selector: #selector(finishRetrieveCars(_:)), name: Notification.Name(ConstantDefinition.NotificationMessage.FinishedRetrieveCarData.stringValue), object: nil)
    }
    
    func reload(){
        cars = DataManager.shared.allCars
        if(isBrandCollection) {
            filterCarBrand()
            
        }
        reloadData()
    }
    
    func filterCarBrand(){
        var uniqueValues: [String] = []
        var uniqueCars : [Car] = []
        for item in cars! {
            if !uniqueValues.contains(item.brand){
                uniqueValues.append(item.brand)
                uniqueCars.append(item)
            }
        }
        cars = uniqueCars
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if let cars = cars {
            return cars.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ExploreCarsCollectionCell
        
        // Configure the cell
        if let cars = cars {
//            cell.awakeFromNib()
            cell.carData = cars[indexPath.item]
            cell.isBrandCollection = self.isBrandCollection
            cell.populate()
            
        }
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cars = cars {
            if(isBrandCollection){
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let detailsViewController = storyboard.instantiateViewController(withIdentifier: "FavouriteViewController") as! FavouriteViewController
                detailsViewController.isBrandFiltered = true
                if let parentViewController = self.parentViewController {
                    parentViewController.navigationController?.pushViewController(detailsViewController, animated: true)
                    detailsViewController.tableData = DataManager.shared.CarsWithBrand(brand: cars[indexPath.item].brand)
                    detailsViewController.tableView.reloadData()
                }
            } else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let detailsViewController = storyboard.instantiateViewController(withIdentifier: "CarDetailsViewController") as! CarDetailsViewController
                detailsViewController.car = cars[indexPath.item]
                if let parentViewController = self.parentViewController {
                    parentViewController.navigationController?.pushViewController(detailsViewController, animated: true)
                }
            }
        }
    }
    
    // MARK: Cell Flow Layou
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bounds.width/3, height: self.bounds.height/2)
    }
    
    @objc func finishRetrieveCars(_ notification:Notification){
        reload()
    }
}

