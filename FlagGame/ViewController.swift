//
//  ViewController.swift
//  FlagGame
//
//  Created by Anderson Sales on 21/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
        
        /*
         This is a configuration for the border width and color, which I am not using in this app
         
         buttonOne.layer.borderWidth = 1
         buttonTwo.layer.borderWidth = 1
         buttonThree.layer.borderWidth = 1
         
         buttonOne.layer.borderColor = UIColor.lightGray.cgColor
         buttonTwo.layer.borderColor = UIColor.lightGray.cgColor
         buttonThree.layer.borderColor = UIColor.lightGray.cgColor
         */
        
        askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction!){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionsAsked += 1
        
        buttonOne.setImage(UIImage(named: countries[0]), for: .normal)
        buttonTwo.setImage(UIImage(named: countries[1]), for: .normal)
        buttonThree.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) | Score: \(score)"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Incorrect"
            //score -= 1
        }
        
        if questionsAsked < 10{
            if title == "Incorrect" {
                let ac = UIAlertController(title: title, message: "You should have chosen row \(correctAnswer+1)", preferredStyle: .alert)
                
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                
                present(ac, animated: true)
            } else {
                let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
                
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                
                present(ac, animated: true)
            }
        } else {
            let ac = UIAlertController(title: "Wow", message: "You have already answered \(questionsAsked) questions! That's enough!", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))

            present(ac, animated: true)
        }
    }
}


