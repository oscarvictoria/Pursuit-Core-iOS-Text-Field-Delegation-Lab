//
//  ViewController.swift
//  TextTwistProject
//
//  Created by Benjamin Stone on 11/4/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: View Controller Properties
    
    @IBOutlet weak var scrambledWordLabel: UILabel!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var nextWordButton: UIButton!
    @IBOutlet weak var mainMessageLabel: UILabel!
    
    
    var randomWord = Word.getRandomWord()
    var scrambledWord = String()
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        userInput.delegate = self
        nextWordButton.isEnabled = true
    }
    
    // MARK: Actions and Methods
    @IBAction func nextWord(_ sender: UIButton) {
        randomWord = Word.getRandomWord()
       // print(randomWord) **cheat**
        scrambledWord = randomWord.scrambled
        scrambledWordLabel.text = String(scrambledWord)
        nextWordButton.isEnabled = false
        view.backgroundColor = .white
        mainMessageLabel.text = ""
    }
// Not currently implemented, maybe for replacing characters in scrambledWordLabel?
    
//    @IBAction func userInputWhileEditing(_ sender: UITextField) {
//
//    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userInput.resignFirstResponder()
        if randomWord.unscrambled == userInput.text {
            mainMessageLabel.text = "Correct!"
            view.backgroundColor = .green
            nextWordButton.isEnabled = true
            userInput.text = "" // clears the user input
        } else {
            print("Incorrect, try again.")
            view.backgroundColor = .red
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let nsString = scrambledWord as NSString?
        let newString = nsString?.replacingCharacters(in: range, with: "X")
        print("\(String(describing: nsString))")
        print("Replacement Text: \(String(describing: newString))")
        return true
    }
}

