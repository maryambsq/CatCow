//
//  streak.swift
//  CatCow0
//
//  Created by Maryam Amer Bin Siddique on 20/08/1446 AH.
//

import SwiftUI

struct streakView: View {
    let count: Int
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "flame.fill")
                .resizable()
                .frame(width: 15, height: 20)
            Text(" \(count)")
                .fontWeight(.heavy)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray))
    }
}

#Preview {
    homepage()
}


