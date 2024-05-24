//
//  ViewController.swift
//  MoodApp1
//
//  Created by Alireza Khibari on 2024-05-23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!


    var currentValue: Int = 0
    var randomValue = 0
    var slideMood="Happy"
    var randomMood="Happy"

    
    override func viewDidLoad() {
      super.viewDidLoad()
      currentValue = lroundf(slider.value)
      randomValue = Int.random(in: 1...100)

    }


    @IBAction func showAlert() {
        
        if (currentValue > 0  && currentValue < 20) {
            slideMood = "Sad"
        } else if ( currentValue > 19 && currentValue < 40) {
            slideMood = "Neutral"
        } else if ( currentValue > 39 && currentValue < 60) {
            slideMood = "Happy"
        } else if ( currentValue > 59 && currentValue < 80) {
            slideMood = "Stressed"
        } else if ( currentValue > 79 && currentValue < 101) {
            slideMood = "Excited"
        }
        
        if (randomValue > 0  && randomValue < 20) {
            randomMood = "Sad"
        } else if ( randomValue > 19 && randomValue < 40) {
            randomMood = "Neutral"
        } else if ( randomValue > 39 && randomValue < 60) {
            randomMood = "Happy"
        } else if ( randomValue > 59 && randomValue < 80) {
            randomMood = "Stressed"
        } else if ( randomValue > 79 && randomValue < 101) {
            randomMood = "Excited"
        }
        let message = "The Mood of the slider is: \(slideMood)" +
                       "\nThe random mood is: \(randomMood)"
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

}

