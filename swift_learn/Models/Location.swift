//
//  Location.swift
//  swift_learn
//
//  Created by HsinYuan on 2023/11/8.
//

import Foundation
import MapKit // 因為有用到CLLocationCoordinate2D

struct Location: Identifiable, Equatable{
    /*
     Identifiable 主要用於唯一識別目的，確保每個元素都是獨特的，而 Equatable 用於檢查兩個實例是否相等。
     */
   
    // let id = UUID().uuidString // 創建一個隨機的uuid，但如果相同的地點每次創建會有不同的uuid，會無法進行我們想要的操作
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    // Identifiable
    var id: String {
        // name = "Colosseum"
        // cityName = "Rome"
        // id = name + cityName
        name + cityName
    }
    
    // Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
        
    }
    
}

