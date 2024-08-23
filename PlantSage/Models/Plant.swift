//
//  Plant.swift
//  PlantSage
//
//  Created by Sariye Yaman on 23.08.2024.
//

import SwiftUI

struct Plant: View {
    
    // Its our product view we show single product here 
    
    var data: PlantsModel
    @Environment(\.presentationMode) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    VStack{
                        ZStack(alignment:.top){
                            ImageSlider(images: data.images)
                                .frame(height: 300)
                                .clipShape(RoundedRectangle(cornerRadius: 50))
                                .padding(10)
                            
                            //Navigation
                            HStack{
                                Image(systemName: "arrow.left")
                                    .onTapGesture {
                                        dismiss.wrappedValue.dismiss()
                                    }
                                
                                Spacer()
                                
                                Image(systemName: "heart")
                            }
                            .padding(.horizontal,30)
                            .imageScale(.large)
                        }
                        
                        Text(data.categories)
                            .font(.title2)
                        Text(data.title)
                            .font(.title.bold())
                        
                        Text(data.description)
                            .padding(10)
                    }
                }
                
                //Bottom bar
            }
            //.ignoresSafeArea()
        }
    }
}
