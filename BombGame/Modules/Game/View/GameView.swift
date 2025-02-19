//
//  GameViewStart.swift
//  BombGame
//
//  Created by Варвара Уткина on 11.02.2025.
//

import SwiftUI
import Lottie

struct GameView: View {
    @StateObject private var viewModel = GameViewModel(
        model: GameModel(),
        audioPlayer: AudioPlayer(),
        dataManager: DataManager.shared,
        settingsManager: SettingsManager.shared
    )
    @Environment(\.dismiss) private var dismiss
    
    private var topTextFont: Font {
        viewModel.isGameLaunched
        ? Font.customFont(size: 28).weight(.black)
        : Font.customFont(size: 28).weight(.medium)
    }
    
    private var playPauseButtonImage: String {
        viewModel.isGamePaused ? viewModel.model.playImage : viewModel.model.pauseImage
    }
    
    private var playbackMode: LottiePlaybackMode {
        switch (viewModel.isGameLaunched, viewModel.isGamePaused) {
        case (false, _):
            return .paused(at: .progress(0.1))
        case (true, true):
            return .paused(at: .currentFrame)
        case (true, false):
            return .playing(.fromProgress(0, toProgress: 1, loopMode: .playOnce))
        }
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
                    
                    navBarView
                    
                    Text(viewModel.topText)
                        .multilineTextAlignment(.center)
                        .font(topTextFont)
                        .foregroundStyle(Colors.TextColors.primary)
                    
                    LottieView(animation: .named(viewModel.model.texts.animationName))
                        .animationSpeed(viewModel.animationSpeed)
                        .playbackMode(playbackMode)
                    
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
        }
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $viewModel.shouldMoveToGameEnd) { FinalGameView() }
    }
    
    var navBarView: some View {
        HStack {
            
            Button {
                dismiss()
            } label: {
                Image(.backArrow)
                    .foregroundStyle(Colors.TextColors.primary)
            }
            
            Spacer()
            
            Text(viewModel.model.texts.title)
                .font(Font.customFont(size: 30).weight(.black))
                .foregroundStyle(Colors.TextColors.primary)
            
            Spacer()
            
            Button {
                viewModel.pauseGame()
            } label: {
                Image(systemName: playPauseButtonImage)
                    .resizable()
                    .frame(width: 27, height: 27)
                    .foregroundStyle(Colors.TextColors.primary)
            }
            .opacity(viewModel.isGameLaunched ? 1 : 0)
            
        }
    }
}

#Preview {
    GameView()
}
