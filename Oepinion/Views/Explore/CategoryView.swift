//
//  CategoryView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 04.10.22.
//

import SwiftUI

struct CategoryView: View {
    
    @EnvironmentObject var modelData: ModelData

    var category: Survey.Category
    
    var filteredSurveys: [Survey]{ modelData.surveys.filter{ $0.category == self.category}
    }
    var body: some View {
        
        
        ScrollView{
            
            if filteredSurveys.isEmpty{
                Text("Ups, in dieser Kategorie ist noch nichts")
            }
            
            ForEach(filteredSurveys) { survey in
                SurveyItem(survey: survey)
            }
            
            
        }
        .navigationTitle(category.rawValue)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: .political)
            .environmentObject(ModelData())
        
    }
}
