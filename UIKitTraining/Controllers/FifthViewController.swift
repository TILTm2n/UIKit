//
//  FifthViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 06.01.2022.
//

import UIKit
import WebKit

class FifthViewController: UIViewController, WKUIDelegate {
    
    var myProgressView = UIProgressView()
    var myButton = UIButton()
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "First VC"
        self.view.backgroundColor = .systemGreen
        
        createProgress(myProgressView)
        createButton(myButton)
        createTimer()
        
    }
    
    // MARK: - Timer
    func createTimer() {
        myTimer = Timer.scheduledTimer(timeInterval: 1,
                                       target: self,
                                       selector: #selector(updateProgressView),
                                       userInfo: nil,
                                       repeats: true)
    }
    
    // MARK: - Selector
    @objc func updateProgressView(){
        if myProgressView.progress != 1.0{
            myProgressView.progress += 0.1
        }else if myProgressView.progress == 1.0{
            UIView.animate(withDuration: 0.7) {
                self.myButton.alpha = 1
                self.myButton.setTitle("Старт", for: .normal)
                self.myTimer.invalidate()
            }
        }
    }
    
    
    // MARK: - Methods
    func createProgress(_ progressView: UIProgressView) {
        myProgressView.progressViewStyle = .bar
        myProgressView.frame = CGRect(x: view.center.x,
                                      y: view.center.y,
                                      width: 150,
                                      height: 50)
        myProgressView.setProgress(0.0, animated: true)
        myProgressView.progressTintColor = UIColor.blue
        myProgressView.trackTintColor = .gray
        myProgressView.center = view.center
        view.addSubview(myProgressView)
    }
    
    func createButton(_ button: UIButton){
        button.frame = CGRect(x: view.bounds.size.width/4,
                              y: view.center.y + 100,
                              width: 150, height: 50)
        button.setTitle("загрузка", for: .normal)
        button.setTitle("pressed", for: .highlighted)
        button.setTitleColor(.purple, for: .normal)
        button.backgroundColor = .orange
        view.addSubview(button)
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
