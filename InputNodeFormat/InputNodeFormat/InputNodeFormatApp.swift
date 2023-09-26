//
//  InputNodeFormatApp.swift
//  InputNodeFormat
//
//  Created by Adrien FERRIGNO on 26/09/2023.
//

import SwiftUI
import AVFoundation

@main
struct InputNodeFormatApp: App {
    let audioEngine = AVAudioEngine()

    init() {
        try! AVAudioSession.sharedInstance().setCategory(.playAndRecord)
        
        let inputFormat = audioEngine.inputNode.inputFormat(forBus: 0)
        print(inputFormat)

        audioEngine.inputNode.installTap(onBus: 0, bufferSize: 4096, format: inputFormat) { buffer, _ in
            print(buffer.floatChannelData![0][0])
        }

        try! audioEngine.start()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
