//
//  LocationMapAnnotation.swift
//  swift_learn
//
//  Created by HsinYuan on 2023/11/14.
//

import SwiftUI

struct LocationMapAnnotation: View {
    
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack (spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 40)// 這樣地圖的點才會在Pin底下，不會被蓋住
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        LocationMapAnnotation()
    }
}
