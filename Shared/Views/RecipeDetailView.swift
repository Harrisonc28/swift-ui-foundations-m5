//
//  RecipeDetailView.swift
//  The Recipe List App 4
//
//  Created by Harrison Carroll on 19/09/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var selectedServingSize = 2
    
    
    var body: some View  {
        
        ScrollView {
            VStack(alignment: .leading){
                //MARK: Image
                Image(recipe.image)
                    .resizable().scaledToFill()
                
                
                //MARK: Serving Size Picker
                VStack(alignment: .leading) {
                Text("Select your serving size here:")
                Picker("", selection: $selectedServingSize) {
                    Text("2").tag(2)
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                    
                    
                }.pickerStyle(SegmentedPickerStyle()).frame(width: 160)
                }.padding()
                
                //MARK: Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients").font(.headline).padding([.bottom, .top], 5)
                    
                    ForEach (recipe.ingredients) {
                        item in
                        Text("-" + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + "" + item.name)
                        
                    }
                }
            //MARK: Divder
                Divider()
                
                //MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions").font(.headline).padding([.bottom, .top], 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) {
                        index in
                        Text(String(index+1) + "." + recipe.directions[index]).padding(.bottom, 5)
                    }
                }
                
                
            }
            .padding(.horizontal)
            
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
