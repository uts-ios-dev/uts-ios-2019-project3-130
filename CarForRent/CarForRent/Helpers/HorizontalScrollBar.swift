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
    
    override func didMoveToSuperview() {
        reload()
    }
    
    func reload() {
        print("reload reload")
        if let del = myDelegate {
            //print("reload reload")
            var xOffset: CGFloat = 0
            for index in 0..<del.numberOfScrollViewElements() {
                let imageView = del.elementAtScrollViewIndex(index: index)
                imageView.frame = CGRect(x: xOffset, y: CGFloat(PADDING), width: CGFloat(250), height:CGFloat(250))
                imageView.contentMode = .scaleAspectFit
                    
                xOffset = xOffset + CGFloat(PADDING) + imageView.frame.size.width
                self.addSubview(imageView)

            }
            contentSize = CGSize(width: xOffset, height: self.frame.height)
        }
    }
}
