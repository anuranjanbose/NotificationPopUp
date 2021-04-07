//
//  NotificationProtocol.swift
//  NotificationPopUp
//
//  Created by Anuranjan Bose on 06/04/21.
//

import UIKit

protocol NotificationPopup {
    func initialiseBottomConstraint(bottomAnchor: NSLayoutConstraint)
}

extension NotificationPopup where Self: UIViewController {
    
    func setup(notification: UIView, with message: String) {
        let notiLabel = UILabel()
        notiLabel.translatesAutoresizingMaskIntoConstraints = false
        notiLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        notiLabel.textColor = .white
        notiLabel.text = message
        
        view.addSubview(notification)
        notification.backgroundColor = .lightGray
        notification.translatesAutoresizingMaskIntoConstraints = false
        notification.heightAnchor.constraint(equalToConstant: 40).isActive = true
        notification.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        let bottomAnchor = notification.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 40)
        bottomAnchor.isActive = true
        
        self.initialiseBottomConstraint(bottomAnchor: bottomAnchor)
        
        notification.addSubview(notiLabel)
        notiLabel.leftAnchor.constraint(equalTo: notification.leftAnchor, constant: 20).isActive = true
        notiLabel.centerYAnchor.constraint(equalTo: notification.centerYAnchor).isActive = true
    }
}
