//
//  ViewController.swift
//  SwiftSoundPractice
//
//  Created by 黒澤陸 on 2022/08/06.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSoundButton()
    }
    
    @objc func playSound() {
        if let soundPath = Bundle.main.path(forResource: "loop", ofType: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundPath))
                player.play()
            } catch {
                print("Sound error")
            }
        }
    }
    
    func setupSoundButton() {
        let button = UIButton(type: .system)
        button.center = CGPoint(x: view.center.x, y: view.center.y)
        button.frame.size = CGSize(width: 50, height: 50)
        button.layer.cornerRadius = 25
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        view.addSubview(button)
    }

}

