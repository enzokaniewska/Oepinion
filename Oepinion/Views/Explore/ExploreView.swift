//
//  TopicsList.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 28.09.22.
//

import SwiftUI

struct ExploreView: View {
    
    
    @EnvironmentObject var modelData: ModelData
    
    @State var userSheetPresented = false
    let background = Color("Background")
    
    var body: some View {
        
        
        NavigationView {
            ScrollView{
                
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    SearchBar()
                    
                    Text("Kategorien")
                        .font(.title)
                        .bold()
                        .padding(.leading)
                        
                    
                    HorizontalCategoryView()
                       
                    
                        
                    
                    Divider()
                    
//                    Text("Frage des Tages")
//                        .font(.title)
//                        .bold()
//                        .padding(.leading)
//
//                    SurveyItem(survey: Survey.test)
                    
                    Text("Zurzeit im Trend")
                        .font(.title)
                        .padding(.leading, 10)
                        .bold()
                    
                    ForEach(modelData.surveys){ survey in
                        
                        NavigationLink {
                            if survey.wasAnswered{
                                ResultsView(survey: survey)
                            }else{
                                QuestionView(survey: survey)
                            }
                            
                        } label: {
                            SurveyItem(survey: survey)
                        }

                        
                        Divider()
                        
                    }
                }
                
                Label("made with love in austria", systemImage: "heart.fill")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .navigationTitle("Übersicht")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button(action: {
                    userSheetPresented.toggle()
                }, label: {
                    Image(modelData.user.imageName)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding(.bottom, 5)
                    
                })
            }.sheet(isPresented: $userSheetPresented, content: {
                UserView()
            })
        }
        
        
        
    }
}

struct TopicsList_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .environmentObject(ModelData())
    }
}
