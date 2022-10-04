//
//  TopicsList.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 28.09.22.
//

import SwiftUI

struct TopicsList: View {
    
  
    
    let topics = ModelData.testSurveys
    
    @State var user = ModelData.testUser
    @State var userSheetPresented = false
    
    
    var body: some View {
        
        
        NavigationView {
            ScrollView{
              
                
                VStack(alignment: .leading, spacing: 25) {
                    
                    HStack{
                        Text("Frage des Tages")
                            .font(.title)
                            .bold()
                    }
                    .padding(.leading)
                    .padding(.bottom, 5)
                    
                    
                    QuestionItem(survey: ModelData.testSurveys.last!)
                        .padding(.bottom)
                     
                    
                    Text("Kategorien")
                        .font(.title)
                        .bold()
                        .padding(.leading)
                    
                    CategoryOverview()
                    
                    
                    HStack(alignment: .center, spacing: 15) {
                        Text("Zurzeit im Trend")
                            .font(.title)
                            .bold()
                        Image(systemName: "flame.fill")
                            .foregroundColor(Color.orange)
                            .symbolRenderingMode(.hierarchical)
                            .scaleEffect(1.5)
                    }
                    .padding(.leading)
                    .padding(.bottom,1)
                   
                    
                    ForEach(topics){ topic in
                        
                        QuestionItem(survey: topic)
                        
                        
                        
                    }
                }
                
                Label("made with love in austria", systemImage: "heart.fill")
                    .font(.caption)
            }
            .padding(.top)
            //.navigationTitle("Umfragen")
            .toolbar{
                Button(action: {
                    userSheetPresented.toggle()
                }, label: {
                    Image(user.imageName)
                        .resizable()
                        .frame(width: 40, height: 40)
                })
            }.sheet(isPresented: $userSheetPresented, content: {
                UserView(user: $user)
            })
        }
        
        
        
    }
}

struct TopicsList_Previews: PreviewProvider {
    static var previews: some View {
        TopicsList()
    }
}
