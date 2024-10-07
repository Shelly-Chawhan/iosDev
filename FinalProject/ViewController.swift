//
//  ViewController.swift
//  FinalProject
//
//  Created by english on 2024-04-03.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore

class ViewController: UIViewController {

    
    
    @IBOutlet weak var labelLogin: UILabel!
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet var labelEmail: UIView!
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func loginButtonPressed(_ sender: UIButton) {
        print("Login Button Pressed")
        if emailText.text != "" && passwordText.text != ""{
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!){
                ( authData, error) in
                if error != nil {
                    self.makeAlert(title: "Firebase Error", message: error?.localizedDescription ?? "Something went wrong!")
                }else{
                    self.performSegue(withIdentifier: "LoginToTab2", sender: nil) // Move to the Home page.
                }
            }
        }else{
            makeAlert(title: "Error", message: "UserName/Password Missing!") // Custom Function to make an Alert Box.
        }
    }
        func makeAlert(title: String, message: String  ){
                let alert = UIAlertController( title: title, message: message, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present( alert, animated: true, completion: nil)
            }
    }


