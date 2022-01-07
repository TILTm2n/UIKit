//
//  NinethViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 07.01.2022.
//

import UIKit

class NinethViewController: UIViewController {

    var squareView = UIView()
    var squareViewAnchorView = UIView()
    var anchorView = UIView()
    var animator = UIDynamicAnimator()
    var attachmentBehaviour: UIAttachmentBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Nine VC"
        self.view.backgroundColor = .systemMint
        self.tabBarController?.tabBar.isHidden = true
        
        createGestureRecognizer()
        createSmallSquareView()
        createAnchorView()
        createAnimationAndBehaviors()
        
    }
    
    //создаем квадрат в квадрате
    func createSmallSquareView() {
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = .green
        squareView.center = view.center
        squareViewAnchorView = UIView(frame: CGRect(x: 60, y: 0, width: 20, height: 20))
        squareViewAnchorView.backgroundColor = .brown
        squareView.addSubview(squareViewAnchorView)
        view.addSubview(squareView)
    }
    
    //view с точкой привязки
    func createAnchorView(){
        anchorView = UIView(frame: CGRect(x: 120, y: 120, width: 20, height: 20))
        anchorView.backgroundColor = .red
        view.addSubview(anchorView)
    }
    
    //создаем регистратор жеста панорамирования
    func createGestureRecognizer(){
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(paramPan:)))
        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    //создание столкновения и прикрепления
    func createAnimationAndBehaviors(){
        animator = UIDynamicAnimator(referenceView: view)
        //солкновения
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        attachmentBehaviour = UIAttachmentBehavior(item: squareView, attachedToAnchor: anchorView.center)
        animator.addBehavior(collision)
        animator.addBehavior(attachmentBehaviour!)
    }
    
    @objc func handlePan(paramPan: UIPanGestureRecognizer){
        //получаем место касания
        let tapPoint = paramPan.location(in: view)
        //привязка привязвнного к якорю объекта к месту касания мышкой (без него якорь не перемещается, перемещает вслед за якорем)
        attachmentBehaviour?.anchorPoint = tapPoint
        //перемещает объект якоря(по сути что угодно что должно казаться якорем) вслед за пальцем
        anchorView.center = tapPoint
    }

}
