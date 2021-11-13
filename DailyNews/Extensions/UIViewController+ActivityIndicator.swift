//
//  UIViewController+ActivityIndicator.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//

import Foundation
import UIKit
private let overlayViewTag = 999
private let activityIndicatorTag = 1000
private let labelTag = 1001
extension UIViewController {
    public func displayActivityIndicator(shouldDisplay: Bool, _ text: String = "") {
        if shouldDisplay {
            setActivityIndicator(text)
        } else {
            removeActivityIndicator()
        }
    }

    private func setActivityIndicator(_ text: String) {
        guard !isDisplayingActivityIndicatorOverlay() else { return }
        guard let parentViewForOverlay = navigationController?.view ?? view else { return }

        // configure overlay
        let overlay = UIView()
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.backgroundColor = UIColor.black
        overlay.alpha = 0.3
        overlay.tag = overlayViewTag

        // configure activity indicator
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.tag = activityIndicatorTag

        // add subviews
        overlay.addSubview(activityIndicator)
        parentViewForOverlay.addSubview(overlay)
        let label = UILabel()
        self.view.addSubview(label)
        label.text = text
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tag = labelTag

        // add overlay constraints
        overlay.heightAnchor.constraint(equalTo: parentViewForOverlay.heightAnchor).isActive = true
        overlay.widthAnchor.constraint(equalTo: parentViewForOverlay.widthAnchor).isActive = true

        // add indicator constraints
        activityIndicator.centerXAnchor.constraint(equalTo: overlay.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: overlay.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        // animate indicator
        activityIndicator.startAnimating()
    }

    private func removeActivityIndicator() {
        let activityIndicator = getActivityIndicator()
        let label = getLabel()
        label?.removeFromSuperview()
        if let overlayView = getOverlayView() {
            UIView.animate(withDuration: 0.2, animations: {
                overlayView.alpha = 0.0
                activityIndicator?.stopAnimating()
            }, completion: {(_ ) in
                activityIndicator?.removeFromSuperview()
                overlayView.removeFromSuperview()
            })
//            UIView.animate(withDuration: 0.2, animations: {
//                overlayView.alpha = 0.0
//                activityIndicator?.stopAnimating()
//            }) { (finished) in
//                activityIndicator?.removeFromSuperview()
//                overlayView.removeFromSuperview()
//            }
        }
    }

    private func isDisplayingActivityIndicatorOverlay() -> Bool {
        if getActivityIndicator() != nil, getOverlayView() != nil {
            return true
        }
        return false
    }

    private func getActivityIndicator() -> UIActivityIndicatorView? {
        return (navigationController?.view.viewWithTag(activityIndicatorTag) ?? view.viewWithTag(activityIndicatorTag)) as? UIActivityIndicatorView
    }

    private func getOverlayView() -> UIView? {
        return navigationController?.view.viewWithTag(overlayViewTag) ?? view.viewWithTag(overlayViewTag)
    }
    private func getLabel() -> UILabel? {
        return navigationController?.view.viewWithTag(labelTag) as? UILabel
    }
}
