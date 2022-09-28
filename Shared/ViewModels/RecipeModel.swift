//
//  RecipeModel.swift
//  The Recipe List App 4 (iOS)
//
//  Created by Harrison Carroll on 18/09/2022.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
   
    init() {
        
        
        //Create an instance of dataservice and get the data
        self.recipes = dataService().getLocalData()
        
    }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
    
    
    var portion = ""
    var numerator = ingredient.num ?? 1
    var denominator = ingredient.denom ?? 1
    var wholePortions = 0
    
        if ingredient.num != nil {
            
            //Get a single size by mutliplying denominator by the recipe servings
            
            denominator *= recipeServings
            
            //Get target portion by multiplying numinerator by target servings
            
            numerator *= targetServings
            
            
            //Reduce the fraction by the greatest common divisor
                
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            //Get whole portions if numerator > denominator
            if numerator > denominator {
                
                
                // Calculated the whole portions
                wholePortions = numerator / denominator
                
                //Calculate the remainder
                numerator = numerator % denominator
                
                //Assign to portion string
                portion += String(wholePortions)
                
                
            }
            if numerator >= 0 {
                
                portion += wholePortions > 0 ? " ": ""
                portion += "\(numerator)/\(denominator)"
                
                
                
            }
            //Express the remainder as a fraction
            
            
            
        }
        
        if var unit = ingredient.unit {
            
            if wholePortions > 1 {
            
            if unit.suffix(2) == "ch" {
                unit += "es"
                
             }
                else if unit.suffix(1) == "f" {
                   unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                    
                    
                    
                }
                
                
            }
            portion += ingredient.num == nil && ingredient.denom == nil ? "": " "
            
            //Calculate appropriate suffix
            return portion + unit
        }

        return portion
    }
}
