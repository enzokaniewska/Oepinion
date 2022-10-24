//
//  UserView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 30.09.22.
//

import SwiftUI

struct UserView: View {
    
    @EnvironmentObject var modelData: ModelData
    @Environment(\.dismiss) private var dismiss
    @Environment(\.editMode) var editMode
    let haptic = UINotificationFeedbackGenerator()

    @State var editedUser = User(id: "a", imageName: "a", isNotificationsEnabled: false, birthdate: Date(), region: "s", gender: .male)
    
    @State private var newPictureButtonPressed = false
    
    var image:Image{
        Image(modelData.user.imageName)
    }
    
    var body: some View {
        
        
        VStack (alignment: .leading){
            
            HStack{
                if(editMode?.wrappedValue == .active){
                    Button("Cancel", role: .cancel) {
                        editedUser = modelData.user
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton()
                    
            
            }
            .padding(.bottom, 10)
            Text("Dein Account")
                .font(.largeTitle)
                .bold()
            
            HStack {
                Spacer()
                image
                    .renderingMode(.original)
                    .resizable()
                    .shadow(radius: 4)
                    .frame(width: 200, height: 200)
//                    .overlay{
//                        Circle().stroke(.white, lineWidth: 4)
//                    }
                    //.rotationEffect(.degrees(newPictureButtonPressed ? 360 : 0))
                    .rotation3DEffect(.degrees(newPictureButtonPressed ? 180: 0), axis: (x: 0, y: 1, z: 0))
                    .padding()
                    
                Spacer()
            }
            
            HStack {
                Spacer()
                Button(action: {
                    
                    haptic.notificationOccurred(.success)
                    withAnimation(.spring()){
                        modelData.user.imageName = "animal\(Int.random(in: 1...50))"
                        newPictureButtonPressed.toggle()
                    }
        
                }, label: {
                    Label("Neues Profilbild", systemImage: "dice.fill")
                        
                })
                .buttonStyle(.bordered)
                .tint(.teal)
                Spacer()
            }
            
            if(editMode?.wrappedValue == .inactive){
                ProfileDataView(user: modelData.user)
                    
            }else{
                ProfileEditor(editedUser: $editedUser)
                    .onAppear{
                        editedUser = modelData.user
                    }
                    .onDisappear{
                        modelData.user = editedUser
                        modelData.saveUserInDatabase(user: editedUser)
                    
                    }
                
            }
            
            
            Spacer()
            
        }
        .padding()
        
        
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
            .environmentObject(ModelData())
    }
}
