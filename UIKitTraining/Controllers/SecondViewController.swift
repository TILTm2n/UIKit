//
//  SecondViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 04.01.2022.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.title = "Second VC"
        self.navigationItem.title = "Second VC"
        self.view.backgroundColor = .yellow
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        self.tabBarItem = tabBarItem
        
    }
    
    //автоматическое возвращение на предыдущий контроллер через 3 секунды
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//        self.perform(#selector(goBack), with: nil, afterDelay: 3.0)
//    }
    
    @objc
    func goBack(){
        //navigationController?.popViewController(animated: true)
        
        //получаем текущий массив контроллеров
        var currentControllerArray = self.navigationController?.viewControllers
        
        //удаляем верхний контроллерр в стэке
        currentControllerArray?.removeLast()
        
        guard let newControllers = currentControllerArray else {return}
        
        self.navigationController?.viewControllers = newControllers
        
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
