//
//  LoginController.swift
//  GoTChat
//
//  Created by Superdigital on 11/03/19.
//  Copyright © 2019 Superdigital. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    //    MARK: Buttons
    @IBOutlet weak var btLogin: UIButton!
    @IBOutlet weak var btRegister: UIButton!
    @IBOutlet weak var btConfirmSelection: UIButton!
    //    MARK: Text Fields
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfUserEmail: UITextField!
    @IBOutlet weak var tfUserPassword: UITextField!

    var delegate = LoginControllerDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLoginConfirmation()
    }
    
    @IBAction func touchSelectionButton(_ sender: UIButton) {
        btConfirmSelection.setTitle(sender.currentTitle, for: .normal)
        switch sender.currentTitle {
        case "Login":
            btRegister.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.3568627451, blue: 0.5921568627, alpha: 1)
            btRegister.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            setLoginConfirmation()
        default:
            btLogin.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.3568627451, blue: 0.5921568627, alpha: 1)
            btLogin.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            setRegisterConfirmation()
        }
        sender.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        sender.setTitleColor(#colorLiteral(red: 0.2392156863, green: 0.3568627451, blue: 0.5921568627, alpha: 1), for: .normal)
    }
    
    @objc func touchConfirmationButtonForLogin() {
        let user = User(name: tfUserName.text ?? "", email: tfUserEmail.text ?? "", password: tfUserPassword.text ?? "")
        delegate.performLogin(withUser: user)
    }
    @objc func touchConfirmationButtonForRegistration() {
        let user = User(name: tfUserName.text ?? "", email: tfUserEmail.text ?? "", password: tfUserPassword.text ?? "")
        delegate.performRegistration(forUser: user)
    }
    
    private func setLoginConfirmation() {
        btConfirmSelection.removeTarget(self, action: #selector(touchConfirmationButtonForRegistration), for: .touchUpInside)
        btConfirmSelection.addTarget(self, action: #selector(touchConfirmationButtonForLogin), for: .touchUpInside)
    }
    
    private func setRegisterConfirmation() {
        btConfirmSelection.removeTarget(self, action: #selector(touchConfirmationButtonForLogin), for: .touchUpInside)
        btConfirmSelection.addTarget(self, action: #selector(touchConfirmationButtonForRegistration), for: .touchUpInside)
    }
}
