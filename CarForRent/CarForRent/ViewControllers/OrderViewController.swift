//
//  OrderViewController.swift
//  CarForRent
//
//  Created by Quang Binh Dang on 20/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController, HorizontalScrollDelegate {
    
    @IBOutlet weak var scrollView: HorizontalScroll!
    
    var imageNames = ["Explore-Icon", "Favourite-Icon", "Profile-Icon", "Order-Icon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        populateData()
        print(scrollView.frame)
        
    }
    
    func populateData() {
        print("populateData populateData")
        scrollView.myDelegate = self
        scrollView.reload()
    }
    
    func numberOfScrollViewElements() -> Int {
        return imageNames.count
    }
    
    func elementAtScrollViewIndex(index: Int) -> UIImageView {
        let myImageView = UIImageView(image: UIImage.init(named: imageNames[index]))
        return myImageView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
