//
//  DropdownMenu.swift
//  BombGame
//
//  Created by nikita on 15.02.25.
//

import SwiftUI

struct DropdownMenuView: View {
    @StateObject var viewModel: DropdownMenuViewModel
    let title: String

    var body: some View {
        VStack(spacing: 0) {
            Button(action: {withAnimation {viewModel.pressed()} }) {
                HStack {
                    Text(title)
                        .font(Font.customFont(size: 16).weight(.bold))
                        .foregroundStyle(Color.secondaryText)
                    Spacer()
                    Text(viewModel.selectedOption)
                        .font(Font.customFont(size: 14).weight(.bold))
                        .foregroundStyle(Color.secondaryText)
                        .opacity(0.5)
                    
                    Image(systemName: "chevron.up")
                        .foregroundColor(Color.secondaryText)
                        .rotationEffect(.degrees(viewModel.isExpanded ? 0 : 90))
                }
                .padding()
                
            }

            if viewModel.isExpanded {
                VStack(spacing: 0) {
                    ForEach(viewModel.options, id: \.self) { option in
                        Button(action: {
                            withAnimation {
                                viewModel.change(option)
                            }
                        }) {
                            Text(option)
                                .padding()
                                .foregroundColor(Color.secondaryText)
                        }
                    }
                }
            }
        }
        .background(Color.primaryText)
        .cornerRadius(15)
    }
}

struct ContentView: View {
    var body: some View {
        DropdownMenuView(
            viewModel: DropdownMenuViewModel(Settings.BackgroundMusic.self),
            title: "test"
        )
    }
}
