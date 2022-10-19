//
//  ContentViewHandler.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 19.10.22.
//

import SwiftUI

struct ContentViewHandler: View {
    
    @EnvironmentObject var modelData:ModelData
    @State var startButtonPressed = false
    @State var userExists = false
    
    var body: some View {
        
        if modelData.userIsLoggedIn{
            MainAppView()
        }else{
            if !startButtonPressed{
                StartScreen(startButtonPressed: $startButtonPressed)
            }else if startButtonPressed{
                CreateUserView()
            }
            
        }
        
    }
}

struct ContentViewHandler_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewHandler()
            .environmentObject(ModelData())
    }
}
