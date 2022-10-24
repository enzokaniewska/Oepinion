//
//  UserSetup2.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 12.10.22.
//

import SwiftUI
import UIKit

struct CreateUserView: View {
    

    @EnvironmentObject var modelData:ModelData
    
    
    @State var user = User(id: UIDevice().identifierForVendor!.uuidString, imageName: "animal1", isNotificationsEnabled: false, birthdate: Date(), region: "Kärnten", gender: .male)
    var body: some View {
     
        
            VStack(alignment: .leading){
                
                Text("Erstelle dein Konto")
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading)
                    
                    
                    
                
                UserInputView(user:$user)
             
                
                HStack {
                    Spacer()
                    Button {
                     
                        modelData.saveUserInDatabase(user: user)
                        modelData.saveUserOnDevice(user: user)
                
                    } label: {
                        
                        HStack(alignment: .center, spacing: 15){
                            
                            Image(systemName: "person.fill.badge.plus")
                                .symbolRenderingMode(.hierarchical)
                            
                            Text("Konto erstellen")
                            
                            
                        }
                            .font(.title2)
                            .padding(.horizontal, 25)
                            .padding(.vertical, 7)
                            .symbolRenderingMode(.hierarchical)
                            .labelStyle(.titleOnly)
//
                            
                            
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    .padding(.top, 50)
                   
                    Spacer()
                    
                }
                
            }
            .padding()
        
    }
}

struct UserSetup2_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserView()
            .environmentObject(ModelData())
    }
}
