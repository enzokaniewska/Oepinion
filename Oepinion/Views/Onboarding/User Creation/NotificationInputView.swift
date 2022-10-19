//
//  NotificationInputView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 11.10.22.
//

import SwiftUI

struct NotificationInputView: View {
    
    @State var notifications = false
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Möchtest du Benachrichtigungen bekommen?")
                .font(.title)
                .bold()
                .padding()
            
            Text("So bleibst du am neuesten Stand sobald neue Umfragen vorhanden sind")
                .padding()
            
            HStack {
                Spacer()
                Toggle("Benachrichtigungen erhalten", isOn: $notifications)
                    .toggleStyle(.button)
                    .labelsHidden()
                    .padding()
                Spacer()
            }
            
            
            

        }
        .padding()
    }
}

struct NotificationInputView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationInputView()
    }
}
