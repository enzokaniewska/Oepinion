//
//  CategoryView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 04.10.22.
//

import SwiftUI

struct CategoryView: View {
    
    var category: Survey.Category
    
    var filteredSurveys: [Survey]{ ModelData.testSurveys.filter{ $0.question.category == self.category}
    }
    var body: some View {
        
        
        ScrollView{
            ForEach(filteredSurveys) { survey in
                QuestionItem(survey: survey)
            }
            
            
        }
        .navigationTitle(category.rawValue)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: .political)
        
    }
}
