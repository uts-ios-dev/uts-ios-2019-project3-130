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
    
    func elementAtScrollViewIndex(index: Int) -> UIImageView
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
    
//    func setUpScroll() {
//        scroller = UIScrollView()
//
////        let dict = [ "scroller": scroller]
////
////        let constraint1 = NSLayoutConstraint.constraints(withVisualFormat: "H:|[scroller]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: dict as [String : Any])
////        let constraint2 = NSLayoutConstraint.constraints(withVisualFormat: "V:|[scoller]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: dict as [String : Any])
////
////        self.addConstraints(constraint1)
////        self.addConstraints(constraint2)
////        self.addSubview(scroller)
//    }
    
    override func didMoveToSuperview() {
        reload()
    }
    
    func reload() {
        print("reload reload")
        if let del = myDelegate {
            print("reload reload")
            var xOffset: CGFloat = 0
            for index in 0..<del.numberOfScrollViewElements() {
                let imageView = del.elementAtScrollViewIndex(index: index)
                imageView.frame = CGRect(x: xOffset, y: CGFloat(PADDING), width: CGFloat(120.0), height: CGFloat(120.0))

                xOffset = xOffset + CGFloat(PADDING) + imageView.frame.size.width
                self.addSubview(imageView)

            }
            contentSize = CGSize(width: xOffset, height: self.frame.height)
        }
    }
}
