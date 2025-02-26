//
//  standing.swift
//  CatCow0
//
//  Created by Maryam Amer Bin Siddique on 19/08/1446 AH.
//

import SwiftUI

struct standing: View {
    @State private var navigateToExercises = false
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: homepageVM

    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "E4E6EA")
                    .ignoresSafeArea()
                VStack(spacing: 40) {
                    Text("Here’s a set of exercises that will only take 3 minutes from your time.")
                        .font(.title3.weight(.semibold))
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding(.top, 30)
                    Image("stretching")
                        .resizable()
                        .frame(width: 215, height: 210)
                    Text("Stand up and grab a yoga mat!")
                        .font(.title3.weight(.semibold))
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding(.top, 30)
                    Spacer()
                }
                .padding()
                
                VStack {
                    Spacer()
                    NavigationLink {
                        exerciseSet(exerciseType: "standing", viewModel: viewModel)
                    } label: {
                        Text("Start")
                            .font(.title3.weight(.semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(RoundedRectangle(cornerRadius: 15)
                                .fill(.black))
                            .padding(.horizontal, 30)
                            .padding(.bottom, 30)
                    }
                }
            }
            .navigationTitle("Away from Desk")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black) 
                    }
                }
            }
        }
    }
}
