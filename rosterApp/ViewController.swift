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
    let defaultsClub = UserDefaults.standard
    
    var name = String(ClubName.title)
    
   static var clubName = ""
    
    @IBOutlet weak var clubNameTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      //  ViewController.clubName = defaultsClub.string(forKey: "theClub") ?? ""
       
        
        if let clubThing = defaultsClub.data(forKey: "theClub"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([name].self, from: clubThing){
                name = decoded
         }
        }
    }
    
    
    @IBAction func tooClubAction(_ sender: Any) {
        performSegue(withIdentifier: "toClub", sender: nil)
        
        ClubName.title = clubNameTextField.text!
        
        //defaultsClub.set(name, forKey: "theClub")
  
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(name){
            defaultsClub.set(encoded, forKey: "theClub")
        }
    }
  
    
    
}

