//
//  ViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 03.01.2022.
//

import UIKit
import AVFoundation //фрэймворк для работы с аудио и видео

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    var slider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slider.frame = CGRect(x: 0, y: 0, width: 200, height: 23)
        self.slider.center = self.view.center
        self.slider.minimumValue = 0.0
        self.slider.maximumValue = 100.0
        self.view.addSubview(slider)
        
        self.slider.addTarget(self, action: #selector(changeSlider(sender:)), for: .valueChanged)
        
        do {
            if let audioPath = Bundle.main.path(forResource: "EnemyID", ofType: ".mp3"){ //получаем путь в виде строки до файла с музыкой
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("error")
        }
        
        
        
    }
    
    @IBAction func playButton(_ sender: Any) {
        self.player.play()
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        self.player.pause()
    }
    
    
    @objc
    func changeSlider(sender: UISlider){
        if sender == slider{
            self.player.currentTime = TimeInterval(sender.value)
        }
    }

}


