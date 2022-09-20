//
//  Model.swift
//  The Recipe List App 4 (iOS)
//
//  Created by Harrison Carroll on 18/09/2022.
//

import Foundation

class Recipe: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var highlights:[String]
    var ingredients:[Ingredient]
    var directions:[String]
    
    
    
}

class Ingredient: Identifiable, Decodable {
    
    var id: UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
    
    
    
    
}
