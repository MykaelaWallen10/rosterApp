//
//  ViewControllerClub.swift
//  rosterApp
//
//  Created by MYKAELA WALLEN on 11/14/23.
//




import UIKit

class ViewControllerClub: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet weak var TableOutlet: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableOutlet.delegate = self
        TableOutlet.dataSource = self

        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Students.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")!
        return cell
    }

}
