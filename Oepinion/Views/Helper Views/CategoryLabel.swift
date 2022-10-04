//
//  CategoryLabel.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 29.09.22.
//

import SwiftUI

struct CategoryLabel: View {
    var category:Survey.categories
    
    static let categoryIcons = [
        Survey.categories.political : "person.2.circle.fill",
        Survey.categories.health : "heart.circle.fill",
        Survey.categories.transport: "car.circle.fill",
        Survey.categories.financial: "eurosign.circle.fill",
        Survey.categories.environment: "leaf.circle.fill",
        Survey.categories.education: "book.circle.fill"
    ]
    static let categoryColors = [
        Survey.categories.political : Color.brown,
        Survey.categories.health : Color.red,
        Survey.categories.transport: Color.blue,
        Survey.categories.financial: Color.cyan,
        Survey.categories.environment: Color.green,
        Survey.categories.education: Color.orange
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
