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
            if(car.carImages.count >= 0){
                displayImage(imageLink: car.carImages[0])
            }
        }
        
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
    
    func displayImage(imageLink : String){
        let catPictureURL = URL(string: imageLink)!
        
        // Creating a session object with the default configuration.
        // You can read more about it here https://developer.apple.com/reference/foundation/urlsessionconfiguration
        let session = URLSession(configuration: .default)
        
        // Define a download task. The download task will download the contents of the URL as a Data object and then you can do what you wish with that data.
        let downloadPicTask = session.dataTask(with: catPictureURL) { (data, response, error) in
            // The download has finished.
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                // No errors found.
                // It would be weird if we didn't have a response, so check for that too.
                if (response as? HTTPURLResponse) != nil {
                    if let imageData = data {
                        // Finally convert that Data into an image and do what you wish with it.
                        
                        DispatchQueue.main.async {
                            let image = UIImage(data: imageData)
                            // Do something with your image.
                            self.carImage.image = image
                        }
                        
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
            
        }
        
        downloadPicTask.resume()
    }

}
