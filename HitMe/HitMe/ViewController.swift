//
//  ViewController.swift
//  HitMe
//
//  Created by Fidan Oruc on 13.05.22.
//

import UIKit

class ViewController: UIViewController {

    var currentValue : Int = 0
    var targetValue : Int = 0
    var score = 0
    var round = 1
    
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var targetLabel : UILabel!
    @IBOutlet weak var scoreLabel : UILabel!
    @IBOutlet weak var roundLabel : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
        reset()
        
        slider.minimumTrackTintColor = UIColor.orange
        slider.maximumTrackTintColor = UIColor.blue
        
    }

    @IBAction func showAlert(){
         
        let difference = abs(targetValue - currentValue)
        
        var points = 100 - difference
        
        score = score + points
        round = round + 1
        
        let title : String
        
        if difference == 0{
            title = "Perfect!"
            points += 100
        }else if difference < 5{
            title = "You almost had it! "
            points += 50
        }else if difference < 10{
            title = "Pretty good!"
        }else{
            title = "Not even close!"
        }
        
        let message = "You scorred \(points) points"
       
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in // for change round and score label after clicking ok button
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    @IBAction func reset(){
        round = 0
        score = 0
        updateLabels()
    }
    
    @IBAction func sliderMoved(_ slider : UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
       
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)

    }
    
}

//        let thumbImageNormal = UIImage(named: "sliderThumb")!
//        slider.setThumbImage(thumbImageNormal, for: .normal)
//        let thumbImageHighlight = UIImage(named: "sliderThumb1")!
//        slider.setThumbImage(thumbImageHighlight, for: .highlighted)


//let message = "You scorred \(points) points \(currentValue) \nThe target value is \(targetValue)" +
//"\nThe difference is: \(difference)"



//        var difference : Int = targetValue - currentValue
//
//        if difference < 0 {
//            difference = difference * -1
//            //difference *= -1
//            //difference = -difference
//        }
//
//        if currentValue > targetValue{
//            difference = currentValue - targetValue
//        }else if targetValue > currentValue{
//            difference = targetValue - currentValue
//        }else{
//            difference = 0
//        }
