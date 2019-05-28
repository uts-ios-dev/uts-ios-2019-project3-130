//
//  HorizontalScrollBar.swift
//  CarForRent
//
//  Created by Xinxin Ai on 21/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import Foundation
import UIKit

@objc protocol HorizontalScrollDelegate {
    
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
        print("reload reload")
        if let del = myDelegate {
            //print("reload reload")
            var xOffset: CGFloat = 0
            for index in 0..<del.numberOfScrollViewElements() {
                if let carData = del.elementAtScrollViewIndex(index: index) {
                    let myImageView = UIImageView(image: UIImage.init(named: (carData.carImages[0])))
                    myImageView.frame = CGRect(x: xOffset, y: CGFloat(PADDING), width: CGFloat(250), height:CGFloat(250))
                    myImageView.contentMode = .scaleAspectFit
                    
                    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
                    myImageView.isUserInteractionEnabled = true
                    myImageView.addGestureRecognizer(tapGestureRecognizer)
                    
                    xOffset = xOffset + CGFloat(PADDING) + myImageView.frame.size.width
                    self.addSubview(myImageView)
                }
            }
            contentSize = CGSize(width: xOffset, height: self.frame.height)
        }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsViewController = storyboard.instantiateViewController(withIdentifier: "CarDetailsViewController") as! CarDetailsViewController
//        detailsViewController.car =
        if let parentViewController = tappedImage.parentViewController {
            parentViewController.show(detailsViewController, sender: nil)
        }
        // Your action
        
        
    }
}
