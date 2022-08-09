//
//  AppDelegate.swift
//  sample
//
//  Created by 小室沙央里 on 2022/07/30.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    internal var window: UIWindow?

    func applicationDidFinishLaunching(_ application: UIApplication) {

        // viewConrollerを生成.
        let myViewController = ViewController()

        // navigationControllerを生成.
        let navigationController = UINavigationController(rootViewController: myViewController)

        // windowを生成.
        window = UIWindow(frame: UIScreen.main.bounds)

        // rootViewControllerにnavigationControllerを設定.
        window?.rootViewController = navigationController

        window?.makeKeyAndVisible()

        //return true
    }

}
