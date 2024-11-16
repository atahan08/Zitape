//
//  AudioPlayerManager.swift
//  Zitape
//
//  Created by Aleksandra Neumestova on 15.11.2024.
//


import AVFoundation

class AudioPlayerManager: ObservableObject {
    var player: AVAudioPlayer?
    
    func configureAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Ses oturumu ayarlanamadı: \(error.localizedDescription)")
        }
    }

    func playSound(named soundName: String) {
        if let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("Ses çalınamadı: \(error.localizedDescription)")
            }
        }
    }
}
