//
//  UserInputView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 12.10.22.
//

import SwiftUI

struct UserInputView: View {
    
    @State var newPictureButtonPressed = false
    
    let grey = Color("SecondaryLabel")
    @Binding var user:User
    @State var selectedGender = ""
    
    let availableLocations = ["Kärnten", "Steiermark", "Wien", "Salzburg", "Niederösterreich", "Oberösterreich", "Burgenland", "Vorarlberg"]
    
    let genders = ["Männlich", "Weiblich"]
    
    var body: some View {
        
        
        VStack(spacing: 15){
            
//            HStack {
//                Text("Dein Profilbild")
//                    .foregroundColor(.secondary)
//                    
//                Spacer()
//            }
            HStack{
                Spacer()
                Image(user.imageName)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .rotation3DEffect(.degrees(newPictureButtonPressed ? 360: 0), axis: (x: 1, y: -1, z: 0))
                Spacer()
                
            }
            
            HStack {
                Spacer()
                Button(action: {
                    
                    withAnimation(.spring()){
                        let newImageName = "animal\(Int.random(in: 1...50))"
                        user.imageName = newImageName
                        newPictureButtonPressed.toggle()
                    }
                    
        
                }, label: {
                    Label("Neues Profilbild", systemImage: "dice.fill")
                        
                })
                .buttonStyle(.bordered)
                .tint(.teal)
                .padding(.bottom, 10)
                Spacer()
            }
            .padding(.bottom)
            
            DatePicker("Geburtsdatum", selection: $user.birthdate, displayedComponents: .date)
                .foregroundColor(.secondary)
                .datePickerStyle(.compact)
                .tint(.teal)
            
            HStack {
                Text("Bundesland")
                    .foregroundColor(.secondary)
                Spacer()
                Picker("Region", selection: $user.region) {
                    ForEach(0..<availableLocations.count){ i in
                        Text(availableLocations[i]).tag(availableLocations[i])
                    }
                }
                .tint(.teal)
                
            
            }
            
            HStack() {
                Text("Geschlecht")
                    .foregroundColor(.secondary)
                Spacer()
            }
            .padding(.top, 5)
                
            Picker("Geschlecht", selection: $user.gender) {
                ForEach(Gender.allCases){ gender in
                    Text(gender.rawValue).tag(gender)
                }
            }
                .pickerStyle(.segmented)
                
               
                
            
            
            Toggle("Benachrichtigungen erhalten", isOn: $user.isNotificationEnabled)
                .foregroundColor(.secondary)
            
           
        }
        .padding()
        
    }
}

struct UserInputView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        
        
        UserInputView(user: .constant(ModelData().user))
    }
}
