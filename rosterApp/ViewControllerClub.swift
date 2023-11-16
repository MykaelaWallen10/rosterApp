//
//  ViewControllerClub.swift
//  rosterApp
//
//  Created by MYKAELA WALLEN on 11/14/23.
//




import UIKit

class ViewControllerClub: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
   var x = 0
    var students = [Students.self]

    @IBOutlet weak var TableOutlet: UITableView!
    
    @IBOutlet weak var addNameTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableOutlet.delegate = self
        TableOutlet.dataSource = self

        
    }
    
    
    @IBAction func addNameAction(_ sender: UIBarButtonItem) {
      
        let name = addNameTextField.text!
        
        if(addNameTextField.text?.isEmpty ?? true){
            
        }
        else{
            var stud = Students(people: addNameTextField.text!)
        }
       
        
        
      
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")!
        return cell
    }


}
