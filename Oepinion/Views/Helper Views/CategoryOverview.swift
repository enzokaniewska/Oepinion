//
//  CategoryOverview.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 04.10.22.
//

import SwiftUI

struct CategoryOverview: View {
    
    let leftColumn: [Survey.Category] = [
        .education,
        .health,
        .transport
    ]
    let rightColumn: [Survey.Category] = [
        .financial,
        .political,
        .environment
    ]
    
    var body: some View {
        
        HStack(spacing: 20){
            Spacer()
            VStack(spacing: 20){
                ForEach(leftColumn){ item in
                    
                    NavigationLink {
                        CategoryView(category: item)
                    } label: {
                        CategoryButton(category: item)
                    }

                    
                }
            }
            VStack(spacing: 20){
                ForEach(rightColumn){ item in
                    NavigationLink {
                        CategoryView(category: item)
                    } label: {
                        CategoryButton(category: item)
                    }
                }
            }
            
            Spacer()
            
        }
        
    }
}

struct CategoryOverview_Previews: PreviewProvider {
    static var previews: some View {
        CategoryOverview()
    }
}
