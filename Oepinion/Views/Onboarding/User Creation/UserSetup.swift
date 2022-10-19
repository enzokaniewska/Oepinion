//
//  UserSetup.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 11.10.22.
//

import SwiftUI

extension AnyTransition{
    static var moveForward: AnyTransition{
        .asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading)
        )
    }
    static var moveBackward: AnyTransition{
        .asymmetric(
            insertion: .move(edge: .leading),
            removal: .move(edge: .trailing)
        )
    }
    static var lastOne: AnyTransition{
        .asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .trailing)
        )
    }
    
}

struct UserSetup: View {
    
    @State var backgroundColor = Color.red
    @State var movingForward = true
    @State var userCreationStep = 1
    @State var birthDateInput = true
    @State var regionInput = false
    @State var notificationsInput = false
    
    var body: some View {
        
        
        ZStack {
            
            
            VStack {
                HStack{
                    Spacer()
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(birthDateInput ? .gray : .white)
                        .scaleEffect(birthDateInput ? 1.0 : 0.5)
                        
                        
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(regionInput ? .gray : .white)
                        .scaleEffect(regionInput ? 1.0 : 0.5)
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(notificationsInput ? .gray : .white)
                        .scaleEffect(notificationsInput ? 1.0 : 0.5)
                    Spacer()
                }
                .padding(.top, 50)
                Spacer()
            }
            
            VStack{
                Spacer()
                
                
                Spacer()
                
                if birthDateInput{
                    BirthdateInputView()
                        .padding()
                        .transition(movingForward ? .moveForward : .moveBackward)
                    
                        
                        
                }
                if regionInput{
                    RegionInputView()
                        .padding()
                        .transition(movingForward ? .moveForward : .moveBackward)
                        
                }
                if notificationsInput{
                    NotificationInputView()
                        .padding()
                        .transition(.lastOne)
                        
                }
              
                Button("Weiter"){
                    movingForward = true
                    withAnimation(.spring()){
                        if birthDateInput{
                            birthDateInput = false
                            regionInput = true
                            notificationsInput = false
                            backgroundColor = .orange
                        }else if regionInput{
                            regionInput = false
                            notificationsInput = true
                            backgroundColor = .green
                        }
                        
                    }
                    
                }
                .buttonStyle(.borderedProminent)
                .font(.title)
                    
                Button("Zurück"){
                    movingForward = false
                    
                    withAnimation(.spring()) {
                        if notificationsInput{
                            notificationsInput = false
                            regionInput = true
                            backgroundColor = .orange
                        }else if regionInput{
                            regionInput = false
                            birthDateInput = true
                            backgroundColor = .red
                        }
                    }
                  
                }
                .font(.title2)
                
                
                
                Spacer()
                
            }
        }
    }
}

struct UserSetup_Previews: PreviewProvider {
    static var previews: some View {
        UserSetup()
    }
}
