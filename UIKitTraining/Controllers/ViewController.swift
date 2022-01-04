//
//  ViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 03.01.2022.
//

import UIKit

class ViewController: UIViewController {

    var displaySecond = UIButton()
    let smileSwitch: UISwitch = {
        let smileSwitch = UISwitch()
        smileSwitch.isOn = true
        smileSwitch.addTarget(self, action: #selector(switchIsChanged(param:)), for: .valueChanged)
        return smileSwitch
    }()
    
    let segmentController: UISegmentedControl = {
        let items = ["up", "down"]
        let segment = UISegmentedControl(items: items)
        segment.isMomentary = false
        segment.addTarget(self, action: #selector(segmtContr(param:)), for: .valueChanged)
        return segment
    }()
    
    override func viewDidLoad() {
        self.title = "First VC"
        
        //part1
        toSecContrl()
        
        //part2
        
        //добавляем картинку в панель навигации
        //addImageToNavBar()
        
        //добавляем сегмент в панель навигации
        self.navigationItem.titleView = segmentController
        
        //добавление переключателя на место левой кнопки в панели навигации
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: smileSwitch)
        
        //добавляем стандартную UIBarButtonItem через код
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera,
                                                                 target: self,
                                                                 action: #selector(performAdd(param:)))
        
    }
    
    //MARK: - Part1
    @objc
    func performDisplaySecondVC(sender: Any){
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: false)
    }
    
    fileprivate func toSecContrl() {
        //part1
        displaySecond = UIButton(type: .system)
        displaySecond.setTitle("SecondVC", for: .normal)
        displaySecond.sizeToFit()
        displaySecond.center = view.center
        displaySecond.addTarget(self, action: #selector(performDisplaySecondVC(sender:)), for: .touchUpInside)
        view.addSubview(displaySecond)
    }
    
    //MARK: - Part2
    
    @objc
    func segmtContr(param: UISegmentedControl){
        switch param.selectedSegmentIndex{
        case 0:
            print("up")
        case 1:
            print("down")
        default:
            break
        }
    }
    
    @objc
    func performAdd(param: UIBarButtonItem){
        print("added")
    }
    
    @objc
    func switchIsChanged(param: UISwitch){
        if param.isOn {
            print("is on")
        } else {
            print("is off")
        }
    }
    
    fileprivate func addImageToNavBar() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        imageView.contentMode = .scaleToFill
        let image = UIImage(named: "sunrise")
        imageView.image = image
        
        self.navigationItem.titleView = imageView
    }
    
    

}


