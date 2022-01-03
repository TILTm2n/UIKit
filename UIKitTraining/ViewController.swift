//
//  ViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 03.01.2022.
//

import UIKit

class ViewController: UIViewController {
    //Создали switch
    let mySwitch = UISwitch()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//                                      //var1
//        //определили его положение и размеры
//        self.mySwitch.frame = CGRect(x: 100, y: 100, width: 0, height: 0)
//
//        //разместили его в главном self.view
//        self.view.addSubview(self.mySwitch)
//
//        //вкл/выкл по дефолту
//        self.mySwitch.setOn(true, animated: true)
//
//        self.mySwitch.addTarget(self, action: #selector(switchChange(paramTarget:)), for: .valueChanged)
        
                                        //var2
        self.mySwitch.frame = CGRect.zero
        self.button.frame = CGRect.init(x: 100, y: 200, width: 200, height: 100)
        
        self.mySwitch.center = self.view.center
        self.mySwitch.tintColor = UIColor.green
        self.mySwitch.thumbTintColor = UIColor.red
        self.mySwitch.onTintColor = UIColor.blue
        
        self.button.backgroundColor = UIColor.orange
        self.button.setTitle("OK", for: .normal)
        self.button.setTitle("pressed", for: .highlighted)

        self.view.addSubview(self.mySwitch)
        self.view.addSubview(self.button)
        
        self.mySwitch.addTarget(self, action: #selector(blocking(target:)), for: .valueChanged)
        
    }
    
//                                      //var 1
//    @objc
//    func switchChange(paramTarget: UISwitch){
//        print("param is = \(paramTarget)")
//        if paramTarget.isOn {
//            print("is on")
//        }else{
//            print("is off")
//        }
//    }
    
                                        //var2
    @objc
    func blocking(target: UISwitch){
        if target.isOn{
            self.button.isUserInteractionEnabled = true
        }else{
            self.button.isUserInteractionEnabled = false
        }
    }


}

