//
//  SceneDelegate.swift
//  MyToDoList-2
//
//  Created by t2023-m0045 on 2023/09/13.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: MainVC())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

