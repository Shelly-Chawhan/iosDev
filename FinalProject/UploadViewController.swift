//
//  UploadViewController.swift
//  FinalProject
//
//  Created by english on 2024-04-03.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import Firebase

class UploadViewController: UIViewController {

    
    
    @IBOutlet weak var titleText: UITextField!
    
    @IBOutlet weak var descText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonUploadPressed(_ sender: UIButton) {
        let firestoreDatabase = Firestore.firestore()
        var firestoreReference: DocumentReference? = nil
        
        if titleText.text != "" && descText.text != ""{
            
            let todo = [
                "title": titleText.text!,
                "desc": descText.text!,
                "date": FieldValue.serverTimestamp()
            ] as [String: Any]
            
            firestoreReference = firestoreDatabase.collection("todos").addDocument(data: todo, completion: {
                                            (error) in
                                            print("Firestore Reference! ")
                                            if error != nil {
                                                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Unable to upload todo.")
                                            }else{
                                          
                                                self.titleText.text = ""
                                                self.descText.text = ""
                                                print("Todo Uploaded Successfully!")
                                                self.tabBarController?.selectedIndex = 0
                                            }
                                        })
            
        }else {
            makeAlert(title: "Missing", message: "Title/Description is missing!")
        }
        
    }
    func makeAlert(title: String, message: String  ){
            let alert = UIAlertController( title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present( alert, animated: true, completion: nil)
        }
    

}
