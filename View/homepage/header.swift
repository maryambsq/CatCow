//
//  header.swift
//  CatCow0
//
//  Created by Maryam Amer Bin Siddique on 20/08/1446 AH.
//

import SwiftUI

struct headerView: View {
    @ObservedObject var viewModel: homepageVM
    
    var body: some View {
        HStack {
            streakView(count: viewModel.streakCount)
                .padding(.trailing, 60)
            
            VStack {
                Text(viewModel.greeting)
                    .fontWeight(.black)
                Text(viewModel.dateString(Date(), format: "dd MMMM"))
                    .fontWeight(.semibold)
            }
            .padding(.trailing, 20)

            
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 28, height: 28)
                .padding(.leading, 60)
        }
        .padding(.vertical)
    }
}

#Preview {
    homepage()
}
