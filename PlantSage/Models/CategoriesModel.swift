//
//  CategoriesModel.swift
//  PlantSage
//
//  Created by Sariye Yaman on 23.08.2024.
//

import SwiftUI

struct CategoriesModel: Identifiable, Hashable{
    var id: UUID = .init()
    var title: String
    var icon: String
}

var sampleCategories:[CategoriesModel] = [
    .init(title: "All", icon: ""),
    .init(title: "Indoor", icon: "indoor"),
    .init(title: "Outdoor", icon: "outdoor"),
    .init(title: "Garden", icon: "garden")
]
