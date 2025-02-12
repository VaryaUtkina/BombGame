//
//  GameViewStart.swift
//  BombGame
//
//  Created by Варвара Уткина on 11.02.2025.
//

import SwiftUI
import Lottie

struct GameView: View {
    @StateObject private var viewModel = GameViewModel(model: GameModel())
    
    private var topTextFont: Font {
        viewModel.isGameLaunched
        ? Font.customFont(size: 28).weight(.black)
        : Font.customFont(size: 28).weight(.medium)
    }
    
    private var playbackMode: LottiePlaybackMode {
        viewModel.isGameLaunched
        ? .playing(.fromProgress(0, toProgress: 1, loopMode: .playOnce))
        : .paused(at: .currentFrame)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Colors.ComponentsColors.gameBackground
                    .ignoresSafeArea()
                
                CurvedShape()
                    .ignoresSafeArea()
                    .foregroundStyle(.curvedShape)
                
                
                VStack {
                    Text(viewModel.topText)
                        .multilineTextAlignment(.center)
                        .font(topTextFont)
                        .foregroundStyle(Colors.TextColors.primary)
                    
                    LottieView(animation: .named(viewModel.model.texts.animationName))
                        .animationSpeed(viewModel.animationSpeed)
                    .playbackMode(playbackMode)
                    .opacity(viewModel.isGameLaunched ? 1 : 0)

                    Button {
                        viewModel.startGame()
                    } label: {
                        Text(viewModel.model.texts.launch)
                            .font(Font.customFont(size: 20).weight(.bold))
                            .foregroundStyle(Colors.TextColors.primary)
                    }
                    .frame(maxWidth: .infinity, minHeight: 55)
                    .background(Colors.ComponentsColors.gameViewButton)
                    .clipShape(.rect(cornerRadius: 10))
                    .opacity(viewModel.isGameLaunched ? 0 : 1)
                }
                .padding(.horizontal, 22.5)
                .padding(.bottom, 28)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(viewModel.model.texts.title)
                        .font(Font.customFont(size: 30).weight(.black))
                        .foregroundStyle(Colors.TextColors.primary)
                }
            }
        }
    }
}

#Preview {
    GameView()
}
