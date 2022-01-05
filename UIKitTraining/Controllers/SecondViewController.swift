//
//  SecondViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 04.01.2022.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    var myTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.title = "Second VC"
        self.navigationItem.title = "Second VC"
        self.view.backgroundColor = .yellow
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        self.tabBarItem = tabBarItem
        
        createTextField()
        myTextField.delegate = self
        
        //центр событий и обработчики событий
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldTextDidChange(ncParam:)), name: UITextField.textDidChangeNotification, object: nil)
        
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

    // MARK: - CreateUI
    fileprivate func createTextField() {
        let textFieldFrame = CGRect(x: 0, y: 0, width: 200, height: 31)
        myTextField = UITextField(frame: textFieldFrame)
        myTextField.borderStyle = .roundedRect
        myTextField.contentVerticalAlignment = .center
        myTextField.contentHorizontalAlignment = .center
        myTextField.placeholder = "I swift deweloper"
        myTextField.center = self.view.center
        self.view.addSubview(myTextField)
    }
    
    
    // MARK: - UITextFieldDelegate
//    //при выделении поля определяет редактируемо оно или нет
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        print("это поле можно редактировать")
//        return true
//    }
//    //срабатывает когда начался ввод
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("редактирование началось")
//    }
//
//    //срабатывает когда покидаем поле
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        print("редактирование закончилось")
//        return true
//    }
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print(string)
//        return true
//    }
//
//    func textFieldShouldClear(_ textField: UITextField) -> Bool {
//        print("очищено")
//        return true
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print("хотите убрать клавиатуру")
//        if textField == myTextField{
//            self.myTextField.resignFirstResponder()
//        }
//        return true
//    }
//
    // MARK: - Notification
    @objc func textFieldTextDidChange(ncParam: NSNotification){
        print(ncParam)
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
