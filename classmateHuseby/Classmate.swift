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
    
    init(name: String, age: Int, money: Double) {
        self.name = name
        self.age = age
        self.money = money
    }
    
    func depositMoney(deposit: Double){
        money = money + deposit
        
    }
    
    
}

enum Pets{
    case dog
    case cat
    case frog
    case rock
}
