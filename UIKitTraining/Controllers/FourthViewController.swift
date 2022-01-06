//
//  FourthViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 06.01.2022.
//

import UIKit

class FourthViewController: UIViewController, UIScrollViewDelegate {

    var myScrollView = UIScrollView()
    var myImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Fourth VC"
        self.view.backgroundColor = .cyan
        
        let sunriseImage = UIImage(named: "sunrise")
        let canadaImage = UIImage(named: "canada")
        let portretImage = UIImage(named: "portret")
        
        let scrollViewRect = self.view.bounds
        
        //создаем скролл
        myScrollView = UIScrollView(frame: scrollViewRect)
        
        //для разбивки на страницы
        myScrollView.isPagingEnabled = true
        
        myScrollView.contentSize = CGSize(width: scrollViewRect.size.width*3, height: scrollViewRect.size.height)
        self.view.addSubview(myScrollView)
        
        //первая картинка
        var imageViewRect = self.view.bounds
        let sunriseImageView = self.newImageViewWithImage(paramImage: sunriseImage!, paramFrame: imageViewRect)
        myScrollView.addSubview(sunriseImageView)
        
        //следующая страница
        imageViewRect.origin.x += imageViewRect.size.width
        let canadaImageView = self.newImageViewWithImage(paramImage: canadaImage!, paramFrame: imageViewRect)
        myScrollView.addSubview(canadaImageView)
        
        //следующая страница
        imageViewRect.origin.x += imageViewRect.size.width
        let portretImageView = self.newImageViewWithImage(paramImage: portretImage!, paramFrame: imageViewRect)
        myScrollView.addSubview(portretImageView)
        
    }
    
    func newImageViewWithImage(paramImage: UIImage, paramFrame: CGRect) -> UIImageView {
        let result = UIImageView(frame: paramFrame)
        result.contentMode = .scaleAspectFit
        result.image = paramImage
        return result
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("прокрутка начинается")
        print(scrollView.contentOffset.y)
        //self.myScrollView.alpha = 0.50
    }
    //метод при замедлении прокрутки
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("вызывается после прокрутки")
        self.myScrollView.alpha = 1.0
    }
    //метод при пертаскивании
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("гарантирует что вернет альфу к 1")
        self.myScrollView.alpha = 1.0
    }
    
    
    fileprivate func createScrollView() {
        let imageToLoad = UIImage(named: "sunrise")
        myImageView = UIImageView(image: imageToLoad)
        //задаем размер для ScrollView
        myScrollView = UIScrollView(frame: self.view.bounds)
        //добавляем myImageView в ScrollView
        myScrollView.addSubview(myImageView)
        //задаем размер содержимого у ScrollView
        myScrollView.contentSize = self.myImageView.bounds.size
        self.view.addSubview(myScrollView)
        
        myScrollView.delegate = self
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
