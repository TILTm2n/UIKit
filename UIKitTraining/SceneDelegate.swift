//
//  SceneDelegate.swift
//  UIKitTraining
//
//  Created by Eugene on 03.01.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let firstVC = ViewController()
        let secondVC = SecondViewController()
        let thirdVC = ThirdViewController()
        
        let firstNavController = UINavigationController(rootViewController: firstVC)
        firstNavController.navigationBar.backgroundColor = .yellow
        
        let secondNavController = UINavigationController(rootViewController: secondVC)
        secondNavController.navigationBar.backgroundColor = .green
        
        let thirdNavController = UINavigationController(rootViewController: thirdVC)
        thirdNavController.navigationBar.backgroundColor = .orange
        
        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers([firstNavController, secondNavController, thirdNavController], animated: true)
        tabBarVC.tabBar.backgroundColor = .white
        
        guard let winScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: winScene)
        self.window?.rootViewController = tabBarVC
        self.window?.makeKeyAndVisible()
        
//        //наш дефолтный контроллер представления
//        let viewController = ViewController()
//        //создаем экземпляр контроллера навигации с корневым нашим контроллером в корне стэка контроллеров
//        self.navController = UINavigationController(rootViewController: viewController)
//        //цвет для панели навигации
//        self.navController.navigationBar.backgroundColor = .green
//        //создаем объект UIWindowScene, который будет управлять окнами, отображаемыми в этой сцене
//        if let ws = scene as? UIWindowScene{
//            //создаем окно UIWindow
//            self.window = UIWindow(windowScene: ws)
//            //делаем контроллер навигации для этого окна корневым
//            self.window?.rootViewController = self.navController
//            self.window?.backgroundColor = UIColor.white // результат этой операции совпадает с результатом применения цвета фона для главного view
//            self.window?.makeKeyAndVisible()
//        }
        
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

