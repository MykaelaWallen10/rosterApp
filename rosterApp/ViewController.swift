//
//  ViewController.swift
//  rosterApp
//
//  Created by MYKAELA WALLEN on 11/14/23.
//

import UIKit

class AppData {
    static var title = ""
   static var tableThing = 0
   
    
    
}

class ViewController: UIViewController {
    let defaultsClub = UserDefaults.standard
    
    var name = AppData.title
    
 
  
    
    @IBOutlet weak var clubNameTextField: UITextField!
    
    @IBOutlet weak var currentClub: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
         
        AppData.title = defaultsClub.string(forKey: "theClub3") ?? ""
        
        currentClub.text = AppData.title
       
      
        
    }
    
    
    @IBAction func tooClubAction(_ sender: Any) {
        
        performSegue(withIdentifier: "toClub", sender: nil)
        
        
         
        AppData.tableThing = 2
       
        
        AppData.title = clubNameTextField.text!
        
        
        defaultsClub.set(AppData.title, forKey: "theClub3")
  
        currentClub.text = AppData.title
        
        
      
    }
  
    @IBAction func currentClub(_ sender: Any) {
        performSegue(withIdentifier: "toClub", sender: nil)
        
        AppData.tableThing = 0
        
        AppData.title = defaultsClub.string(forKey: "theClub3") ?? ""
    }
    
    
}

