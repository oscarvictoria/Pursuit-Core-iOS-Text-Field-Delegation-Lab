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
    @IBOutlet weak var nextWordOutlet: UIButton!
    
    
    //var scrambledWord = Word.getRandomWord()
    var randomWord = Word.getRandomWord()
    var scrambledWord = String()
    
 

    //MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInput.delegate = self
        
    }
    
    // MARK: Actions and Methods
    
    @IBAction func userInputWhileEditing(_ sender: UITextField) {
        //instanceOfWord
        print(sender.text ?? "ERROR")
        scrambledWord = randomWord.scrambled
        if scrambledWord.contains(String(sender.text ?? "ERROR")) {
            print("We have a match")
        }
    }
    
    @IBAction func nextWord(_ sender: UIButton) {
        print(randomWord)
        print(scrambledWord)
        
        scrambledWordLabel.text = String(scrambledWord)
        nextWordOutlet.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userInput.resignFirstResponder()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}

