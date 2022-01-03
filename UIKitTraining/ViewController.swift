//
//  ViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 03.01.2022.
//

import UIKit
import AVFoundation //фрэймворк для работы с аудио и видео

class ViewController: UIViewController {
    
    var segmentControl = UISegmentedControl()
    var imageView = UIImageView()
    
    var menuArray = ["one", "two", "three"]
    var imageArray = [UIImage(named: "sunrise"),
                      UIImage(named: "canada"),
                      UIImage(named: "portret")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create imageView
        self.imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.imageView.center = self.view.center
        self.imageView.image = self.imageArray[0]
        self.view.addSubview(self.imageView)
        
        //create segment
        self.segmentControl = UISegmentedControl(items: self.menuArray)
        self.segmentControl.frame = CGRect(x: 95, y: 530, width: 200, height: 30)
        self.view.addSubview(self.segmentControl)
        
        self.segmentControl.addTarget(self, action: #selector(changeSegment(target:)), for: .valueChanged)
    }
    
    
    @objc
    func changeSegment(target: UISegmentedControl){
        if target == segmentControl{
            let segmentIndex = target.selectedSegmentIndex
            self.imageView.image = self.imageArray[segmentIndex]
            let pr = target.titleForSegment(at: segmentIndex)
            print(pr ?? "")
        }
    }

}


