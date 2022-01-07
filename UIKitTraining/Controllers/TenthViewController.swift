//
//  TenthViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 07.01.2022.
//

import UIKit

class TenthViewController: UIViewController {

    var squareView = UIView()
    var animator = UIDynamicAnimator()
    var snapBehaviour: UISnapBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Ten VC"
        self.view.backgroundColor = .link
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        createGestureRecognizer()
        createSmallSquareView()
        createAnimatorAndBehavior()
    }
    
    func createGestureRecognizer(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(paramTap:)))
        view.addGestureRecognizer(tap)
    }
    
    func createSmallSquareView() {
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = .green
        squareView.center = view.center
        view.addSubview(squareView)
    }
    
    func createAnimatorAndBehavior(){
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        //зацеп
        snapBehaviour = UISnapBehavior(item: squareView, snapTo: squareView.center)
        snapBehaviour?.damping = 0.5
        animator.addBehavior(snapBehaviour!)
    }
    
    @objc func handleTap(paramTap: UITapGestureRecognizer){
        //получаем угол
        let tapPoint: CGPoint = paramTap.location(in: view)
        if snapBehaviour != nil {
            animator.removeBehavior(snapBehaviour!)
        }
        snapBehaviour = UISnapBehavior(item: squareView, snapTo: tapPoint)
        snapBehaviour?.damping = 0.5
        animator.addBehavior(snapBehaviour!)
        
    }

    

}
