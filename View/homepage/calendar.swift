//
//  calendar.swift
//  CatCow0
//
//  Created by Maryam Amer Bin Siddique on 20/08/1446 AH.
//

import SwiftUI

struct calendarView: View {
    @ObservedObject var viewModel: homepageVM
    
    var body: some View {
        HStack {
            ForEach(viewModel.weekDates, id: \.self) {
                date in calendarDayView(date: date, isToday: viewModel.isToday(date), viewModel: viewModel)
                    .frame(width: 40, height: 60)
                    .padding(.horizontal, 2)
            }
        }
        .padding(.horizontal, 100)
        .padding(.bottom, 40)
    }
}

struct calendarDayView: View {
    let date: Date
    let isToday: Bool
    @ObservedObject var viewModel: homepageVM
    
    var body: some View {
        VStack(spacing: 4) {
            Text(DateFormatter().shortWeekdaySymbols[Calendar.current.component(.weekday, from: date) - 1])
                .font(.caption)
            
            if viewModel.isExerciseCompleted(on: date) {
                Image(systemName: "checkmark")
                    .font(.caption)
                    .fontWeight(.heavy)
                    .padding(.top, 5)
            } else {
                Text(String(Calendar.current.component(.day, from: date))) 
                    .fontWeight(.heavy)
            }
        }
        .padding(.vertical, 10)
        .frame(width: 40, height: 60)
        .foregroundColor(isToday ? .primary: .gray)
        .background(isToday ? RoundedRectangle(cornerRadius: 10).stroke(.gray) : nil )
    }
}

#Preview {
    homepage()
}
