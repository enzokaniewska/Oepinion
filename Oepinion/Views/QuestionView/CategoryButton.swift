//
//  CategoryButton.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 03.10.22.
//

import SwiftUI

struct CategoryButton: View {
    
    var category: Survey.categories
    
    var body: some View {
        
        HStack {
            Label(category.rawValue, systemImage: CategoryLabel.categoryIcons[category] ?? "")
                .frame(width: 140, alignment: .leading)
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.white)
                .font(.title3)
                .bold()
                .padding()
                .background(.linearGradient(CategoryLabel.categoryColors[category]!.gradient, startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15)
            
        }
            
    }
}

struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack (spacing: 20) {
            CategoryButton(category: .health)
            CategoryButton(category: .political)
            CategoryButton(category: .financial)
            CategoryButton(category: .environment)
            CategoryButton(category: .education)
            CategoryButton(category: .transport)
            
            
        }
        
    }
}
