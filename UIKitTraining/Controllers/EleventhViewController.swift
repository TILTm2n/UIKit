//
//  EleventhViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 07.01.2022.
//

import UIKit

class EleventhViewController: UIViewController {

    let viewRed: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.backgroundColor = .red
        
        return view
    }()
    
    let viewBlue: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.backgroundColor = .blue
        
        return view
    }()
    
    let viewGreen: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.backgroundColor = .green
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Eleven VC"
        self.view.backgroundColor = .link
        self.tabBarController?.tabBar.isHidden = true
        
        view.addSubview(viewRed)
        view.addSubview(viewBlue)
        view.addSubview(viewGreen)
        
        createViewRedConstraint()
        createViewBlueConstraint()
        createViewGreenConstraint()
        
        
        //пытался переопределить действие back button, так чтобы tabbarcontroller снова появлялся
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close,
//                                                                target: self,
//                                                                action: #selector(presentTabBar(barButton:)))
        
        
        
        
        //язык форматирования
//        let viewVFL = ["viewRed": viewRed, "viewBlue": viewBlue]
//        let metrics = ["height": 100, "width": view.bounds.size.width / 3, "top": view.bounds.size.height / 2]
//
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-top-[viewRed(height)]|",
//                                                           options: [],
//                                                           metrics: metrics,
//                                                           views: viewVFL))
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-top-[viewBlue(height)]|",
//                                                           options: [],
//                                                           metrics: metrics,
//                                                           views: viewVFL))
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[viewRed(width)]-(50)-[viewBlue(width)]-|",
//                                                           options: [],
//                                                           metrics: metrics,
//                                                           views: viewVFL))
        
        //createView1Constraints()
        //createView2Constraints()
    }
    
    //позволяет вернуть tabbarcontroller при переходе из этого контроллера
    override func viewWillDisappear(_ animated: Bool) {
        if self.isMovingFromParent{
            super.tabBarController?.tabBar.isHidden = false
        }
    }
    
    
    @objc
    func presentTabBar(barButton: UIBarButtonItem){
        print("disappear")
        super.tabBarController?.tabBar.isHidden = false
        var currentViewControllers = self.navigationController?.viewControllers
        currentViewControllers?.removeLast()
        guard let newControllers = currentViewControllers else { return }
        self.navigationController?.viewControllers = newControllers
    }
    
    //ограничения с помощью якорей
    func createViewRedConstraint(){
        viewRed.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        viewRed.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        viewRed.heightAnchor.constraint(equalToConstant: 100).isActive = true
        viewRed.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func createViewBlueConstraint(){
        viewBlue.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        viewBlue.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        viewBlue.heightAnchor.constraint(equalToConstant: 100).isActive = true
        viewBlue.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func createViewGreenConstraint(){
        viewGreen.rightAnchor.constraint(equalTo: viewBlue.rightAnchor).isActive = true
        viewGreen.leftAnchor.constraint(equalTo: viewRed.leftAnchor).isActive = true
        viewGreen.bottomAnchor.constraint(equalTo: viewRed.topAnchor, constant: -20).isActive = true
        viewGreen.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    //способ задания constraints
    func createView1Constraints(){
        NSLayoutConstraint(item: viewRed,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: viewRed,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: viewRed,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 200).isActive = true
        NSLayoutConstraint(item: viewRed,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 200).isActive = true
    }
    
    func createView2Constraints(){
        NSLayoutConstraint(item: viewBlue,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: viewRed,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: viewBlue,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: viewRed,
                           attribute: .top,
                           multiplier: 1,
                           constant: -8).isActive = true
        NSLayoutConstraint(item: viewBlue,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 100).isActive = true
        NSLayoutConstraint(item: viewBlue,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 100).isActive = true
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
