//
//  ViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 03.01.2022.
//

import UIKit

class ViewController: UIViewController {

    var displaySecond = UIButton()
    
    override func viewDidLoad() {
        self.title = "First VC"
        
        displaySecond = UIButton(type: .system)
        displaySecond.setTitle("SecondVC", for: .normal)
        displaySecond.sizeToFit()
        displaySecond.center = view.center
        displaySecond.addTarget(self, action: #selector(performDisplaySecondVC(sender:)), for: .touchUpInside)
        view.addSubview(displaySecond)
    }
    
    
    @objc
    func performDisplaySecondVC(sender: Any){
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }

}


