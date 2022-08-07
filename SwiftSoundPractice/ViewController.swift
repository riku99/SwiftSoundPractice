//
//  ViewController.swift
//  SwiftSoundPractice
//
//  Created by 黒澤陸 on 2022/08/06.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSoundButton()
    }
    
    func playSound() {
        if let soundPath = Bundle.main.path(forResource: "loop", ofType: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundPath))
                player!.numberOfLoops = -1 // 負の値を入れることで無限ループ
                player!.play()
            } catch {
                print("Sound error")
            }
        }
    }
    
    @objc func tappedSoundButton() {
        let isPlaying = player?.isPlaying ?? false
        if isPlaying  {
            player!.stop()
        } else {
            playSound()
        }
    }
    
    func setupSoundButton() {
        let button = UIButton(type: .system)
        button.center = CGPoint(x: view.center.x, y: view.center.y)
        button.frame.size = CGSize(width: 50, height: 50)
        button.layer.cornerRadius = 25
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(tappedSoundButton), for: .touchUpInside)
        view.addSubview(button)
    }

}

