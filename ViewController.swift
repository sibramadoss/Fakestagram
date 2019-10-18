//
//  ViewController.swift
//  LoginScreen
//
//  Created by Sibhi Ramadoss on 10/11/19.
//  Copyright © 2019 Sibhi Ramadoss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let loginButton = UIButton(type: .system)
    let userNameField = UITextField()
    let passWordField = UITextField()
    let logoView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Hello World")
        print("I'm gonna get an A on all my midterms")
        print("I'm gonna get an A on all my midterms")
        addLogo()
        addUserNameField()
        addpassWordField()
        addLoginButton()
        
    }
    func addLabel() {
        let Label = UILabel()
        Label.text = "Label"
        Label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(Label)

        let xConstraint = Label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let yConstraint = Label.centerYAnchor.constraint(equalTo: view.centerYAnchor)

        xConstraint.isActive = true
        yConstraint.isActive = true
    }
    //Add logo
    
    //Add 2 text fields for username and password
    
    //Add login button
    func addLogo() {
        //Create UIImageView
        
        //Add insta logo to UIImageView
        logoView.image = UIImage(named: "instagram-logo.png")
        
        //Set aspect ratio
        logoView.contentMode = .scaleAspectFit
        
        //Add imageView as subview
        view.addSubview(logoView)
        
        //Set translatesAutoresizing to false
        logoView.translatesAutoresizingMaskIntoConstraints = false
        
        //Add Constraints
        let topConstraint = logoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70)
        let xConstraint = logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let widthConstraint = logoView.widthAnchor.constraint(equalToConstant: 250)
        
        //Activate constraints
        topConstraint.isActive = true
        xConstraint.isActive = true
        widthConstraint.isActive = true
        
    }
    
    func addUserNameField() {
        // create text field
    
        // set properties
        userNameField.placeholder = "Username"
        userNameField.delegate = self
        userNameField.textAlignment = .center
    
        
        view.addSubview(userNameField)
        
        userNameField.translatesAutoresizingMaskIntoConstraints = false
        
        let yConstraint = userNameField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20)
        let leftConstraint = userNameField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        let rightConstraint = userNameField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        
        yConstraint.isActive = true
        leftConstraint.isActive = true
        rightConstraint.isActive = true
    }
    func addpassWordField() {
        // create text field
    
        // set properties
        passWordField.placeholder = "Password"
        passWordField.delegate = self
        passWordField.textAlignment = .center
        passWordField.isSecureTextEntry = true
        
        view.addSubview(passWordField)
        
        passWordField.translatesAutoresizingMaskIntoConstraints = false
        
        let yConstraint = passWordField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20)
        let leftConstraint = passWordField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        let rightConstraint = passWordField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        
        yConstraint.isActive = true
        leftConstraint.isActive = true
        rightConstraint.isActive = true
}
    func addLoginButton() {
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .blue
        
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        let xConstraint = loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let yConstraint = loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100)
        
        xConstraint.isActive = true
        yConstraint.isActive = true

    }

    @objc
    func loginButtonPressed(){
        print("Button Pressed")
        
        if let username = userNameField.text ,
        let password = passWordField.text {
            if(!username.isEmpty && !password.isEmpty){
                print(username)
                
                let usernameViewController =
                 UsernameViewController(username: username)
                
                self.navigationController?.pushViewController(usernameViewController,animated: true)
                
            } else {
                print("Not Entered")
            }
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // dismiss the keyboard
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("user started typing")
    }

}

