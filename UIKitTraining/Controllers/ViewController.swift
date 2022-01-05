//
//  ViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 03.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.title = "First VC"
        self.navigationItem.title = "First VC"
        self.view.backgroundColor = .green
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        
        self.tabBarItem = tabBarItem
        
        let labelFrame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        label.frame = labelFrame
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "IOS 15 and Xcode 13"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.center = self.view.center
        label.sizeToFit()
        label.shadowColor = UIColor.lightGray
        label.shadowOffset = CGSize(width: 2, height: 2)
        view.addSubview(label)
        
    }
    
    //MARK: - Part1
    @objc
    func performDisplaySecondVC(sender: Any){
        
    }
    
    
    
    

}


