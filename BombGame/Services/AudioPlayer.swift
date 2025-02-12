//
//  AudioPlayer.swift
//  BombGame
//
//  Created by lorenc_D_K on 12.02.2025.
//

import AVFoundation

final class AudioPlayer {
    var isPlaying: Bool {
        audioPlayer?.isPlaying ?? false
    }
    private var audioPlayer: AVAudioPlayer?
    
    func playSound(file: String, loopsNumber: Int) {
        if let path = Bundle.main.path(forResource: file, ofType: "mp3") {
           
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.numberOfLoops = loopsNumber
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch {
                print("Error")
            }
            
        }
    }
    
    func play() { audioPlayer?.play() }
    
    func pause() { audioPlayer?.pause() }
    
    func stop() { audioPlayer?.stop() }
}
