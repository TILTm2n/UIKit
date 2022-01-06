//
//  MyPageViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 06.01.2022.
//

import UIKit

class MyPageViewController: UIPageViewController {

    var cars = [CarsHelper]()
    let bmw = UIImage(named: "BMW")
    let audi = UIImage(named: "AUDI")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Cars"
        self.navigationController?.navigationBar.backgroundColor = .systemTeal
        view.backgroundColor = .systemCyan
        
        
        let firstCar = CarsHelper(name: "BMW", image: bmw!)
        let secondCar = CarsHelper(name: "AUDI", image: audi!)
        cars.append(firstCar)
        cars.append(secondCar)
        
    }
    
    // MARK: - create VC
    lazy var arrayCarViewController: [CarViewController] = {
        var carsVC = [CarViewController]()
        for car in cars {
            carsVC.append(CarViewController(carWith: car))
        }
        return carsVC
    }()
    
    // MARK: - init UIPageViewController
    override init(transitionStyle style: UIPageViewController.TransitionStyle,
                  navigationOrientation: UIPageViewController.NavigationOrientation,
                  options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .pageCurl, navigationOrientation: navigationOrientation, options: nil)
        self.view.backgroundColor = UIColor.green
        self.dataSource = self
        self.delegate = self
        setViewControllers([arrayCarViewController[0]], direction: .forward, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MyPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else { return nil }
        if let index = arrayCarViewController.firstIndex(of: viewController){
            if index > 0 {
                return arrayCarViewController[index - 1]
            }
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else { return nil }
        if let index = arrayCarViewController.firstIndex(of: viewController){
            if index < cars.count - 1 {
                return arrayCarViewController[index + 1]
            }
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int{
        return cars.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int{
        return 0
    }
    
    
}
