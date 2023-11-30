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
    var tf = true
    
    
    @IBOutlet weak var TableOutlet: UITableView!
    
    @IBOutlet weak var addNameTextField: UITextField!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableOutlet.delegate = self
        TableOutlet.dataSource = self
        
        
        titleLabel.text = AppData.title
        
       
        
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
    
    
    
    @IBAction func reloadTable(_ sender: UIBarButtonItem) {
        if AppData.tableThing == 2 {
            students = []
            //print(students)
           
        }
        
        //add the encoder and move reload
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(students){
               defaults.set(encoded, forKey: "theStudents2")
              
        }
        
        TableOutlet.reloadData()
    }
    
    
    
    
    
    @IBAction func addNameAction(_ sender: UIBarButtonItem) {
        
        
        let name = addNameTextField.text!
        
        
        
      
        for i in students{

                    if(name.lowercased() == i.people.lowercased()){

                        tf = false

                        let alert = UIAlertController(title: "Duplicate!", message: "This student is already on the list", preferredStyle: .alert)

                        

                        //2 create actions

                        let okAction = UIAlertAction(title: "OK!", style: .default){(ACTION)

                            in

                            

                            self.tf = false

                        }

                        

                        let sortAgain = UIAlertAction(title: "Add anyway!", style: .default){(ACTION) in

                            if(self.addNameTextField.text?.isEmpty ?? true){

                                

                            }

                            else{

                                

                                let stud = Students(people: name)

                                self.students.append(stud)

                                self.TableOutlet.reloadData()

                                

                                let encoder = JSONEncoder()

                                if let encoded = try? encoder.encode(self.students){

                                    self.defaults.set(encoded, forKey: "theStudents")

                                    self.addNameTextField.text = ""

                                }

                            }

                            

                        }

                        alert.addAction(okAction)

                        alert.addAction(sortAgain)

                        

                        present(alert, animated: true)

                    }

                    

                    

                }

                

                if(tf == true){

                    if(addNameTextField.text?.isEmpty ?? true){

                    }

                    else{

                        let stud = Students(people: name)

                        students.append(stud)

                        TableOutlet.reloadData()

                    }

                }
                
                
//               
//                let stud = Students(people: name)
//              students.append(stud)
//             TableOutlet.reloadData()
//             
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(students){
                   defaults.set(encoded, forKey: "theStudents2")
                  
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
    



