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
    

    
    @IBOutlet weak var clubNameTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tooClubAction(_ sender: Any) {
        performSegue(withIdentifier: "toClub", sender: nil)
        
        ClubName.title = clubNameTextField.text!
    }
  
    
    
}

