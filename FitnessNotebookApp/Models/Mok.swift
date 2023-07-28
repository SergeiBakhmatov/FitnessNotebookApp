//
//  Mok.swift
//  FitnessNotebookApp
//
//  Created by Sergei Bakhmatov on 28.07.2023.
//

import Foundation

struct Workout {
    let date: Date
    var Practices: [Practice]
    
    static func fetchWorkouts() -> [Workout] {
        var mokWorkouts: [Workout] = []
        
        let workoutOne = Workout(date: Date.now, Practices: [
            Practice(name: "bench press", weight: 50),
            Practice(name: "barbell squat", weight: 70)
        ])
        
        let workoutTwo = Workout(date: Date.distantFuture, Practices: [
            Practice(name: "press", weight: 100),
            Practice(name: "barbell squat", weight: 80)
        ])
        
        mokWorkouts.append(workoutOne)
        mokWorkouts.append(workoutTwo)
        return mokWorkouts
    }
}

struct Practice {
    var name: String
    var weight: Int
}
