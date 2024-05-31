//
//  ViewController.swift
//  MoodApp1
//
//  Created by Alireza Khibari on 2024-05-23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    
    @IBOutlet var scoreLable: UILabel!

    @IBOutlet var roundLable: UILabel!

    var currentValue: Int = 0
    var randomValue = 0
    var score = 0
    var round = 0
    var slidePart = 1
    var randomPart = 1
    var different = 0
    var slideMood="Happy"
    var randomMood="Happy"

    
    override func viewDidLoad() {
      super.viewDidLoad()
      currentValue = lroundf(slider.value)
      randomValue = Int.random(in: 1...100)
      updateLabels()
    }


    @IBAction func showAlert() {
        
        round += 1
        if (currentValue > 0  && currentValue < 20) {
            slideMood = "Sad"
            slidePart = 1
        } else if ( currentValue > 19 && currentValue < 40) {
            slideMood = "Neutral"
            slidePart = 2
        } else if ( currentValue > 39 && currentValue < 60) {
            slideMood = "Happy"
            slidePart = 3
        } else if ( currentValue > 59 && currentValue < 80) {
            slideMood = "Stressed"
            slidePart = 4
        } else if ( currentValue > 79 && currentValue < 101) {
            slideMood = "Excited"
            slidePart = 5
        }
        
        if (randomValue > 0  && randomValue < 20) {
            randomMood = "Sad"
            randomPart = 1
        } else if ( randomValue > 19 && randomValue < 40) {
            randomMood = "Neutral"
            randomPart = 2
        } else if ( randomValue > 39 && randomValue < 60) {
            randomMood = "Happy"
            randomPart = 3
        } else if ( randomValue > 59 && randomValue < 80) {
            randomMood = "Stressed"
            randomPart = 4
        } else if ( randomValue > 79 && randomValue < 101) {
            randomMood = "Excited"
            randomPart = 5
        }
        
        if (randomPart == slidePart) {
            different = 0
        } else if (slidePart > randomPart) {
            different = slidePart - randomPart
        } else {
            different = randomPart - slidePart
        }
        
        switch different {
        case 0:
            score += 100
        case 1:
            score += 80
        case 2:
            score += 60
        case 3:
            score += 40
        case 4:
            score += 20
        default:
            score += 0
        }
        updateLabels()
        
        let message = "The Mood of the slider is: \(slideMood)" +
                                "\nThe random mood is: \(randomMood)" +
                                "\nThe Score is: \(score)"
      let alert = UIAlertController(
        title: "Hello",
        message: message,    // changed
        preferredStyle: .alert)

      let action = UIAlertAction(
        title: "OK",          // changed
        style: .default,
        handler: nil)

      alert.addAction(action)

      present(alert, animated: true, completion: nil)
    }


    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func updateLabels() {
        scoreLable.text = String(score)
        roundLable.text = String(round)
    }

}

