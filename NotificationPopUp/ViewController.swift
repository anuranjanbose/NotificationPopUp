//
//  ViewController.swift
//  NotificationPopUp
//
//  Created by Anuranjan Bose on 06/04/21.
//

import UIKit

class ViewController: UIViewController, NotificationPopup {

    let notification = UIView()
    var notificationBottomAnchor: NSLayoutConstraint!
    
    let button = AnimatedButton(title: "Add To Cart")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupButton()
        setup(notification: notification, with: "Added in App")
    }
    
    
    fileprivate func setupButton() {
        view.addSubview(button)
        
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -65).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        
        button.addTarget(self, action: #selector(handleAddToCart), for: .touchUpInside)
    }
    func initialiseBottomConstraint(bottomAnchor: NSLayoutConstraint) {
        self.notificationBottomAnchor = bottomAnchor
    }
    
    @objc fileprivate func handleAddToCart() {
        notificationBottomAnchor.constant = -15
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (complete) in
            if complete {
                self.notificationBottomAnchor.constant = 40
                UIView.animate(withDuration: 0.5, delay: 1.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
}

