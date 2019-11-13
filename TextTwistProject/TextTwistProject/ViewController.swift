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
    
    @IBOutlet weak var scrambledWord: UILabel!
    
    
    @IBOutlet weak var userInput: UITextField!
    
    @IBOutlet weak var nextWordOutlet: UIButton!
    
    var randomScrambledWord = String()
    
    var unscrabledWord = String()
    
    var instanceOfWord = Word.getRandomWord().scrambled
    
 
//    func getUnscrambledWord(_ someWord:String) -> String {
//
//        for word in instanceOfWord {
//            let someWord = Word.getRandomWord().scrambled
//            let unscrambledWord = Word.getRandomWord().unscrambled
//        }
//
//        return unscrabledWord
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        userInput.delegate = self
    }
    
    // MARK: Actions and Methods
    
    
    @IBAction func userInputAction(_ sender: UITextField) {
    }
    
    
    
    @IBAction func nextWord(_ sender: UIButton) {
        randomScrambledWord =
        Word.getRandomWord().scrambled
        scrambledWord.text = randomScrambledWord
       // print(randomScrambledWord)
    }
    
    
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
        userInput.resignFirstResponder()
        return true
    }
    
    
 func textField(_ textField: UITextField,
                shouldChangeCharactersIn range: NSRange,
                replacementString string: String) -> Bool {

     if var oldString = textField.text {
        let newString = oldString.replacingCharacters(in: Range(range, in: oldString)!, with: unscrabledWord)
        oldString = randomScrambledWord
//        newString = oldString += unscrabledWord
        print(oldString)
        print(newString)
     }
    
    return true
 }
    
    
    
//    func textFieldShouldClear(_ textField: UITextField) -> Bool {
//        print("TextFieldShould clear")
//        return true
//    }
    
}

