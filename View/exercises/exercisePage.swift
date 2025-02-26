//
//  exercisePage.swift
//  CatCow
//
//  Created by Maryam Amer Bin Siddique on 21/08/1446 AH.
//

import SwiftUI

struct exercisePage: View {
    let exercise: Exercise
    let isLast: Bool
    let exerciseType: String 
    let onComplete: () -> Void
    @StateObject private var timerManager = timerVM()
    @State private var showStreakScreen = false
    @Binding var navigationPath: NavigationPath
    
    @ObservedObject var viewModel: homepageVM
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color(hex: "E4E6EA")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                
                VStack(spacing: 20) {
                    Text(exercise.description)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                    
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 10)
                        
                        Circle()
                            .trim(from: 0, to: timerManager.progress)
                            .stroke(Color.black, style: StrokeStyle(
                                lineWidth: 10,
                                lineCap: .round
                            ))
                            .rotationEffect(.degrees(-90))
                            .animation(.easeInOut(duration: 1), value: timerManager.progress)
                        
                        Image(systemName: timerManager.isActive ? "pause.fill" : "play.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.black)
                    }
                    .frame(width: 150, height: 150)
                    .padding(.vertical, 25)
                    .onTapGesture {
                        guard !timerManager.hasCompleted else { return }
                        timerManager.toggleTimer(duration: exercise.duration)
                    }
                    
                    Text("\(timerManager.timeRemaining)")
                        .font(.largeTitle.bold().monospacedDigit())
                        .foregroundColor(.black)
                    
                    Text(exercise.name)
                        .font(.title2.bold())
                }
                .padding()
                .frame(width: 350, height: 460)
                .background(Color.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black.opacity(1), lineWidth: 1)
                )
                
                Spacer()
                
                if !isLast {
                    Button(action: {
                        onComplete()
                        timerManager.reset()
                    }) {
                        Text("Next Move")
                            .font(.title3.weight(.semibold))
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(BlackRoundedButtonStyle())
                    .disabled(!timerManager.hasCompleted)
                    .opacity(timerManager.hasCompleted ? 1 : 0.6)
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                }
                
                if isLast {
                    Button(action: {
                        showStreakScreen = true
                    }) {
                        Text("We're Done!")
                            .font(.headline.weight(.semibold))
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(BlackRoundedButtonStyle())
                    .disabled(!timerManager.hasCompleted)
                    .opacity(timerManager.hasCompleted ? 1 : 0.6)
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                }
            }
            .padding()
        }
        .onAppear {
            timerManager.setup(duration: exercise.duration)
        }
        .fullScreenCover(isPresented: $showStreakScreen) {
            streakScreen(viewModel: homepageVM(), dismissAction: { showStreakScreen = false })
        }
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
        .navigationTitle(exerciseType == "seated" ? "Sit up straight!" : "Grab a yoga mat!")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BlackRoundedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(configuration.isPressed ? Color.black.opacity(0.8) : Color.black)
            )
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
