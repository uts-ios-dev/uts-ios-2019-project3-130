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
    
    var myImageView : UIImageView = UIImageView()
    var brandLabel : UILabel = UILabel()
    
    var carData : Car?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populate(){
        myImageView.removeFromSuperview()
        brandLabel.removeFromSuperview()
        if let myCar = carData {
            myImageView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height:self.bounds.height*2/3)
            myImageView.contentMode = .scaleAspectFit
            self.addSubview(myImageView)
            
            brandLabel = UILabel(frame: CGRect(x: 0, y: myImageView.frame.height, width: self.bounds.width, height: self.bounds.height*1/3))
            brandLabel.textAlignment = .center
            self.addSubview(brandLabel)
            
            if(myCar.carImages.count > 0) {
                displayImage(imageLink: myCar.carImages[0])
            }
            brandLabel.text = myCar.brand
        }
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
                            self.myImageView.image = image
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
