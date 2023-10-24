//
//  ViewControllerTableView.swift
//  classmateHuseby
//
//  Created by CATHERINE HUSEBY on 10/20/23.
//

import UIKit

class ViewControllerTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    var delegate: ViewControllerDelegate2!
    var classmates: [Classmate] = []
   // var classmates = delegate.seeClassmate()
    
    //  @IBOutlet weak var crazyCellOutlet: CrazyCell!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tableViewOutlet.delegate = self
        self.tableViewOutlet.dataSource = self
        classmates = delegate.seeClassmate()
        
        tableViewOutlet.reloadData()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classmates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier: "myCell") as! CrazyCell
        
        cell.ageOutlet.text = String(classmates[indexPath.row].age)
        
        cell.nameOutlet.text = classmates[indexPath.row].name
        cell.moneyOutlet.text = String(classmates[indexPath.row].money)
        
        cell.petOutlet.text = String(classmates[indexPath.row].showPet())
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}