//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var cKey: UIButton!
    @IBOutlet weak var dKey: UIButton!
    @IBOutlet weak var eKey: UIButton!
    @IBOutlet weak var fKey: UIButton!
    @IBOutlet weak var gKey: UIButton!
    @IBOutlet weak var aKey: UIButton!
    @IBOutlet weak var bKey: UIButton!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "No title")
        let key: String = sender.titleLabel?.text ?? "No title"
        playSound(soundName: key)
        alphaAnimation(keySelected: key)
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    
    func alphaAnimation(keySelected: String) {
        let distance: CGFloat = 6
        let duration: TimeInterval = 0.1
        let button: UIView!
        
        switch keySelected {
        case "C":
            button = cKey
        case "D":
            button = dKey
        case "E":
            button = eKey
        case "F":
            button = fKey
        case "G":
            button = gKey
        case "A":
            button = aKey
        case "B":
            button = bKey
        default:
            button = nil
            print("Oops!")
        }
        
        UIView.animate(withDuration: duration, animations: {
            button.alpha = 0.5
            button.transform = CGAffineTransform(translationX: 0, y: distance)
        }) { _ in
           UIView.animate(withDuration: duration) {
               button.alpha = 1.0
               button.transform = .identity
           }
        }
        
        
    }
    
    
    
}

