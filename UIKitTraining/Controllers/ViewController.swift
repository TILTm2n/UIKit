//
//  ViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 03.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    var myButton = UIButton()
    var toSevenVCButton = UIButton()
    var toEightVCButton = UIButton()
    
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
        
        myButton = UIButton(frame: CGRect(x: 100, y: 100, width: 150, height: 40))
        myButton.backgroundColor = .orange
        myButton.setTitle("to fifth VC", for: .normal)
        myButton.layer.cornerRadius = 5
        myButton.addTarget(self, action: #selector(goToFifthVC(sender:)), for: .touchUpInside)
        view.addSubview(myButton)
        
        toSevenVCButton = UIButton(frame: CGRect(x: 100, y: 205, width: 150, height: 40))
        toSevenVCButton.backgroundColor = .red
        toSevenVCButton.setTitle("to seventh VC", for: .normal)
        toSevenVCButton.layer.cornerRadius = 5
        toSevenVCButton.addTarget(self, action: #selector(goToSeventhVC(sender:)), for: .touchUpInside)
        view.addSubview(toSevenVCButton)
        
        toEightVCButton = UIButton(frame: CGRect(x: 100, y: 305, width: 150, height: 40))
        toEightVCButton.backgroundColor = .red
        toEightVCButton.setTitle("to eighth VC", for: .normal)
        toEightVCButton.layer.cornerRadius = 5
        toEightVCButton.addTarget(self, action: #selector(goToEighthVC(sender:)), for: .touchUpInside)
        view.addSubview(toEightVCButton)
        
        
    }
    
    //MARK: - Part1
    @objc
    func goToFifthVC(sender: UIButton){
        let fifthVC = FifthViewController()
        self.navigationController?.pushViewController(fifthVC, animated: false)
    }
    
    @objc
    func goToSeventhVC(sender: UIButton){
        let seventhVC = SeventhViewController()
        self.navigationController?.pushViewController(seventhVC, animated: false)
    }
    
    @objc
    func goToEighthVC(sender: UIButton){
        let eighthVC = EightViewController()
        self.navigationController?.pushViewController(eighthVC, animated: false)
    }
    
    
    

}


