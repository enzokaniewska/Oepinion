//
//  CategoryLabel.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 29.09.22.
//

import SwiftUI

struct CategoryLabel: View {
    var category:Survey.Category
    
    static let categoryIcons = [
        Survey.Category.political : "person.2.circle.fill",
        Survey.Category.health : "heart.circle.fill",
        Survey.Category.transport: "car.circle.fill",
        Survey.Category.financial: "eurosign.circle.fill",
        Survey.Category.environment: "leaf.circle.fill",
        Survey.Category.education: "book.circle.fill"
    ]
    static let categoryColors = [
        Survey.Category.political : Color.brown,
        Survey.Category.health : Color.red,
        Survey.Category.transport: Color.blue,
        Survey.Category.financial: Color.cyan,
        Survey.Category.environment: Color.green,
        Survey.Category.education: Color.orange
    ]
    
    var body: some View {
        
        Label(category.rawValue, systemImage: CategoryLabel.categoryIcons[category] ?? "")
            .fontWeight(.medium)
            .foregroundColor(CategoryLabel.categoryColors[category])
            .imageScale(.large)
            .symbolRenderingMode(.hierarchical)
    }
}

struct CategoryLabel_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack(alignment: .leading){
            CategoryLabel(category: .financial)
            CategoryLabel(category: .transport)
            CategoryLabel(category: .environment)
            CategoryLabel(category: .education)
            CategoryLabel(category: .health)
            CategoryLabel(category: .political)
        }
        
    }
}
