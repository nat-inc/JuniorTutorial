//
//  SceneDelegate.swift
//  Learning-FaboSwiftDocs4
//
//  Created by 小室沙央里 on 2022/08/24.
// ①UITabBarControllerでタブの表示(First)
// ②UIImageViewで画像を表示
// ③UIScrollViewの表示(Second)
// ④UITextViewで複数行のテキストの表示(First)

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // ①
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
        
        // Tabに設定するViewControllerのインスタンスを生成
        let myFirstTab: UIViewController = FirstViewController()
        let mySecondTab: UIViewController = SecondViewController()
        let myThirdTab: UIViewController = ThirdViewController()
        
        // タブを要素に持つArrayを作成する
        let myTabs = NSArray(objects: myFirstTab, mySecondTab, myThirdTab)
        
        // UITabContollerを設定する
        let myTabBarController: UITabBarController = UITabBarController()
        
        // ViewControllerを設定する
        myTabBarController.setViewControllers(myTabs as? [UIViewController], animated: false)
        
        // RootViewControllerに設定する
        window?.rootViewController = myTabBarController
        
        // Windowを表示する
        window?.makeKeyAndVisible()
        
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
    }


}

