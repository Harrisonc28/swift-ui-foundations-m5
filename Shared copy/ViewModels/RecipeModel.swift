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
}
