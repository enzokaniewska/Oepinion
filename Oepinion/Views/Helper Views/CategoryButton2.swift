//
//  CategoryButton2.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 15.10.22.
//

import SwiftUI

struct CategoryButton2: View {
    
    @State var category: Survey.Category
    var body: some View {
        
        VStack(alignment: .center) {
            
            Label("Umwelt", systemImage: CategoryLabel.categoryIcons[category]!)
                .labelStyle(.iconOnly)
                .padding(15)
                .background(.linearGradient(CategoryLabel.categoryColors[category]!.gradient, startPoint: .leading, endPoint: .trailing))
                .foregroundColor(.white)
                .symbolRenderingMode(.hierarchical)
                .font(.largeTitle)
                .cornerRadius(20)
              
            Text(category.rawValue)
                .font(.subheadline)
                .bold()
                .foregroundColor(.primary)
            
        }
        .frame(width: 85)
        
    }
}

struct CategoryButton2_Previews: PreviewProvider {
    static var previews: some View {
        
        
        CategoryButton2(category:.health)
         
        
    }
}
