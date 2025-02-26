//
//  streakscreen.swift
//  CatCow
//
//  Created by Maryam Amer Bin Siddique on 23/08/1446 AH.
//

import SwiftUI

struct streakScreen: View {
    @ObservedObject var viewModel: homepageVM
    @State private var navigateToHome = false
    var dismissAction: () -> Void
    let weekDays = ["Mo", "Tu", "We", "Th", "Fr"]
    
    var currentDayIndex: Int {
        let today = Calendar.current.component(.weekday, from: Date()) - 2 // Adjust for Monday start
        return max(0, min(today, weekDays.count - 1)) // Ensure within bounds
    }
    
    var streakView: some View {
        VStack {
            Text("\(viewModel.streakCount) DAY STREAK")
                .font(.title3.weight(.black))
                .foregroundColor(.gray)
                .padding(.bottom, 5)
            
            HStack(spacing: 12) {
                ForEach(0..<weekDays.count, id: \.self) { index in
                    VStack {
                        Circle()
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(width: 30, height: 30)
                            .background(index == currentDayIndex ? Circle().fill(Color.black) : Circle().fill(Color.clear))
                            .overlay(
                                index == currentDayIndex
                                    ? Image(systemName: "checkmark")
                                        .foregroundColor(.white)
                                        .font(.caption)
                                    : nil
                            )
                        
                        Text(weekDays[index])
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color(hex: "E4E6EA")
                .ignoresSafeArea()
            NavigationLink(
                destination: homepage(), // Ensure this is correctly named!
                isActive: $navigateToHome
            ) {
                EmptyView()
            }
            .hidden() // Hide the link until activated
            
            VStack(spacing: 30) {
                Spacer()
                
                Text("Great Job!")
                    .font(.title)
                    .fontWeight(.black)
                
                Text("Kitty is grateful for your dedication!")
                    .font(.title3)
                    .multilineTextAlignment(.center).padding(.top, -20)
                
                Image("floating")
                    .resizable()
                    .frame(width: 220, height: 210)
                
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray, lineWidth: 1)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.clear))
                    .frame(width: 330, height: 120)
                    .overlay(streakView)
                
                Spacer()
                
                Button(action: {
                    viewModel.completeExerciseForToday()
                    navigateToHome = true // This triggers the navigation to homepage
                    dismissAction()
                }) {
                    Text("Finish")
                        .font(.title3.weight(.semibold))
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(BlackRoundedButtonStyle())
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
            .padding()
        }
    }
}
//import SwiftUI
//
//struct streakScreen: View {
//    @ObservedObject var viewModel: homepageVM
//    var dismissAction: () -> Void
//    let weekDays = ["Mo", "Tu", "We", "Th", "Fr"]
//    
//    var currentDayIndex: Int {
//        let today = Calendar.current.component(.weekday, from: Date()) - 2 // Adjust for Monday start
//        return max(0, min(today, weekDays.count - 1)) // Ensure within bounds
//    }
//    
//    var body: some View {
//        ZStack {
//            Color(hex: "E4E6EA")
//                .ignoresSafeArea()
//            
//            VStack(spacing: 20) {
//                Spacer ()
//                
//                Text("Great Job!")
//                    .font(.title)
//                    .fontWeight(.black)
//                
//                Text("Feeling amazing now!")
//                    .font(.title3)
//                    .multilineTextAlignment(.center)
//                
//                Spacer()
//                
//                RoundedRectangle(cornerRadius: 15)
//                    .stroke(Color.gray, lineWidth: 1)
//                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.clear))
//                    .frame(width: 450, height: 150)
//                    .padding()
//                    .overlay(
//                        VStack {
//                            Text("\(viewModel.streakCount) DAY STREAK")
//                                .font(.title3.weight(.black))
//                                .foregroundColor(.gray)
//                                .padding(.bottom, 5)
//                            
//                            HStack(spacing: 12) {
//                                ForEach(0..<weekDays.count, id: \.self) { index in
//                                    VStack {
//                                        Circle()
//                                            .stroke(Color.gray, lineWidth: 1)
//                                            .frame(width: 30, height: 30)
//                                            .background(index == currentDayIndex ? Circle().fill(Color.black) : Circle().fill(Color.clear))
//                                            .overlay(
//                                                index == currentDayIndex ? Image(systemName: "checkmark").foregroundColor(.white) : nil
//                                                    .font(.caption)
//                                            )
//                                        Text(weekDays[index])
//                                            .font(.caption)
//                                            .foregroundColor(.black)
//                                    }
//                                }
//                            }
//                        }
//                    )
//
//                Spacer()
//                
//                Button(action: {
//                    viewModel.completeExerciseForToday()
//                    viewModel.resetNavigationToHomepage()
//                }) {
//                    Text("Finish")
//                        .font(.title3.weight(.semibold))
//                        .frame(maxWidth: .infinity)
//                }
//                .buttonStyle(BlackRoundedButtonStyle())
//                .padding(.horizontal)
//                .padding(.bottom, 30)
//            }
//            .padding()
//        }
//    }
//}
//
