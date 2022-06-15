//
// This source file is part of the Horn as a Service open source project
//
// SPDX-FileCopyrightText: 2022 Paul Schmiedmayer and the project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Apodini
#if canImport(AVFoundation)
import AVFoundation
#endif


struct Horn: Handler {
    private static var timesPlayed = 0
    #if canImport(AVFoundation)
    private static let audioPlayer: AVAudioPlayer = {
        guard let path = Bundle.module.path(forResource: "horn", ofType: "mp3"),
              let url = URL(string: path),
              let audioPlayer = try? AVAudioPlayer(contentsOf: url) else {
            return AVAudioPlayer()
        }
        
        audioPlayer.prepareToPlay()
        return audioPlayer
    }()
    #endif
    
    
    func handle() -> String {
        #if canImport(AVFoundation)
        Horn.audioPlayer.pause()
        Horn.audioPlayer.currentTime = .zero
        Horn.audioPlayer.play()
        Horn.timesPlayed += 1
        
        return "Horn played \(Horn.timesPlayed)!"
        #else
        return "Sorry, I can not play sounds with no AVFoundation beeing available"
        #endif
    }
}
