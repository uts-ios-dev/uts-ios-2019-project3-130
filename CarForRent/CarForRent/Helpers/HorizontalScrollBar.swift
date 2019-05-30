//
//  HorizontalScrollBar.swift
//  CarForRent
//
//  Created by Xinxin Ai on 21/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import Foundation
import UIKit

protocol HorizontalScrollDelegate {
    
    func numberOfScrollViewElements() -> Int
    
    func elementAtScrollViewIndex(index: Int) -> Car?
}

class HorizontalScroll: UIScrollView {
    
    let PADDING: Int = 10
    public var myDelegate : HorizontalScrollDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setUpScroll()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
//        setUpScroll()
    }
    
    override func didMoveToSuperview() {
        reload()
    }
    
    func reload() {
        if let del = myDelegate {
            print("reload reload 111")
            var xOffset: CGFloat = 0
            for index in 0..<del.numberOfScrollViewElements() {
                print("reload reload 2222")
                if let carData = del.elementAtScrollViewIndex(index: index) {
                    print("reload reload 3333")
                    let myImageView = UIImageView(image: UIImage.init(named: (carData.carImages[0])))
                    myImageView.frame = CGRect(x: xOffset, y: CGFloat(PADDING), width: CGFloat(250), height:CGFloat(250))
                    myImageView.contentMode = .scaleAspectFit
                    
                    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
                    myImageView.isUserInteractionEnabled = true
                    myImageView.addGestureRecognizer(tapGestureRecognizer)
                    myImageView.tag = index
                    xOffset = xOffset + CGFloat(PADDING) + myImageView.frame.size.width
                    self.addSubview(myImageView)
                    displayImage(imageLink: carData.carImages[0], imageView : myImageView)
                }
            }
            contentSize = CGSize(width: xOffset, height: self.frame.height)
        }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let v = tapGestureRecognizer.view!
        let tag = v.tag
        if let del = myDelegate {
            if let carData = del.elementAtScrollViewIndex(index: tag) {
                let nodeDict:[String: Any] = ["car": carData]
                NotificationCenter.default.post(name: Notification.Name(ConstantDefinition.NotificationMessage.ShowCarDetail.stringValue), object: nil, userInfo: nodeDict)
            }
        }
    }
    
    func displayImage(imageLink : String, imageView : UIImageView){
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
                            imageView.image = image
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
