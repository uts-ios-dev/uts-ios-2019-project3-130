//
//  CarDetailsViewController.swift
//  CarForRent
//
//  Created by Yuhui Liu on 21/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import UIKit

class CarDetailsViewController: UIViewController, HorizontalScrollDelegate {
    

    @IBOutlet weak var imageScrollView: HorizontalScroll!
    var car : Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad viewDidLoad ")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(imageScrollView.frame)
        imageScrollView.myDelegate = self
        imageScrollView?.reload()
    }
    
    func populateData(){
//        imageScrollView?.reload()
    }
    
    func numberOfScrollViewElements() -> Int {
        return (car?.carImages.count)!
    }
    
    func elementAtScrollViewIndex(index: Int) -> UIImageView {
        return UIImageView(image: UIImage(named: car?.carImages[index] ?? "defaultCarImage"))
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
