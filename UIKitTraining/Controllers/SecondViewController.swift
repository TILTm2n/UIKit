//
//  SecondViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 04.01.2022.
//

import UIKit

class SecondViewController: UIViewController{
    
    var myTextView = UITextView()
    var myButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.title = "Second VC"
        self.navigationItem.title = "Second VC"
        self.view.backgroundColor = .yellow
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        self.tabBarItem = tabBarItem
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(param:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(param:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //растягиваем UITextView на все self.view(bounds) а не на UIWindow(это frame для UITextView)
        myTextView = UITextView(frame: CGRect(x: 20, y: 100, width: self.view.bounds.size.width - 50, height: self.view.bounds.size.height/2))
        
        myTextView.text = "Some text"
        
        //задаем отступы
        myTextView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        myTextView.font = UIFont.systemFont(ofSize: 17)
        myTextView.backgroundColor = UIColor.lightGray
        
        self.view.addSubview(myTextView)
        
        createButton(myButton)
        
        
    }
    
    func createButton(_ button: UIButton){
        button.frame = CGRect(x: view.bounds.size.width/4,
                              y: view.center.y + 200,
                              width: 150, height: 50)
        button.setTitle("to sixVC", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(goToSixthVC), for: .touchUpInside)
        view.addSubview(button)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("fjdfjajfn")
    }
    
    //автоматическое возвращение на предыдущий контроллер через 3 секунды
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//        self.perform(#selector(goBack), with: nil, afterDelay: 3.0)
//    }
    
    @objc
    func goToSixthVC(){
        let sixthVC = SixthViewController()
        navigationController?.pushViewController(sixthVC, animated: false)
    }
    
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
    
    
    // MARK: - Notification
    //этот метод нужен чтобы двигать редактируемый элемент вслед за всплывающей клавиатурой
    @objc func updateTextView(param: NSNotification){
        let userInfo = param.userInfo
        
        //получаем координаты прямоугольника рамки клавиатуры
        let getKeyboardRect = (userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        //конвертируем во view
        let keyboardFrame = self.view.convert(getKeyboardRect, to: view.window)
        
        //если клавиатура прячется
        if param.name == UIResponder.keyboardWillHideNotification{
            //если приходит уведомление о закрывающейся клаве, то отменяем смещение(inset)
            myTextView.contentInset = UIEdgeInsets.zero
        }else{ // если клавиатура появляется
            //смещаем редактируемый элемент
            myTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
            //смещаем также и начало индикатора прокрутки
            myTextView.scrollIndicatorInsets = myTextView.contentInset
        }
        //прокручиваем получателя(события?) до тех пор, пока текст в указанном диапазоне не будет виден
        myTextView.scrollRangeToVisible(myTextView.selectedRange)
        
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
