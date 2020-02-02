//
//  ViewController.swift
//  Word Garden
//
//  Created by Ben Tsai on 1/29/20.
//  Copyright © 2020 Ben Tsai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    var wordToGuess = "SWIFT"
    var lettersGuessed = ""
    var maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guessCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatUserGuessLabel()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
        
    }
    
    func updateUIAfterGuess (){
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    func formatUserGuessLabel(){
        var revealedWord = ""
        lettersGuessed += guessedLetterField.text!
        for letter in wordToGuess{
            if lettersGuessed.contains(letter){
                revealedWord = revealedWord + " \(letter)"
            }else{
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
    
    func guessALetter(){
        formatUserGuessLabel()
        guessCount += 1
        //decrements the wrong guesses remaining and shows the next flower image with one less petal
        let currentGuessedLetter = guessedLetterField.text!
        if !wordToGuess.contains(currentGuessedLetter){
            wrongGuessesRemaining -= 1
            flowerImageView.image = UIImage(named: "flower\(wrongGuessesRemaining)")
        }
        
        let revealedWord = userGuessLabel.text!
        //stop game if wrongGuessesRemaining = 0
        if wrongGuessesRemaining == 0{
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "So Sorry, You're All Out of Guesses! Try Again?"
        }else if !revealedWord.contains("_"){
            //You've won!!
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text =  "You've got it! It Took You \(guessCount) Guesses to Guess the Word"
        }else{
            //Update guess count
            let guess = (guessCount == 1 ? "Guess" : "Guesses")
//            var guess = "guesses"
//            if guessCount == 1{
//                guess = "guess"
//            }
            guessCountLabel.text = "You've Made \(guessCount) \(guess)"
        }
        
    }
    
    @IBAction func guessedLetterFieldChanged (_ sender: UITextField) {
    
        if let letterGuessed=guessedLetterField.text?.last{
            guessedLetterField.text = "\(letterGuessed)"
            guessLetterButton.isEnabled = true
        }else{
            guessLetterButton.isEnabled = false
        }
    }
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        updateUIAfterGuess()
        
    }
    @IBAction func guessButtonPressed(_ sender: UIButton) {
        guessALetter()
        updateUIAfterGuess()
    }
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        playAgainButton.isHidden = true
        guessedLetterField.isEnabled = true
        guessLetterButton.isEnabled = false
        flowerImageView.image = UIImage(named: "flower8")
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        lettersGuessed = ""
        formatUserGuessLabel()
        guessCountLabel.text =  "You've Made 0 Guesses"
        guessCount = 0
        var wordsToGuess = ["GALLAUGHER", "XCODE", "SWIFT", "CODING", "IOS", "APPLE"]
        var newWord:String
        repeat{
            newWord = wordsToGuess.randomElement()!
        }while newWord == wordToGuess
        wordToGuess = newWord
        formatUserGuessLabel()
    }
    
    

}

