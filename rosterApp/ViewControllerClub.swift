//
//  ViewControllerClub.swift
//  rosterApp
//
//  Created by MYKAELA WALLEN on 11/14/23.
//




import UIKit

class ViewControllerClub: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let defaults = UserDefaults.standard
    
   var x = 0
    
    var students = [Students]()
    
  

    @IBOutlet weak var TableOutlet: UITableView!
    
    @IBOutlet weak var addNameTextField: UITextField!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableOutlet.delegate = self
        TableOutlet.dataSource = self
       

        titleLabel.text = ClubName.title
        
        if let items = defaults.data(forKey: "theStudents"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Students].self, from: items){
                students = decoded
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")!
        cell.textLabel?.text = String(students[indexPath.row].people)
        return cell
        
        
    }
    

       
    
    @IBAction func addNameAction(_ sender: UIBarButtonItem) {
       // defaults.setValue("")
        let name = addNameTextField.text!
        
        if(addNameTextField.text?.isEmpty ?? true){
            
       }
        else{
    
            let stud = Students(people: name)
           students.append(stud)
           TableOutlet.reloadData()
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(students){
                defaults.set(encoded, forKey: "theStudents")
            }
        }
    
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            students.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //clicking kid
 //   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
   //     if let fake = tableView.cellForRow(at: indexPath)?.textLabel?.text{
   //         students[indexPath.row].people = "\(students[indexPath.row].people) \(x)"
    //        TableOutlet.reloadData()
            
          
            
     //   }
   // }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Assuming 'x' is a variable that stores the initial value to be displayed in each cell
        var x = 0
        
        if let cell = tableView.cellForRow(at: indexPath) {
            // Extract the current value from the cell's text label
            if let currentValue = cell.textLabel?.text, let currentNumber = Int(currentValue) {
                // Increment the current value by 1
                x = currentNumber + 1
            }
        }
        
        // Update the data source with the new value
        students[indexPath.row].people = "\(x)"
        
        // Reload the table view to reflect the changes
        tableView.reloadData()
    }



}
