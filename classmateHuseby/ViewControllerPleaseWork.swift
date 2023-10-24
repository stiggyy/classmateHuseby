//
//  ViewControllerPleaseWork.swift
//  classmateHuseby
//
//  Created by CATHERINE HUSEBY on 10/17/23.
//
protocol ViewControllerDelegate {
    func addClassmate(_ s1: Classmate)
    func seeClassmates() -> [Classmate]
    func deleteClassmate(_ s1: Int)
}
import UIKit

class ViewControllerPleaseWork: UIViewController, ViewControllerDelegate {
    
    var classmates: [Classmate] = []
    var chuseby = Classmate(name: "Catherine Huseby", age: 17, money: 20.00, pet: Pets.cat)
    var jdoe = Classmate(name: "John Doe", age: 17, money: 24.07, pet: Pets.dog)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        classmates.append(chuseby)
        classmates.append(jdoe)

        // Do any additional setup after loading the view.
    }
    
    func addClassmate(_ s1: Classmate) {
        classmates.append(s1)
    }
    func seeClassmates() -> [Classmate] {
        return classmates
    }
    
    func deleteClassmate(_ s1: Int) {
        classmates.remove(at: s1)
    }
    
    @IBAction func goToMainAction(_ sender: Any) {
        performSegue(withIdentifier: "toMain", sender: self)
        
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ViewController
        nvc.delegate = self
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
