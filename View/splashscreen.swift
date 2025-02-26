//
//  spalshscreen.swift
//  CatCow0
//
//  Created by Maryam Amer Bin Siddique on 19/08/1446 AH.
//

import SwiftUI

struct splashscreen: View {
    @State private var isActive = false
    @State private var opacity = 0.0

    var body: some View {
        if isActive {
            homepage()
        } else {
            VStack {
                Image("floating")
                    .resizable()
                    .frame(width: 95, height: 93)
                Image("logo")
                    .resizable()
                    .frame(width: 125, height: 95)
                    .padding(.leading, 10)
                    .padding(.top, -45)
            }
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeInOut(duration: 0.25)) {
                    opacity = 1.0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        isActive = true 
                    }
                }
            }
        }
    }
}

#Preview {
    splashscreen()
}
