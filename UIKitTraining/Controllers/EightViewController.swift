//
//  EightViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 07.01.2022.
//

import UIKit

class EightViewController: UIViewController {

    var squareView = UIView()
    var animator = UIDynamicAnimator()
    var pushBehaviour = UIPushBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Eight VC"
        self.view.backgroundColor = .systemIndigo
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        createGestureRecognizer()
        createSmallSquareView()
        createAnimationAndBehaviours()
    }
    
    //создаем квадрат
    func createSmallSquareView() {
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = .green
        squareView.center = view.center
        view.addSubview(squareView)
    }
    
    //создаем жест
    func createGestureRecognizer(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(paramTap:)))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    //создаем столкновение и толчок у view
    func createAnimationAndBehaviours(){
        animator = UIDynamicAnimator(referenceView: view)
        //создаем столкновение
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        pushBehaviour = UIPushBehavior(items: [squareView], mode: .continuous)
        animator.addBehavior(collision)
        animator.addBehavior(pushBehaviour)
    }
    
    @objc func handleTap(paramTap: UITapGestureRecognizer){
        //получаем угол
        let tapPoint: CGPoint = paramTap.location(in: view)
        let squareViewCenterPoint: CGPoint = squareView.center
        
        let deltaX: CGFloat = tapPoint.x - squareViewCenterPoint.x
        let deltaY: CGFloat = tapPoint.y - squareViewCenterPoint.y
        let angel: CGFloat = atan2(deltaY, deltaX)
        pushBehaviour.angle = angel
        
        let distanceBetween: CGFloat = sqrt(pow(tapPoint.x - squareViewCenterPoint.x, 2.0) + pow(tapPoint.y - squareViewCenterPoint.y, 2.0))
        pushBehaviour.magnitude = distanceBetween / 200
    }
    

}
