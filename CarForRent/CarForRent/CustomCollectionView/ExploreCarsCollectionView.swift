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
    
    let reuseIdentifier = "ExploreCarsCollectionCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        register(ExploreCarsCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        delegate = self
        dataSource = self
        populate()
    }
    
    func populate(){
        user = User.getDefaultUser()
        cars = user?.rentingCars
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if let cars = cars {
            print("numberOfItemsInSection numberOfItemsInSection \(cars.count)")
            return cars.count
        }
        print("1111")
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ExploreCarsCollectionCell
        
        // Configure the cell
        if let cars = cars {
//            cell.awakeFromNib()
            cell.carData = cars[indexPath.item]
            cell.populate()
            
        }
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cars = cars {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let detailsViewController = storyboard.instantiateViewController(withIdentifier: "CarDetailsViewController") as! CarDetailsViewController
            detailsViewController.car = cars[indexPath.item]
            if let parentViewController = self.parentViewController {
                parentViewController.show(detailsViewController, sender: nil)
            }
            
        }
    }
//    var carData : Car?
    
//    func populate(){
//        if let myCar = carData {
//            if(myCar.carImages.count > 0) {
//                print("carImageView == \(myCar.carImages[0])")
//                let myImageView = UIImageView(image: UIImage(named: myCar.carImages[0]))
//                myImageView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height:self.bounds.height)
//                self.addSubview(myImageView)
//                branchLabel.text = myCar.brand
//            }
//        }
//
//    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    // MARK: Cell Flow Layou
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bounds.width/2.5, height: self.bounds.height/2)
    }
}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

