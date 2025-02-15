//
//  DropdownMenu.swift
//  BombGame
//
//  Created by nikita on 15.02.25.
//

import SwiftUI

struct DropdownMenuView: View {
    @StateObject var viewModel: DropdownMenuViewModel

    var body: some View {
        VStack(spacing: 10) {
            Button(action: {withAnimation {viewModel.pressed()} }) {
                HStack {
                    Text(viewModel.selectedOption)
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "chevron.up")
                        .foregroundColor(.gray)
                        .rotationEffect(.degrees(viewModel.isExpanded ? 0 : 90))
                        .animation(.easeInOut, value: viewModel.isExpanded)
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            }

            if viewModel.isExpanded {
                VStack(spacing: 5) {
                    ForEach(viewModel.options, id: \.self) { option in
                        Button(action: {
                            withAnimation {
                                viewModel.selectedOption = option
                                viewModel.isExpanded = false
                            }
                        }) {
                            Text(option)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                        }
                        .transition(.move(edge: .top).combined(with: .opacity))
                    }
                }
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .shadow(radius: 3)
            }
        }
        .padding()
    }
}

struct ContentView: View {
    var body: some View {
        DropdownMenuView(viewModel: DropdownMenuViewModel(Settings.BackgroundMusic.self))
    }
}

