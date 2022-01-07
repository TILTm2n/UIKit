//
//  ThirdViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 04.01.2022.
//

import UIKit

class ThirdViewController: UIViewController {

    var myButton = UIButton()
    var nineVCButton = UIButton()
    var TenVCButton = UIButton()
    var elevenVCButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Third VC"
        
        self.view.backgroundColor = .purple
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2 )
        self.tabBarItem = tabBarItem
        
        myButton = UIButton(type: .roundedRect)
        myButton.frame = CGRect(x: 110, y: 200, width: 100, height: 44)
        myButton.setTitle("press me", for: .normal)
        myButton.setTitle("i am pressed", for: .highlighted)
        myButton.addTarget(self, action: #selector(buttonIsPressed(sender:)), for: .touchDown)
        myButton.addTarget(self, action: #selector(buttonIsTapped(sender:)), for: .touchUpInside)
        myButton.addTarget(self, action: #selector(toFourthVC(sender:)), for: .touchUpInside)
        self.view.addSubview(myButton)
        
        nineVCButton = UIButton(type: .roundedRect)
        nineVCButton.frame = CGRect(x: 110, y: 300, width: 100, height: 44)
        nineVCButton.setTitle("to nine VC", for: .normal)
        nineVCButton.backgroundColor = .red
        nineVCButton.addTarget(self, action: #selector(goToNinethVC), for: .touchUpInside)
        self.view.addSubview(nineVCButton)
        
        TenVCButton = UIButton(type: .roundedRect)
        TenVCButton.frame = CGRect(x: 110, y: 400, width: 100, height: 44)
        TenVCButton.setTitle("to ten VC", for: .normal)
        TenVCButton.backgroundColor = .red
        TenVCButton.addTarget(self, action: #selector(goToTenthVC), for: .touchUpInside)
        self.view.addSubview(TenVCButton)
        
        elevenVCButton = UIButton(type: .roundedRect)
        elevenVCButton.frame = CGRect(x: 110, y: 450, width: 100, height: 44)
        elevenVCButton.setTitle("to eleven VC", for: .normal)
        elevenVCButton.backgroundColor = .red
        elevenVCButton.addTarget(self, action: #selector(goToEleventhVC), for: .touchUpInside)
        self.view.addSubview(elevenVCButton)
        
        
    }
    
    @objc
    func goToEleventhVC(){
        let eleventhVC = EleventhViewController()
        navigationController?.pushViewController(eleventhVC, animated: false)
    }
    
    @objc
    func goToTenthVC(){
        let tenVC = TenthViewController()
        navigationController?.pushViewController(tenVC, animated: false)
    }
    
    @objc
    func goToNinethVC(){
        let nineVC = NinethViewController()
        navigationController?.pushViewController(nineVC, animated: false)
    }
    
    @objc func buttonIsPressed(sender: UIButton){
        print("button is pressed")
    }
    
    @objc func buttonIsTapped(sender: UIButton){
        print("button is tapped")
    }
    
    @objc func toFourthVC(sender: UIButton){
        let fourthVC = FourthViewController()
        self.navigationController?.pushViewController(fourthVC, animated: false)
    }
    

}
