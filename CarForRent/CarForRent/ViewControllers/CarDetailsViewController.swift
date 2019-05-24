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

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var CarDetailDescription: UILabel!
    var car : Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad viewDidLoad ")

      scroll.frame = view.frame
      scroll.contentSize = CGSize(width: self.view.frame.size.width, height: 700)
        CarDetailDescription.sizeToFit()
        CarDetailDescription.numberOfLines = 0
        elementAtCarDetailsScrollViewIndex(car: car!)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(imageScrollView.frame)
        imageScrollView.myDelegate = self
        imageScrollView?.reload()
    }
    
    func populateData(){
//        imageScrollView.contentSize
//        imageScrollView?.reload()
    }
    
    func numberOfScrollViewElements() -> Int {
        return (car?.carImages.count)!
    }
    
    func elementAtScrollViewIndex(index: Int) -> UIImageView {
        return UIImageView(image: UIImage(named: car?.carImages[index] ?? "defaultCarImage"))
    }
    func elementAtCarDetailsScrollViewIndex(car:Car) {
        CarDetailDescription.text = " Name: \(car.name) \n Brand: \(car.brand) \n Location: \(car.location) \n Price: \(car.price)"
        
    }
    @IBAction func Goback(_ sender: UIButton) {

            dismiss(animated: true, completion: nil)
      
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
