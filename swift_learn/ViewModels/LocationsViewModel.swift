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
    
    func nextButtonPressed() {
        // get current index
        
        // 法1
        // let currentIndex = locations.firstIndex{ location in
        //        return location == maplocation
        // }// 返回找到的"第一個"符合條件元素的索引。
        
        guard let currentIndex = locations.firstIndex(where: { $0 == maplocation}) else {
            print("Could not find currnet index locations array! Should never happen.")
            return
        }// guard 語句檢查 locations.firstIndex(where:) 是否能找到一個符合條件的索引。這裡的條件是在 locations 陣列中找到一個與 maplocation 相等的元素。
        
        // Check if the currentIndex is valid
        let nextIndex  = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // 如果 nextIndex 不是有效的索引
            // 即 nextIndex 不在陣列的索引範圍內

            // 那麼重新開始，嘗試獲取陣列的第一個位置
            guard let firstLocation = locations.first else {
                // 如果陣列為空，則直接返回
                return
            }
            
            // 如果成功獲得第一個位置，則顯示這個位置
            showNextLocation(loaction: firstLocation)
            // 然後退出函數
            return
            
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(loaction: nextLocation)
        
    }
}
