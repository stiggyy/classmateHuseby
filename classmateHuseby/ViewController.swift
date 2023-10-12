//
//  ViewController.swift
//  classmateHuseby
//
//  Created by CATHERINE HUSEBY on 10/12/23.
//
protocol ViewControllerDelegate {
    func addClassmate(_ s1: Classmate)
}
import UIKit

class ViewController: UIViewController, ViewControllerDelegate {
    
    var classmates: [Classmate] = []
    
    //var name: String = ""
    
    
    func addClassmate(_ s1: Classmate) {
        classmates.append(s1)
    }
    
    @IBAction func toQuizAction(_ sender: Any) {
        performSegue(withIdentifier: "toQuiz", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ViewControllerQuiz
        nvc.delegate = self
    }


}

