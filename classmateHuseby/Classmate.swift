//
//  Classmate.swift
//  classmateHuseby
//
//  Created by CATHERINE HUSEBY on 10/12/23.
//

import Foundation
public class Classmate{
    
    var name: String
    var age: Int
    var money: Double
    var pet: Pets
    
    init(name: String, age: Int, money: Double, pet: Pets) {
        self.name = name
        self.age = age
        self.money = money
        self.pet = pet
    }
    
    func depositMoney(deposit: Double){
        money = money + deposit
        
    }
    
    func showPet() -> String {
        if pet == Pets.dog {
            return "dog"
        } else if pet == Pets.cat {
            return "cat"
        } else if pet == Pets.frog {
            return "frog"
        } else if pet == Pets.rock {
            return "rock"
        } else {
            return "none"
        }
    }
    
    
}

enum Pets{
    case dog
    case cat
    case frog
    case rock
}
