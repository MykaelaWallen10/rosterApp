//
//  ViewController.swift
//  rosterApp
//
//  Created by MYKAELA WALLEN on 11/14/23.
//

import UIKit

class ClubName{
    static var title = ""
    //hello
    var g = 0
    
    
}

class ViewController: UIViewController {
    let defaults = UserDefaults.standard
    

    
    @IBOutlet weak var clubNameTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let clubThing = defaults.data(forKey: "theClub"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ClubName.title].self, from: clubThing){
                ClubName.title = decoded
            }
        }
    }
    
    
    @IBAction func tooClubAction(_ sender: Any) {
        performSegue(withIdentifier: "toClub", sender: nil)
        
        ClubName.title = clubNameTextField.text!
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(ClubName.title){
            defaults.setClassName(encoded, for: "theClub")
        }
    }
  
    
    
}

