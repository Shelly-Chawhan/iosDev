//
//  SettingViewController.swift
//  FinalProject
//
//  Created by english on 2024-04-03.
//

import UIKit
import Firebase

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    
    @IBAction func buttonLogoutPressed(_ sender: UIButton) {
        
        do{
                    try Auth.auth().signOut()
                }catch {
                    print("error")
                    self.performSegue(withIdentifier: "FromSettingToTab1", sender: nil)
                }
        performSegue(withIdentifier: "FromSettingToTab1", sender: nil)
    }
    
}

