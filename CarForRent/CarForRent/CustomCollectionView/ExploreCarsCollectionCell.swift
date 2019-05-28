//
//  ExploreCarsCollectionCell.swift
//  CarForRent
//
//  Created by Quang Binh Dang on 28/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import Foundation
import UIKit

class ExploreCarsCollectionCell : UICollectionViewCell {
    
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var branchLabel: UILabel!
    var carData : Car?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populate(){
        if let myCar = carData {
            if(myCar.carImages.count > 0) {
                let myImageView = UIImageView(image: UIImage(named: myCar.carImages[0]))
                myImageView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height:self.bounds.height*2/3)
                self.addSubview(myImageView)
                
                let brandLabel = UILabel(frame: CGRect(x: 0, y: myImageView.frame.height, width: self.bounds.width, height: self.bounds.height*1/3))
                brandLabel.text = myCar.brand
                brandLabel.textAlignment = .center
                self.addSubview(brandLabel)
            }
        }
        
    }
    
}
