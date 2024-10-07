//
//  RegisterViewController.swift
//  FinalProject
//
//  Created by english on 2024-04-03.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var labelRegister: UILabel!
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text! ){
                ( authData, error) in
                if error != nil {
                    self.makeAlert(title: "Firebase Error", message: error?.localizedDescription ?? "Something went wrong!")
                }else {
                    self.tabBarController?.selectedIndex = 0
                    //
                }
            }
        }else{
            makeAlert(title: "Error", message: "Email/Password is missing!") //  custom Alert Function.
        }
        tabBarController?.selectedIndex = 0
        
    }
    func makeAlert(title: String, message: String  ){
        let alert = UIAlertController( title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present( alert, animated: true, completion: nil)
    }
    
}
