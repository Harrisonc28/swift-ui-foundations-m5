//
//  RecipeListView.swift
//  Shared
//
//  Created by Harrison Carroll on 18/09/2022.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            
            VStack(alignment:.leading) {
                Text("All Recipes").bold().font(.largeTitle).padding(40)
                ScrollView {
                    LazyVStack (alignment: .leading){
                        ForEach (model.recipes) { r in
                            
                            
                            
                            NavigationLink(
                                destination: RecipeDetailView(recipe: r),
                                label: {
                                    //MARK: Row Item
                                    HStack(spacing: 20.0) {
                                        Image(r.image).resizable().scaledToFill().frame(width: 50, height: 50, alignment: .center)
                                            .clipped().cornerRadius(5)
                                        
                                        Text(r.name).foregroundColor(.black)
                                        
                                        
                                        
                                    }
                                    
                                })
                        }
                    }
                }
            }.navigationBarHidden(true).padding(.leading)
        }
        
    }
    
    
    struct RecipeListView_Previews: PreviewProvider {
        static var previews: some View {
            RecipeListView().environmentObject(RecipeModel())
        }
    }
}

