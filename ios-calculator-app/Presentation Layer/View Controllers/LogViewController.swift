//
//  LogViewController.swift
//  Calc
//
//  Created by iOSB Free on 26/01/2022.
//
//
//  iOSB Free Ltd                   → All rights reserved
//  Website                         → https://www.iosbfree.com
//
//  👉🏽 Free Courses                 → https://www.udemy.com/user/iosbfree
//
//  YouTube                         → https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       → http://www.linkedin.com/in/mattharding-iosbfree
//
//  Tell us what
//  you want to learn
//
//  🧡 iOSB Free
//  community@iosbfree.com
//  🧕🏻👨🏿‍💼👩🏼‍💼👩🏻‍💻👨🏼‍💼🧛🏻‍♀️👩🏼‍💻💁🏽‍♂️🕵🏻‍♂️🧝🏼‍♀️🦹🏼‍♀🧕🏾🧟‍♂️
// *******************************************************************************************
//
// → What's This File?
//   It's a screen. It displays a list of all of the executed equations
//   Architectural Layer: Presentation Layer
//
//   💡 Architecture Tip 👉🏻 The UI layer should ideally only contain UI. Put all other code
//   into other files creating types such as managers and data storage.
// *******************************************************************************************


import UIKit

class LogViewController: UITableViewController {
    
    //MARK: - Datasource
    
    var datasource: [MathEquation] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        decorateViewWithTheme(ThemeManager.shared.currentTheme)
    }

    
    //MARK: - Navigation Bar
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneButtonPressed))
    }

    @objc private func doneButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - TableView

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MathEquationTableViewCell", for: indexPath) as? EquationCell else {
            return UITableViewCell()
        }
        
        let theme = ThemeManager.shared.currentTheme
        decorateTableViewCell(cell, withTheme: theme, from: indexPath)
        
        guard let mathEquation = datasource[safe: indexPath.row] else {
            return UITableViewCell()
        }
        
        populateTableViewCellFromEquation(mathEquation, cell: cell)
        return cell
    }
    
    private func populateTableViewCellFromEquation(_ mathEquation: MathEquation, cell: EquationCell) {
        cell.lhsLabel.text = mathEquation.lhs.formatted()
        cell.rhsLabel.text = mathEquation.generateStringRepresentationOfOperator() + " " + (mathEquation.rhs?.formatted() ?? "")
        cell.resultLabel.text = "= " + (mathEquation.result?.formatted() ?? "")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            let cell = tableView.cellForRow(at: indexPath) as? EquationCell,
            let mathEquation = datasource[safe: indexPath.row]
        else { return }
        
        let userInfo: [AnyHashable: Any] = [LCDDisplay.keys.userInfo: mathEquation]
        NotificationCenter.default.post(name: Notification.Name(LCDDisplay.keys.pasteEquationNotification), object: nil, userInfo: userInfo)
        
        view.isUserInteractionEnabled = false
        cell.displayTick()
        dismissAfterDelay()
    }
    
    private func dismissAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
    }
    
    //MARK: - Decorate
    
    private func decorateViewWithTheme(_ theme: CalculatorTheme) {
        tableView.backgroundColor = UIColor(hex: theme.background)
        tableView.separatorColor = UIColor(hex: theme.display)
        tableView.tintColor = UIColor(hex: theme.display)
        switch theme.statusBarStyle {
        case .light:
            tableView.indicatorStyle = .white
        case .dark:
            tableView.indicatorStyle = .black
        }
    }
    
    private func decorateTableViewCell(_ cell: EquationCell, withTheme theme: CalculatorTheme, from indexPath: IndexPath) {
        cell.backgroundColor = UIColor(hex: theme.background)
        cell.selectedBackgroundView?.backgroundColor = UIColor(hex: theme.operatorNormal )
        cell.lhsLabel.textColor = UIColor(hex: theme.display)
        cell.lhsLabel.highlightedTextColor = UIColor(hex: theme.background)
        cell.rhsLabel.textColor = UIColor(hex: theme.display)
        cell.rhsLabel.highlightedTextColor = UIColor(hex: theme.background)
        cell.resultLabel.textColor = UIColor(hex: theme.display)
        cell.resultLabel.highlightedTextColor = UIColor(hex: theme.background)
        
        cell.tick.tintColor = UIColor(hex: theme.operatorTitle)
    }
}
