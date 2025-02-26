//
//  exerciseFlowVM.swift
//  CatCow
//
//  Created by Maryam Amer Bin Siddique on 21/08/1446 AH.
//

import SwiftUI

class exerciseFlowVM: ObservableObject {
    @Published var currentIndex: Int = 0
    let exercises: [Exercise]
    
    init(exercises: [Exercise]) {
        self.exercises = exercises
    }
    
    func moveToNextExercise() {
        if currentIndex < exercises.count - 1 {
            currentIndex += 1
        }
    }
    
    var currentExercise: Exercise {
        exercises[currentIndex]
    }
    
    var isLastExercise: Bool {
        currentIndex == exercises.count - 1
    }
}
