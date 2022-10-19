//
//  HorizontalCategoryView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 15.10.22.
//

import SwiftUI

struct HorizontalCategoryView: View {
    
    var body: some View {
        
        ScrollView(.horizontal){
           
            HStack {
                ForEach(Survey.Category.allCases){ category in
                    
                    NavigationLink {
                        CategoryView(category: category)
                    } label: {
                        CategoryButton2(category: category)
                    }
                }
            }
            
            
        }
        .safeAreaInset(edge: .leading, content: {
            Spacer()
                .frame(width: 10)
        })
        
        .scrollIndicators(.hidden)
        
    }
}

struct HorizontalCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCategoryView()
    }
}
