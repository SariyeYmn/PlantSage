//
//  Home.swift
//  PlantSage
//
//  Created by Sariye Yaman on 23.08.2024.
//

import SwiftUI

struct Home: View {
    
    @State var currentCategory = "All"
    
    @State var plantsList = [PlantsModel]()
    
    @StateObject var db = Database()
    
    @State var plant: PlantsModel? = nil
    
    @State var showPlant = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 20,content: {
                    HStack{
                        Text("Exclusive **Plants**\nfor your hobby")
                            .font(.largeTitle)
                        
                        Spacer()
                        
                        Image(systemName: "bell")
                            .padding(.vertical,25)
                            .padding(.horizontal,16)
                            .imageScale(.large)
                            .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.black.opacity(0.05),lineWidth: 3)
                            )
                        
                    }
                    
                    //Categories
                    categoriesView
                        .zIndex(1)
                    
                    //ProductList
                    plantsView
                        .fullScreenCover(isPresented: $showPlant, content: {
                            Plant(data: plant ?? db.plantList[0])
                        })
                    
                })
                .padding()
                .onAppear(){
                    plantsList = db.plantList
                }
            }
            .scrollIndicators(.hidden)
        }
    }
    
    var categoriesView: some View{
        ScrollView(.horizontal){
            HStack(spacing:15, content: {
                ForEach(sampleCategories, id:\.id){item in
                    HStack{
                        if !item.icon.isEmpty{
                            Image(item.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 26, height: 26)
                        }
                        if currentCategory == item.title || item.title == "All"{
                            Text(item.title)
                        }
                    }
                    .foregroundStyle(currentCategory == item.title ? .white : .black)
                    .padding()
                    .background(currentCategory == item.title ? .black : .gray.opacity(0.08))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation{
                            currentCategory = item.title
                            
                            //category filter
                            
                            if  item.title == "All"{
                                plantsList = db.plantList
                            }else{
                                plantsList = db.plantList.filter{ $0.categories == item.title }
                            }
                        }
                    }
                }
            })
        }
        .scrollIndicators(.hidden)
    }
    
    var plantsView: some View{
        VStack{
            ForEach(plantsList, id:\.id){
                item in
                VStack{
                    AsyncImage(url: URL(string: item.images[0])){
                        img in
                        img.resizable()
                            .scaledToFit()
                    }placeholder: {
                            ProgressView()
                    }
                    .frame(width: UIScreen.main.bounds.width - 40, height: 200)
                    .clipShape(Rectangle())
                    
                    Text(item.title)
                        .font(.headline.bold())
                    
                }
                .padding(.bottom)
                .background(.gray.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .onTapGesture {
                    plant = item
                    showPlant = true
                }
            }
        }
        .zIndex(0)
    }
}

#Preview {
    ContentView()
}
