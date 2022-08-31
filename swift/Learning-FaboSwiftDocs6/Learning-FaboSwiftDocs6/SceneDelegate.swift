//
//  SceneDelegate.swift
//  Learning-FaboSwiftDocs6
//
//  Created by 小室沙央里 on 2022/08/30.
//  ①セクション分けしたUITableViewを作る
//  ②UITextFieldに文字数制限を設ける
//  ③UITextFieldの入力をパスワード形式にする
//  ④UIBarButtonItemの追加
//  ⑤UISearchBarの表示
//  ⑥UIProgressViewで進捗の具合の確認
//  ⑦UINavigationControllerの表示
//  ⑧UIWindowの表示

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        let windowScene = scene as? UIWindowScene
        
        if let windowScene = windowScene {
            window = UIWindow(windowScene: windowScene)
        }
        
        window?.frame = (windowScene?.coordinateSpace.bounds)!
        
        let myViewController = ViewController()
        
        let myNavigationController: UINavigationController = UINavigationController(rootViewController: myViewController)
        
        window?.rootViewController = myNavigationController
        
        window?.makeKeyAndVisible()
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

//
//    let windowScene = scene as? UIWindowScene
//
//        if let windowScene = windowScene {
//          window = UIWindow(windowScene: windowScene)
//        }
//
//        window?.frame = (windowScene?.coordinateSpace.bounds)!
//
//        // ViewControllerを生成
//        let myFirstViewController: FirstViewController = FirstViewController()
//
//        // myFirstViewControllerをrootviewに設定し、Navication Controllerを生成する.
//        let myNavigationController: UINavigationController = UINavigationController(rootViewController: myFirstViewController)
//
//        // rootViewControllerにNavigationControllerを設定
//        window?.rootViewController = myNavigationController
//
//        // NavigationControllerを表示
//        window?.makeKeyAndVisible()
//
//    guard let _ = (scene as? UIWindowScene) else { return }
    
    
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
    }


}

