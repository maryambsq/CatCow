//
//  homepageVM.swift
//  CatCow0
//
//  Created by Maryam Amer Bin Siddique on 19/08/1446 AH.
//

import SwiftUI

class homepageVM: ObservableObject {
    @Published var weekDates: [Date] = []
    @Published var streakCount = 0
    @Published var selectedExerciseType: ExerciseType?
    @Published var completedDates: Set<String> = []
    @Published var navigationPath = NavigationPath()
    @Published var isExerciseCompleted = false
    
    func markExerciseComplete() {
        isExerciseCompleted = true
    }
    
    private let streakKey = "user_streak_count"
    private let lastCompletionKey = "last_completion_date"
    private let completedDatesKey = "completed_dates"
    
    var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 0..<12: return "Good Morning"
        case 12..<17: return "Good Afternoon"
        default: return "Good Evening"
        }
    }
    
    init() {
        generateWeekDates()
        loadStreakData()
    }
    
    @MainActor
    func resetNavigationToHomepage() {
        self.navigationPath = NavigationPath() // ✅ Clears navigation history safely
    }
    
    private func generateWeekDates() {
        let calendar = Calendar.current
        let today = Date()
        let currentWeek = calendar.dateInterval(of: .weekOfYear, for: today)
        
        guard let  startDate = currentWeek?.start else { return }
        
        weekDates = (0..<7).compactMap { index in calendar.date(byAdding: .day, value: index, to: startDate)
        }
    }
    
    func dateString(_ date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func isToday(_ date: Date) -> Bool {
        Calendar.current.isDateInToday(date)
    }
    
    private func loadStreakData() {
        let defaults = UserDefaults.standard
        streakCount = defaults.integer(forKey: streakKey)
        completedDates = Set(defaults.stringArray(forKey: completedDatesKey) ?? [])
        
        if let lastDate = defaults.string(forKey: lastCompletionKey),
           let lastCompletionDate = ISO8601DateFormatter().date(from: lastDate),
           !Calendar.current.isDateInYesterday(lastCompletionDate) && !Calendar.current.isDateInToday(lastCompletionDate) {
            resetStreak()
        }
    }
    
    func isExerciseCompleted(on date: Date) -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        return completedDates.contains { storedDateString in
            if let storedDate = formatter.date(from: storedDateString) {
                return Calendar.current.isDate(storedDate, inSameDayAs: date)
            }
            return false
        }
    }
    
    func completeExerciseForToday() {
        let todayString = dateString(Date(), format: "yyyy-MM-dd")
        
        if !completedDates.contains(todayString) {
            completedDates.insert(todayString)
            streakCount += 1
            saveStreakData()
        }
    }
    
    private func resetStreak() {
        streakCount = 0
        completedDates.removeAll()
        saveStreakData()
    }
    
    private func saveStreakData() {
        let defaults = UserDefaults.standard
        defaults.set(streakCount, forKey: streakKey)
        defaults.set(Array(completedDates), forKey: completedDatesKey)
        defaults.set(ISO8601DateFormatter().string(from: Date()), forKey: lastCompletionKey)
    }
    
    enum ExerciseType {
        case seated
        case standing
    }
}
