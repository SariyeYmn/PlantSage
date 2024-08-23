//
//  PlantsModel.swift
//  PlantSage
//
//  Created by Sariye Yaman on 23.08.2024.
//

import SwiftUI

struct PlantsModel: Identifiable,Hashable {
    var id: String
    var title: String
    var categories: String
    var description: String
    var images: [String]
}

var samplePlants: [PlantsModel] = [
    .init(id: "ab", title: "Cocos Palm", categories: "Indoor", description: "Sıcak ve tropikal iklimlerim bitkisi olan cocos nucifera gerekli şartlar sağlandığı takdirde iç mekan bitkisi olarak da değerlendirilebilir. Nemli ve sıcak ortamları seven coconut palm için ideal oda ısısı koşulları 18 - 25 derecedir. Su ve nem gereksinimi fazla olduğundan yazın haftada iki defa sulama yapılmalı , kısın ise saksı tabağında  su birikmeyecek şekilde haftada bir defa su verilmelidir. Yazın bitkinin nem ihtiyacını karşılamak için yapraklarına spreyleme yöntemi ile su verebilirsiniz. Sulama direk toprak üzerinde bulunan coconut kabuğuna değil, köklere ulaşacak şekilde saksı kenarlarından yapılmalıdır.", images: ["https://www.botanikamo.com/content/images/gallery/coconut-palm-cocos-nucifera-2.jpg","https://cdn.myikas.com/images/78cd0ab1-c3e8-4c54-87a0-d4a5a2f23dd5/c96e3b16-92c1-46d9-8512-195e349b2e67/image_2560.webp"]),
    .init(id: "abc", title: "denemeee", categories: "Outdoor", description: "Sıcak ve tropikal iklimlerim bitkisi olan cocos nucifera gerekli şartlar sağlandığı takdirde iç mekan bitkisi olarak da değerlendirilebilir. Nemli ve sıcak ortamları seven coconut palm için ideal oda ısısı koşulları 18 - 25 derecedir. Su ve nem gereksinimi fazla olduğundan yazın haftada iki defa sulama yapılmalı , kısın ise saksı tabağında  su birikmeyecek şekilde haftada bir defa su verilmelidir. Yazın bitkinin nem ihtiyacını karşılamak için yapraklarına spreyleme yöntemi ile su verebilirsiniz. Sulama direk toprak üzerinde bulunan coconut kabuğuna değil, köklere ulaşacak şekilde saksı kenarlarından yapılmalıdır.", images: ["https://www.botanikamo.com/content/images/gallery/coconut-palm-cocos-nucifera-2.jpg","https://cdn.myikas.com/images/78cd0ab1-c3e8-4c54-87a0-d4a5a2f23dd5/c96e3b16-92c1-46d9-8512-195e349b2e67/image_2560.webp"])
]
