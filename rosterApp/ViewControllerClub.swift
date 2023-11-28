//
//  ViewControllerClub.swift
//  rosterApp
//
//  Created by MYKAELA WALLEN on 11/14/23.
//




import UIKit

class ViewControllerClub: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let defaults = UserDefaults.standard
    //testing comment
    
    var x = 0
    var students = [Students]()
    
    
    
    @IBOutlet weak var TableOutlet: UITableView!
    
    @IBOutlet weak var addNameTextField: UITextField!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableOutlet.delegate = self
        TableOutlet.dataSource = self
        
        
        titleLabel.text = AppData.title
     
        if ViewController.tableThing == 2 {
           // TableOutlet.
            print(students)
            TableOutlet.reloadData()
        }
        
        
        if let items = defaults.data(forKey: "theStudents2"){
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
        
        let student = students[indexPath.row]
        cell.textLabel?.text = student.people
        cell.detailTextLabel?.text = "\(0)"
        
        return cell
        
        
    }
    
    
    
    
    @IBAction func addNameAction(_ sender: UIBarButtonItem) {
    
        
         let name = addNameTextField.text!
        
        
        
        if(addNameTextField.text?.isEmpty ?? true){
            
        }
        else{
            
            let stud = Students(people: name)
            students.append(stud)
            TableOutlet.reloadData()
            
            
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(students){
                defaults.set(encoded, forKey: "theStudents2")
                
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            students.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(students){
                defaults.set(encoded, forKey: "theStudents2")
            }
        
            
        }
    }
    
 
    
    
    
    
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
     
        
  if let cell = tableView.cellForRow(at: indexPath) {
        

      var tempValue = Int(cell.detailTextLabel!.text!) ?? 0
        tempValue += 1
      cell.detailTextLabel?.text = "\(tempValue)"
       
     

   }
    
        
        
    }
}

