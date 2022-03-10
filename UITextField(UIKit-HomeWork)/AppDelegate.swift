//
//  AppDelegate.swift
//  UITextField(UIKit-HomeWork)
//
//  Created by Эдуард Потоки on 27.11.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

/*
 myTextField2 = UITextField()
 myTextField2.borderStyle = .roundedRect
 myTextField2.placeholder = "Enter your name"
 myTextField2.textContentType = .name
 myTextField2.textColor = .lightGray
 myTextField2.clearButtonMode = .whileEditing
 myTextField2.delegate = self
 myTextField2.translatesAutoresizingMaskIntoConstraints = false
 view.addSubview(myTextField2)
 NSLayoutConstraint.activate([
     myTextField2.widthAnchor.constraint(equalToConstant: 300),
     myTextField2.heightAnchor.constraint(equalToConstant: 31),
     myTextField2.centerXAnchor.constraint(equalTo: welcomeLabel.centerXAnchor),
     myTextField2.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 40)
 ])
 
 
 
 
 //
 */
