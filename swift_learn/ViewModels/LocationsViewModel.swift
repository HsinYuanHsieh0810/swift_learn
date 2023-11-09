//
//  LocationsViewModel.swift
//  swift_learn
//
//  Created by HsinYuan on 2023/11/10.
//

import Foundation

class LocationsViewModel: ObservableObject {// ObservableObject, view可以隨時觀察變化
    
    /*
     需要搭配 @Published 標記才會發送更改通知
     */
    @Published var locations: [Location]
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
    }
    
}
