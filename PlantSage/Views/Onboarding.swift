//
//  Onboarding.swift
//  PlantSage
//
//  Created by Sariye Yaman on 22.08.2024.
//

import SwiftUI

struct Onboarding: View {
    
    @State private var isActive = false
    //animation propeties
    @State private var isExpanded = false
    @State private var offset = CGSize.zero
    var body: some View {
        
        if isActive{
            // we more to Login Screen after that
            Sign_in()
        }else{
            //Design of this view
            ZStack{
                VStack{
                    Spacer()
                    //Add a red circle in bottom that show animation
                    
                    Circle()
                        .fill(
                            RadialGradient(colors: [.init(red: 0.10, green: 0.33, blue: 0.10), .clear, .clear, .clear], center: .center, startRadius: 0, endRadius: UIScreen.main.bounds.width)
                        )
                        .scaleEffect(isExpanded ? 20 :2)
                        .padding(.bottom, -(UIScreen.main.bounds.width / 2))
                }
                .frame(height: .infinity)
                .zIndex(isExpanded ? 2 : 0)
                
                VStack(spacing: 15, content: {
                    Spacer()
                    Text("Start journey\nwith PlantSage")
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)
                        .padding(.top, 450)
                    
                    Text("loremipsumalmdalşcmaşlcaşcacşakcaipckaiğcka")
                        .multilineTextAlignment(.center)
                        .opacity(0.6)
                    
                    Spacer()
                    
                    VStack{
                        
                        Image(systemName: "chevron.up")
                        Text("Get Started")
                            .padding(.top)
                    }
                    .fontWeight(.medium)
                })
                .opacity(isExpanded ? 0 : 1)
                .offset(offset)
            }
            //When user swipe up all layout goes up for that we add swipe up gesture
            .gesture(DragGesture()
                .onEnded({ value in
                    if value.translation.height < 50 {
                        withAnimation(.easeInOut(duration: 2)){
                            offset = value.translation
                            isExpanded = true
                        }
                        //now when swipe we move to next scene
                        DispatchQueue.main.asyncAfter(deadline:.now() + 2.5){
                            withAnimation{
                                isActive.toggle()
                            }
                        }
                    }
                    
                }))
            
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("background1")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
            )
            //.preferredColorScheme(.dark)
        }
    }
}

#Preview {
    Onboarding()
}
