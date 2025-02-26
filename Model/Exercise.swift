//
//  Exercise.swift
//  CatCow0
//
//  Created by Maryam Amer Bin Siddique on 19/08/1446 AH.
//

import SwiftUI

struct Exercise: Identifiable {
    let id = UUID()
    let type: String
    let name: String
    let duration: Int
    let description: String
    let imageName: String
    
    static let mockData = [
        // Seated exercises
        Exercise(type: "seated", name: "Right-side Neck Tilt", duration: 15,
                description: "Gently tilt your head to the right side and hold.", imageName: "neck-stretch"),
        Exercise(type: "seated", name: "Left-side Neck Tilt", duration: 15,
                description: "Gently tilt your head to the left side and hold.", imageName: "neck-stretch"),
        Exercise(type: "seated", name: "Backward Shoulder Rolls", duration: 15,
                description: "Roll your shoulders backwards multiple times.", imageName: "shoulder-rolls"),
        Exercise(type: "seated", name: "Forward Shoulder Rolls", duration: 15,
                description: "Roll your shoulders forwards multiple times.", imageName: "shoulder-rolls"),
        Exercise(type: "seated", name: "Arms Stretch", duration: 15,
                description: "Hold your hands out, extend your arms up above your head and hold.", imageName: "shoulder-rolls"),
        
        // Standing exercises
        Exercise(type: "standing", name: "Standing Stretch", duration: 15,
                description: "Reach your arms overhead and stretch.", imageName: "standing-stretch"),
        Exercise(type: "standing", name: "Side-to-side Standing Stretch", duration: 15,
                description: "Slant to the right and stretch, then slant to the left side and stretch.", imageName: "standing-stretch"),
        Exercise(type: "standing", name: "Shoulder Rolls", duration: 15,
                description: "Roll shoulders forwards a couple of times then backwards.", imageName: "standing-stretch"),
        Exercise(type: "standing", name: "Cat-Cow", duration: 15,
                description: "Reach arms to the floor, place your knees and hands on the mat and stretch your spine.", imageName: "standing-stretch"),
        Exercise(type: "standing", name: "Child's pose", duration: 15,
                description: "Reach arms forward, bend your knees, lower your head and stretch.", imageName: "standing-stretch"),
    ]
}
