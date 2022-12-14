//
//  EquationCell.swift
//  Calc
//
//  Created by iOSB Free on 26/01/2022.
//
//
//  iOSB Free Ltd                   β All rights reserved
//  Website                         β https://www.iosbfree.com
//
//  ππΎ Free Courses                 β https://www.udemy.com/user/iosbfree
//
//  YouTube                         β https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       β http://www.linkedin.com/in/mattharding-iosbfree
//
//  Tell us what
//  you want to learn
//
//  π iOSB Free
//  community@iosbfree.com
//  π§π»π¨πΏβπΌπ©πΌβπΌπ©π»βπ»π¨πΌβπΌπ§π»ββοΈπ©πΌβπ»ππ½ββοΈπ΅π»ββοΈπ§πΌββοΈπ¦ΉπΌββπ§πΎπ§ββοΈ
// *******************************************************************************************
//
// β What's This File?
//   It's a subclass. This is the cell for each equation displayed in the history log.
//   Architectural Layer: Presentation Layer
//
// *******************************************************************************************


import UIKit

class EquationCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet var lhsLabel: UILabel!    // β π‘ Unwrapping Optionals: If this label is not connected then the app will crash!
    @IBOutlet var rhsLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var tick: UIImageView!
    
    // MARK: - Initialise
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedBackgroundView = UIView()
        tick.alpha = 0
    }
    
    // MARK: - Selected

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: - Animation
    
    func displayTick() {
        bounce(tick)
    }

    private func bounce(_ view: UIView) {
        UIView.animate(withDuration: 0.25,
        animations: { [weak view] in
        view?.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        view?.alpha = 1
        },
        completion: { _ in
            UIView.animate(withDuration: 0.1) { [weak view] in
                view?.transform = CGAffineTransform.identity
            }
        })
    }
}
