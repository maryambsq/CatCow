//
//  homepage.swift
//  CatCow0
//
//  Created by Maryam Amer Bin Siddique on 19/08/1446 AH.
//

import SwiftUI

struct homepage: View {
    @StateObject private var viewModel = homepageVM()
    @State var navigationPath = NavigationPath()
    @State private var reloadTrigger = false

    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            ZStack {
                Color(hex: "E4E6EA")
                    .ignoresSafeArea()
                VStack {
                    headerView(viewModel: viewModel)
                    calendarView(viewModel: viewModel)
                    exerciseCardsView(viewModel: viewModel)
                    Image(viewModel.isExerciseCompleted ? "standing" : "slouching")
                        .resizable()
                        .frame(width: viewModel.isExerciseCompleted ? 230 : 240, height: 205)
                        .padding(.trailing, viewModel.isExerciseCompleted ? 20 : 0)
                }
                .padding(.horizontal)
            }
            .navigationDestination(for: String.self) { destination in
                if destination == "streakScreen" {
                    streakScreen(viewModel: viewModel, dismissAction: {
                        viewModel.navigationPath = NavigationPath()
                        reloadTrigger.toggle()
                    })
                }
            }
        }
        .id(reloadTrigger) 

    }
}












//struct homepage: View {
//    var body: some View {
//        VStack {
//            HStack {
//                HStack {
//                    Image(systemName: "flame.fill")
//                        .resizable()
//                        .frame(width: 15, height: 20)
//                    Text("0")
//                }
//                .frame(width: 60, height: 35)
//                .background(RoundedRectangle(cornerRadius: 15).stroke())
//                VStack {
//                    Text ("Good Day")
//                        .fontWeight(.black)
//                    Text ("17 February")
//                        .fontWeight(.semibold)
//                }
//                .padding(.horizontal, 80)
//                
//                Image(systemName: "person.circle")
//                    .resizable()
//                    .frame(width: 30, height: 30)
//                    .padding(.leading)
//            }
//            .padding(.vertical)
//            HStack {
//                VStack {
//                    Text("Su")
//                    Text("16")
//                        .fontWeight(.heavy)
//                }
//                .foregroundColor(.gray)
//                .padding(.horizontal, 12)
//                VStack {
//                    Text("Mo")
//                    Text("17")
//                        .fontWeight(.heavy)
//                }
//                .frame(width: 40, height: 60)
//                .background(RoundedRectangle(cornerRadius: 10).stroke())
//                VStack {
//                    Text("Tu")
//                    Text("18")
//                        .fontWeight(.heavy)
//                }
//                .foregroundColor(.gray)
//                .padding(.horizontal, 12)
//                VStack {
//                    Text("We")
//                    Text("19")
//                        .fontWeight(.heavy)
//                }
//                .foregroundColor(.gray)
//                .padding(.horizontal, 12)
//                VStack {
//                    Text("Th")
//                    Text("20")
//                        .fontWeight(.heavy)
//                }
//                .foregroundColor(.gray)
//                .padding(.horizontal, 12)
//                VStack {
//                    Text("Fr")
//                    Text("21")
//                        .fontWeight(.heavy)
//                }
//                .foregroundColor(.gray)
//                .padding(.horizontal, 12)
//                VStack {
//                    Text("Sa")
//                    Text("22")
//                        .fontWeight(.heavy)
//                }
//                .foregroundColor(.gray)
//                .padding(.horizontal, 12)
//            }
//            .padding(.bottom, 50)
//            VStack {
//                Text("Let’s stay seated.")
//                    .font(.title2)
//
//                    .fontWeight(.black)
//                Text("on-desk quick stretches")
//            }
//            .frame(width: 350, height: 175)
//            .background(RoundedRectangle(cornerRadius: 15).stroke())
//            VStack {
//                Text("Get up & move.")
//                    .font(.title2)
//                    .fontWeight(.black)
//                Text("standing stretches")
//            }
//            .frame(width: 350, height: 175)
//            .background(RoundedRectangle(cornerRadius: 15).stroke())
//            .padding(.top, 10)
//            // sketch of lil slouchy kitty
//        }
//        Spacer()
//    }
//}

