//
//  Splash.swift
//  PlantSage
//
//  Created by Sariye Yaman on 22.08.2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct Splash: View {
    
    @State var isActive = false
    
    var body: some View {
        VStack{
            if isActive{
                if Auth.auth().currentUser != nil{
                    ContentView()
                }else{
                    Onboarding()
                }
            }else{
                Text("PlantSage")
                    .font(.largeTitle.bold())
            }
        }
        .onAppear(){
            //we move to onboarding screen 2.5 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                withAnimation{
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    Splash()
}
