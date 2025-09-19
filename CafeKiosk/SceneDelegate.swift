//
//  SceneDelegate.swift
//  CafeKiosk
//
//  Created by 이정은 on 9/16/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let splashVC = LaunchScreenViewController()
        window.rootViewController = splashVC
        window.makeKeyAndVisible()
        
        
        self.window = window
        
        let rootVC = ViewController()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0){
            let navigationController = UINavigationController(rootViewController: rootVC)
            
            self.window?.rootViewController = navigationController
        }
        
        
    }

    
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

