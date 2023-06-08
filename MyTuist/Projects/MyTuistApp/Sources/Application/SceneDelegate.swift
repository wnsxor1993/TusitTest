//
//  SceneDelegate.swift
//  MyTuistApp
//
//  Created by Zeto on 2023/06/08.
//  Copyright © 2023 juntaek.OH. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        
        let navigation: UINavigationController = .init()
        let rootVC: TestViewController = .init()
        navigation.viewControllers = [rootVC]
        
        self.window?.rootViewController = navigation
        self.window?.makeKeyAndVisible()
    }
}
