//
//  ProfileDataView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 06.10.22.
//

import SwiftUI

struct ProfileDataView: View {
    
    var user: User
    var body: some View {
        
        List{
            
            HStack {
                Text("Alter")
                Spacer()
                Text("\(user.getAge()) Jahre")
            }
            
            
            HStack {
                Text("Region")
                Spacer()
                Text("\(user.region)")
            }
            
            HStack{
                Text("Benachrichtigungen")
                Spacer()
                Text(user.isNotificationsEnabled ? "Ein" : "Aus")
            }
            
            
        }
        .listStyle(.plain)
        .foregroundColor(.secondary)
        
    }
}

struct ProfileDataView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDataView(user: ModelData().user)
    }
}
