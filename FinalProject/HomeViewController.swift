//
//  HomeViewController.swift
//  FinalProject_17April
//
//  Created by english on 2024-04-03.
//

import UIKit
import FirebaseAuth // firebase imports
import FirebaseStorage // firebase imports
import FirebaseFirestore // firebase imports

class HomeViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.rowHeight = 300
        return userTitleArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeTableViewCell
        cell.titleText.text = userTitleArray[indexPath.row]
        cell.descText.text = userDescArray[indexPath.row]
        cell.dateText.text = userDateArray[indexPath.row]
        return cell
        
        
    }
    
    var userTitleArray = [String]()
    var userDescArray = [String]()
    var userDateArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getFireStoreFunction()
    }
    
    func getFireStoreFunction(){
        let firestoreDatabase = Firestore.firestore()
        
        firestoreDatabase.collection("todos").addSnapshotListener( {
            ( snapshot, error) in
            if error != nil {
                print(error?.localizedDescription ?? "Something went Wrong.")
            }else{
                if  snapshot?.isEmpty != true && snapshot != nil {
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        print(documentID)
                        
                        if let title =  document.get("title") as? String{
                            self.userTitleArray.append(title)
                        }
                        
                        if let desc = document.get("desc") as? String {
                            self.userDescArray.append(desc)
                        }
                        
                        if let timestamp = document.get("date") as? Timestamp {
                            let date = timestamp.dateValue()
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateStyle = .medium
                            dateFormatter.timeStyle = .medium
                            let stringDate = dateFormatter.string(from: date)
                            
                            self.userDateArray.append(stringDate)
                        }
                        
                        
                    }
                    self.tableView.reloadData()
                }
                
            }
        }
        )
        
    }
    
    
}

