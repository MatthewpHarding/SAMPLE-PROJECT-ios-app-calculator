//
//  UIButton+Animation.swift
//  Calc
//
//  Created by iOSB Free on 25/01/2022.
//
//
//  iOSB Free Ltd                   β All rights reserved
//  Website                         β https://www.iosbfree.com
//
//  π Free Courses                 β https://www.udemy.com/user/iosbfree
//
//  YouTube                         β https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       β http://www.linkedin.com/in/mattharding-iosbfree
//
//  Tell us what
//  you want to learn
//
//  π iOSB Free
//  community@iosbfree.com
//  π§π»π¨πΏβπΌπ©πΌβπΌπ©π»βπ»π¨πΌβπΌπ§π»ββοΈπ©πΌβπ»ππ½ββοΈπ΅π»ββοΈπ§πΌββοΈπ¦ΉπΌββπ§πΎπ§ββοΈ
// *******************************************************************************************
//
// β What's This File?
//   It's an extension. It adds more features to UIButton, such as animation.
//   Architectural Layer: Presentation Layer
//
//   π‘ Tip ππ» Animations provide personality. They emotionally connect the product to the
//   audience and give the app a certain feel. Adding animations is a great idea.
// *******************************************************************************************


import UIKit

extension UIButton {
    
    func bounce() {
        
        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseOut, .allowUserInteraction]) { [weak self] in
            self?.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self?.alpha = 1
        } completion: { [weak self] _ in
            UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseInOut, .allowUserInteraction], animations: { [weak self] in
                self?.transform = CGAffineTransform.identity
            }, completion: nil)
        }
    }
}
