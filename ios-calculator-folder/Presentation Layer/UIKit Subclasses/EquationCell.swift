//
//  EquationCell.swift
//  Calc
//
//  Created by iOSB Free on 26/01/2022.
//
//
//  iOSB Free Ltd                   → All rights reserved
//  Website                         → https://www.iosbfree.com
//
//  👉🏾 Free Courses                 → https://www.udemy.com/user/iosbfree
//
//  YouTube                         → https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       → http://www.linkedin.com/in/mattharding-iosbfree
//
//  Tell us what
//  you want to learn
//
//  💚 iOSB Free
//  community@iosbfree.com
//  🧕🏻👨🏿‍💼👩🏼‍💼👩🏻‍💻👨🏼‍💼🧛🏻‍♀️👩🏼‍💻💁🏽‍♂️🕵🏻‍♂️🧝🏼‍♀️🦹🏼‍♀🧕🏾🧟‍♂️
// *******************************************************************************************
//
// → What's This File?
//   It's a subclass. This is the cell for each equation displayed in the history log.
//   Architectural Layer: Presentation Layer
//
// *******************************************************************************************


import UIKit

class EquationCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet var lhsLabel: UILabel!    // → 💡 Unwrapping Optionals: If this label is not connected then the app will crash!
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
