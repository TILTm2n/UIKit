//
//  SeventhViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 07.01.2022.
//

import UIKit

class SeventhViewController: UIViewController {
    //UICollisionBehavoir - обнаружение столкновений
    //UIGravityBehaviour - обеспечивает силы тяготения
    //UIPushBehaviour - реагирует на толчки
    //UISpanBehavior - крепит view к определенной точке
    
    var squareView = UIView()
    var animator = UIDynamicAnimator()
    
    var squareViews = [UIDynamicItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Seven VC"
        self.view.backgroundColor = .systemMint
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let numberOfView = 2
        squareViews.reserveCapacity(numberOfView)
        let colors = [UIColor.red, UIColor.green]
        var currentCenterPoint: CGPoint = view.center
        let eachViewSize = CGSize(width: 50, height: 50)
        
        //создаем два кубика
        for counter in 0..<numberOfView {
            let newView = UIView(frame: CGRect(x: 0, y: 0, width: eachViewSize.width, height: eachViewSize.height))
            newView.backgroundColor = colors[counter]
            newView.center = currentCenterPoint
            currentCenterPoint.y += eachViewSize.height + 10
            view.addSubview(newView)
            squareViews.append(newView)
        }
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        //создаем тяготение
        let gravity = UIGravityBehavior(items: squareViews)
        animator.addBehavior(gravity)
        
        //создаем столкновение и добавляем туда кубики
        let collision = UICollisionBehavior(items: squareViews)
        collision.translatesReferenceBoundsIntoBoundary = true
        
        //настраиваем грвницу падения
        collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying,
                              from: CGPoint(x: 0, y: self.view.bounds.size.height - 300),
                              to: CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height))
        collision.collisionDelegate = self
        animator.addBehavior(collision)
        
    }
    
    ////создание квадрата под силами тяготения
    fileprivate func createGravityableSquare() {
        squareView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        squareView.center = view.center
        squareView.backgroundColor = .green
        view.addSubview(squareView)
        
        //создаем аниматор и тяготение
        //анимируем представление
        animator = UIDynamicAnimator(referenceView: squareView)
        //вешаем на представление силу тяжести
        let gravity = UIGravityBehavior(items: [squareView])
        //добавляем эту силу в аниматрор
        animator.addBehavior(gravity)
    }
}

extension SeventhViewController: UICollisionBehaviorDelegate {
    
    //задаем поведение после столкновения через мтеод делегата
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        let identifier = identifier as? String
        let bottomBoundary = "bottomBoundary"
        if identifier == bottomBoundary{
            UIView.animate(withDuration: 1.0) {
                let view = item as? UIView
                view?.backgroundColor = UIColor.red
                view?.alpha = 0.0
                view?.transform = CGAffineTransform(scaleX: 2, y: 2)
            } completion: { (finished) in
                let view = item as? UIView
                behavior.removeItem(item)
                view?.removeFromSuperview()
            }
        }
    }
}
