//
//  ViewController.swift
//  classmateHuseby
//
//  Created by CATHERINE HUSEBY on 10/12/23.

protocol ViewControllerDelegate2 {
    
    func addClassmate(_ s1: Classmate)
   func seeClassmate() -> [Classmate]
    
    func deleteClassmate(_ s1: Int)
    
}
import UIKit

class ViewController: UIViewController, ViewControllerDelegate2, ViewControllerDelegate  {
    func seeClassmates() -> [Classmate] {
        return classmates
    }
    
    
    
    func addClassmate(_ s1: Classmate) {
        delegate.addClassmate(s1)
    }
    
    
  
    
    
   
    
    
    
    
    var delegate: ViewControllerDelegate!
    
    var ci = 0
    @IBOutlet weak var nameDisplayOutlet: UILabel!
    
    @IBOutlet weak var ageDisplayOutlet: UILabel!
    
    @IBOutlet weak var moneyDisplayOutlet: UILabel!
    
    @IBOutlet weak var petDisplayOutlet: UILabel!
    
    @IBOutlet weak var nameOutlet: UITextField!
    
    @IBOutlet weak var moneyOutlet: UITextField!
    
    
    @IBOutlet weak var ageOutlet: UITextField!
    
    
    @IBOutlet weak var petOutlet: UITextField!
    
   // var classmates: [Classmate] = []
   // var chuseby = Classmate(name: "Catherine Huseby", age: 17, money: 20.00, pet: Pets.cat)
   // var jdoe = Classmate(name: "John Doe", age: 17, money: 24.07, pet: Pets.dog)
    
    
    
    

    
    var classmates: [Classmate] = []
    
    
    func deleteClassmate(_ s1: Int) {
        delegate.deleteClassmate(s1)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       // classmates.append(chuseby)
       // classmates.append(jdoe)

        // Do any additional setup after loading the view.
    }
   
    
    func seeClassmate() -> [Classmate] {
        return classmates
    }
    override func viewWillAppear(_ animated: Bool) {
        classmates = delegate.seeClassmates()
        showStudent()
    }
    
    @IBAction func sortAction(_ sender: Any) {
        
    //var sortedClassmates: [Classmate] = []
        //var names: [String] = []
        //var sortedNames: [String]  = []
        classmates = delegate.seeClassmates()
        classmates.sort(by: { $0.name < $1.name })
        
        ci = 0
        showStudent()
        
    }
    
    
    @IBAction func toTableViewAction(_ sender: Any) {
        performSegue(withIdentifier: "toTableView", sender: self)
        
    }
    
    @IBAction func nextStudentAction(_ sender: Any) {
        if ci < classmates.count - 1{
            ci = ci + 1
        } else {
            ci = 0
        }
        showStudent()
    }
    
    
    @IBAction func addStudentAction(_ sender: Any) {
        var name = nameOutlet.text ?? "John Doe"
        var money = moneyOutlet.text!
        var money2 = Double(money) ?? 0.0
        var age = ageOutlet.text!
        var age2 = Int(age) ?? 0
        let pet = (petOutlet.text)?.lowercased()
        var realPets: Pets!
        
        nameOutlet.text = ""
        ageOutlet.text = ""
        moneyOutlet.text = ""
        petOutlet.text = ""
        
        if let x = pet {
            if x == "cat"{
                realPets = Pets.cat
            }
            else if x == "dog" {
                realPets = Pets.dog
            }
            else if x == "frog" {
                realPets = Pets.frog
            }
            else if x == "rock" {
                realPets = Pets.rock
            } else {
                realPets = Pets.rock
            }
        } else {
            realPets = Pets.rock
        }
        
        delegate.addClassmate(Classmate(name: name, age: age2, money: money2, pet: realPets) )
        classmates = delegate.seeClassmates()
        //classmates.append(Classmate(name: name, age: age2, money: money2, pet: realPets))
        
}
    
    
    @IBAction func toQuizAction(_ sender: Any) {
        performSegue(withIdentifier: "toQuiz", sender: self)
    }
    
    
    
    @IBAction func seeAllStudentsAction(_ sender: Any) {
        performSegue(withIdentifier: "toTableView", sender: self)
        
    }
    
    
    func showStudent() {
        
       
        nameDisplayOutlet.text = "Name: \(classmates[ci].name)"
        ageDisplayOutlet.text = "Age: \(String(classmates[ci].age))"
        moneyDisplayOutlet.text = "Money: \(String(classmates[ci].money))"
        petDisplayOutlet.text = "Pet: \(String(classmates[ci].showPet()))"

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ViewControllerTableView
        nvc.delegate = self
    }


}

