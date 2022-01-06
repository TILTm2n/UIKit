//
//  SixthViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 06.01.2022.
//

import UIKit

class SixthViewController: UIViewController {

    var myButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "SixthVC"
        self.navigationController?.navigationBar.backgroundColor = .blue
        view.backgroundColor = .orange
        
        createButton(myButton)
    }
    
    @objc
    func goToSixthVC(){
        let pageVC = MyPageViewController()
        navigationController?.pushViewController(pageVC, animated: false)
    }
    
    func createButton(_ button: UIButton){
        button.frame = CGRect(x: view.bounds.size.width/4,
                              y: view.center.y + 200,
                              width: 150, height: 50)
        button.setTitle("to sixVC", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(goToSixthVC), for: .touchUpInside)
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
