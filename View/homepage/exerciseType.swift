//
//  exerciseType.swift
//  CatCow0
//
//  Created by Maryam Amer Bin Siddique on 20/08/1446 AH.
//

import SwiftUI

struct exerciseCardsView: View {
    @ObservedObject var viewModel: homepageVM
    
    var body: some View {
        VStack(spacing: 20) {
            NavigationLink(destination: seated(viewModel: viewModel)) {
                exerciseCard(
                    isSelected: viewModel.selectedExerciseType == .seated,
                    title: "Let's stay seated.",
                    subtitle: "at-desk quick stretches"
                )
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            
            NavigationLink(destination: standing(viewModel: viewModel)) {
                exerciseCard(
                    isSelected: viewModel.selectedExerciseType == .standing,
                    title: "Get up & get moving.",
                    subtitle: "standing stretches"
                ) 
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct exerciseCard: View {
    let isSelected: Bool
    let title: String
    let subtitle: String
    
    var body : some View {
            VStack(spacing: 8) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.black)
                Text(subtitle)
            }
            .frame(width: 360, height: 175)
            .foregroundColor(isSelected ? .white : .primary)
            .background(RoundedRectangle(cornerRadius: 15) . fill(isSelected ? Color.black : Color.white) .overlay(RoundedRectangle(cornerRadius: 15).stroke(isSelected ? Color.clear : Color.primary)))
    }
}

#Preview {
    homepage()
}
