//
//  AppDelegate+ViewSetup.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import Foundation
import UIKit
@objc extension UIResponder {
    func getSceneWindow() -> UIWindow? {
        if #available(iOS 13.0, *) {
            guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return nil }
            return sceneDelegate.window
        } else {
            // Fallback on earlier versions
            return AppDelegate.shared.window
        }
    }
    func showNewsListScreen() {
        let storyboard = UIStoryboard(name: Storyboard.newsList.name, bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController(), let window = getSceneWindow() else { return }
        window.rootViewController = viewController
    }
}
