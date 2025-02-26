//
//  exerciseSet.swift
//  CatCow
//
//  Created by Maryam Amer Bin Siddique on 21/08/1446 AH.
//

import SwiftUI

struct exerciseSet: View {
    let exerciseType: String
    @ObservedObject var viewModel: homepageVM

    @StateObject private var flowManager: exerciseFlowVM
    @State private var navigationPath = NavigationPath()

    init(exerciseType: String, viewModel: homepageVM) {
        self.exerciseType = exerciseType
        self.viewModel = viewModel
        let exercises = Exercise.mockData.filter { $0.type == exerciseType }
        _flowManager = StateObject(wrappedValue: exerciseFlowVM(exercises: exercises))
    }
        
    var body: some View {
        ZStack {
            Color(hex: "F1F2F4")
                .ignoresSafeArea()
            
            VStack {
                exercisePage(
                    exercise: flowManager.currentExercise,
                    isLast: flowManager.isLastExercise,
                    exerciseType: exerciseType,
                    onComplete: flowManager.moveToNextExercise,
                    navigationPath: $navigationPath,
                    viewModel: viewModel
                    )
                
                ExerciseProgressIndicator(
                    total: flowManager.exercises.count,
                    current: flowManager.currentIndex + 1
                )
                .padding()
            }
        }
    }
}

struct ExerciseProgressIndicator: View {
    let total: Int
    let current: Int
    
    var body: some View {
            HStack {
                ForEach(0..<total, id: \.self) { index in
                    Capsule()
                        .frame(width: 10, height: 10)
                        .padding(.horizontal, 5)
                        .foregroundColor(index < current ? .black : .gray.opacity(0.3))
                }
            }
    }
}

