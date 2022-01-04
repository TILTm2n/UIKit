//
//  ViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 03.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.title = "First VC"
        self.navigationItem.title = "First VC"
        self.view.backgroundColor = .green
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        
        self.tabBarItem = tabBarItem
        
    }
    
    //MARK: - Part1
    @objc
    func performDisplaySecondVC(sender: Any){
        
    }
    
    
    
    

}


