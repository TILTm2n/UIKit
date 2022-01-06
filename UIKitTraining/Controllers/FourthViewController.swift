//
//  FourthViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 06.01.2022.
//

import UIKit

class FourthViewController: UIViewController {

    var myImageView = UIImageView()
    let sunriseImage = UIImage(named: "sunrise")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Fourth VC"
        self.view.backgroundColor = .cyan
        
        myImageView = UIImageView(frame: self.view.bounds)
        myImageView.contentMode = .scaleAspectFit
        myImageView.image = sunriseImage
        myImageView.center = view.center
        view.addSubview(myImageView)
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
