//
//  SceneDelegate.swift
//  testTaskk
//
//  Created by Юрий on 29.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let viewController = MainViewController()
        let networkManager = NetworkManager()
        let viewModel = MainViewModel()
        
        viewController.viewModel = viewModel
        viewModel.networkManager = networkManager
        
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        window.overrideUserInterfaceStyle = .light
        
        self.window = window
    }

}

