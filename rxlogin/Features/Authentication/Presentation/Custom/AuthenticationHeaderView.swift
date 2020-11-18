//
//  AuthenticationHeaderView.swift
//  rxlogin
//
//  Created by Jonatas Brisotti on 17/11/20.
//  Copyright © 2020 Jonatas Brisotti. All rights reserved.
//

import UIKit

public protocol AuthenticationHeaderViewDelegate: class {
    func handlerTap()
}

class AuthenticationHeaderView: UIView {
    
    private var delegate: AuthenticationHeaderViewDelegate?
    private var logoImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public var usernameTextField: UITextField = {
        let view = UITextField(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public var passwordTextField: UITextField = {
        let view = UITextField(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public var doneButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}

extension AuthenticationHeaderView {
    public func setup(_ delegate: AuthenticationHeaderViewDelegate) {
        addLogoContraints()
        addUserContraints()
        addPassContraints()
        addButtonContraints()
        
        self.delegate = delegate
        self.backgroundColor = .white
    }
}

extension AuthenticationHeaderView {
    private func addLogoContraints() {
        addSubview(logoImageView)
        logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 40.0).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 130.0).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = UIImage(named: "logo")
    }
}

extension AuthenticationHeaderView {
    private func addUserContraints() {
        addSubview(usernameTextField)
        usernameTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        usernameTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0.0).isActive = true
        usernameTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -60.0).isActive = true
        
        usernameTextField.placeholder = "Username"
        usernameTextField.keyboardType = .alphabet
        usernameTextField.returnKeyType = .done
        usernameTextField.keyboardAppearance = .dark
    }
}

extension AuthenticationHeaderView {
    private func addPassContraints() {
        addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: self.usernameTextField.bottomAnchor, constant: 40.0).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0.0).isActive = true
        
        passwordTextField.placeholder = "Password"
        passwordTextField.keyboardType = .alphabet
        passwordTextField.isSecureTextEntry = true
        passwordTextField.returnKeyType = .done
        passwordTextField.keyboardAppearance = .dark
    }
}

extension AuthenticationHeaderView {
    private func addButtonContraints() {
        addSubview(doneButton)
        doneButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 30.0).isActive = true
        doneButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        doneButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0.0).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        doneButton.backgroundColor = .orange
        doneButton.setTitleColor(.white, for: .normal)
        doneButton.setTitle("Login", for: .normal)
        doneButton.isEnabled = true
        doneButton.layer.cornerRadius = 10.0
        doneButton.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }
}

extension AuthenticationHeaderView {
    @objc func touchUpInside() {
        self.delegate?.handlerTap()
    }
}

extension UIButton {
    open override var isEnabled: Bool{
        didSet { alpha = isEnabled ? 1.0 : 0.6 }
    }

}
