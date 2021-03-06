//
//  SceneDelegate.swift
//  Memo
//
//  Created by 최영재 on 2022/06/02.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        window?.tintColor = .label
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: ListViewController())
    }

}

