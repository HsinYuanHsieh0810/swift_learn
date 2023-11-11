//
//  LocationsViewModel.swift
//  swift_learn
//
//  Created by HsinYuan on 2023/11/10.
//

import Foundation
import SwiftUI
import MapKit


class LocationsViewModel: ObservableObject {// ObservableObject, view可以隨時觀察變化
    
    /*
     需要搭配 @Published 標記才會發送更改通知
     */
    @Published var locations: [Location]
    
    @Published var maplocation: Location { // 當 maplocation 變化時，將會調用 didSet，這樣可以在值更新後進行一些額外的操作
        didSet {
            updateMapRegion(location: maplocation)
        }
    }
    
    // 目前地圖地圖上的位置
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // 控制list顯示
    @Published var showLocationsList: Bool = false
    
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.maplocation = locations.first! // 設定初始地圖位置為 locations 第一個元素
        self.updateMapRegion(location: locations.first!) // 初始化地圖時，立即設置地圖視圖的初始顯示
    }
    
    private func updateMapRegion(location: Location) { // 更新地圖區域
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan
            )
        }
    }
    
    func toogleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(loaction: Location) {
        withAnimation(.easeInOut) {
            maplocation = loaction
            showLocationsList = false
        }
    }
}
