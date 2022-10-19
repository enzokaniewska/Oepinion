//
//  ProfileEditor.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 06.10.22.
//

import SwiftUI

struct ProfileEditor: View {
    
    @Binding var editedUser:User
    

    let availableLocations = ["Kärnten", "Steiermark", "Wien", "Salzburg", "Niederösterreich", "Oberösterreich", "Burgenland", "Vorarlberg"]
    var body: some View {
        List{
            DatePicker("Geburtsdatum", selection: $editedUser.birthdate, displayedComponents: .date)
            
            Picker("Region", selection: $editedUser.region) {
                ForEach(0..<availableLocations.count){ i in
                    Text(availableLocations[i]).tag(availableLocations[i])
                }
            }
      
            Toggle("Benachrichtigungen", isOn: $editedUser.isNotificationEnabled)
        }
        .listStyle(.plain)
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(editedUser: .constant(ModelData().user))
    }
}
