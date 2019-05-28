//
//  CarDetailCell.swift
//  CarForRent
//
//  Created by Yuhui Liu on 21/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import UIKit

class CarDetailCell: UITableViewCell {

    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carNameLabel: UILabel!
    var car : Car?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        carNameLabel.sizeToFit()
        carNameLabel.numberOfLines = 0
    }
    
    func populateData(){
        // Configure the cell...
        if let car = car {
            carNameLabel.text = "name: \(car.name) Brand: \(car.brand) \n Location: \(car.street) \n Price: \(car.price)"
        }
        carImage.image = UIImage(named: getThumbnailPic())
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getThumbnailPic() -> String {
        if let car = car {
            if(car.carImages.count > 0){ return car.carImages[0] }
        }
        
        return "defaultCarImage"
    }

}
