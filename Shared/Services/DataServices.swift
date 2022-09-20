//
//  DataServices.swift
//  The Recipe List App 4 (iOS)
//
//  Created by Harrison Carroll on 18/09/2022.
//

import Foundation

class dataService {
    
func getLocalData() -> [Recipe] {
        
       let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
    
        guard pathString != nil else {
            
            return [Recipe]()
            
            
        }
        //Get a url path to the json file
        let url = URL(fileURLWithPath: pathString!)
        //Create a URL object
        
        //Create a data object
        do {
        let data = try Data(contentsOf: url)
        
        let decoder = JSONDecoder()
            do{
        let recipeData = try decoder.decode([Recipe].self, from: data)
            
                for r in recipeData {
                    
                    r.id = UUID()
                    //Add unique ID's to ingredients 
                    for i in r.ingredients {
                        
                        i.id = UUID()
                        
                    }
                    
                    
                }
                return recipeData
                
            }
            catch{
                
                print(error)
            }
            
        }
        catch {
            
            print(error)
            
        }
        // Decode the data with a json decoder
        
        //Add the unique IDs
        
        //Return the recipes
        
        return [Recipe]()
        
        
    }
    
    
}
