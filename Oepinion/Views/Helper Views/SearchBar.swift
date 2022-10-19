//
//  SearchBar.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 15.10.22.
//

import SwiftUI

struct SearchBar: View {
    
    @State var searchBarText:String = ""
    var body: some View {
    
        HStack{
            
            Image(systemName: "magnifyingglass")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundColor(.teal)
                .padding(.leading, 10)
            
            
            TextField("Suche hier nach etwas", text: $searchBarText)
                .font(.title2)
                
             
        }
        .padding(.vertical, 10)
        .background(.quaternary)
        .cornerRadius(10)
        .padding(.horizontal)
//        .overlay(RoundedRectangle(cornerRadius: 20)
//            .stroke(Color.secondary, lineWidth: 1).opacity(0.5))
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
