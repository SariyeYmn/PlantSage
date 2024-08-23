//
//  ImageSlider.swift
//  PlantSage
//
//  Created by Sariye Yaman on 23.08.2024.
//

import SwiftUI

struct ImageSlider: View {
    
    var images: [String]
    
    var body: some View {
        TabView{
            ForEach(images, id:\.self){
                img in
                AsyncImage(url: URL(string: img)) {
                    Image in
                    Image.resizable()
                        .scaledToFit()
                }placeholder: {
                    ProgressView()
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
