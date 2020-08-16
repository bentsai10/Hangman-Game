# Word-Garden
A Swifty twist of the traditional hangman game!

Step into the Word Garden and test your logic and guessing skills(luck)!

<p align = "center"><kbd><img src = "/images/game_start.png" height = "400"></kbd></p>

<p><strong>Word Garden's purpose:</strong><br>Provide a fresh and family-friendly way to play Hangman by replacing the gruesome image of hanging with a wilting flower</p>

<h3> Accessing the Word Garden</h3>
<ul>
  <li>Own a Mac (Sorry PC users :( )</li>
  <li>Download XCode</li>
  <li>Word Garden was created using XCode 11.6, so make sure you have that or a higher version!</li>
  <li>Go to the "Code" dropdown above and select "Open in XCode!"</li>
  <li>Enjoy your time in the Garden!</li>
</ul>

<h3>How Word Garden Works</h3>
<ol>
  <li>Type a letter to guess. If you're correct, the flower stays intact. If not, a petal is lost! The Garden will track how many guesses you make!</li>
  <br>
  <p><strong>Correct Guess:</strong><img src = "/images/white_space.png" height = "10" width = "300"><strong>Incorrect Guess:</strong></p>
  <p align = "center"><kbd><img src = "/images/correct_guess.gif" height = "500"></kbd><img src = "/images/white_space.png" height = "10" width = "200"><kbd><img src = "/images/wrong_guess.gif" height = "500"></kbd></p>
  <li>If you correctly guess the word, you save the flower, and you have the chance to keep your conservation efforts going!</li>
  <br>
  <p align = "center"><kbd><img src = "/images/successful_word.gif" height = "500"></kbd></p>
  <li>If you fail to guess the word, the flower wilts :( but you can redeem yourself by saving other flowers in the garden!</li>
  <br>
  <p align = "center"><kbd><img src = "/images/failed_word.gif" height = "500"></kbd></p>
  <li>Start a new game by pressing play again. This time, a new word will be generated!</li>
  <br>
  <p align = "center"><kbd><img src = "/images/new_game.gif" height = "500"></kbd></p>
</ol>
<h3>Logic Behind the Garden</h3>
<ul>
  <li>Formatting display of hidden word when guess is made:</li>
  <ul>
    <li>Letter guessed gets added to long string containing all previously guessed letters</li>
    <li>For loop loops through each letter of mystery word. If any of the letters previously guessed matches a letter in the mystery word, that letter is added to a string containing the revealed portion of the word the user is able to sees</li>
    <li>If not, a space is placed so as to not reveal unguessed letters</li>
  </ul>
  
```swift
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
```
  <li>Determining if a game has ended:</li>
  <ul>
    <li>If the number of chances the user has left ('wrongGuessesRemaining') is 0, end the game as a fail (display wilted flower)</li>
    <li>Otherwise, if the revealed word no longer contains any empty spaces, end the game as a success (display winning message)</li>
    <li>In all other cases, the game is not over, so merely increment the guess count.</li>
  </ul>
  
```swift
if wrongGuessesRemaining == 0{
...
}else if !revealedWord.contains("_"){
...
}else{
...
}
```
  <li>When Play Again is pressed:</li>
  <ul>
    <li>Button gets hidden, guess button disabled, user guess input field enabled</li>
    <li>Flower image, guess count, chances left reset</li>
    <li>Repeat-While loop chooses a random word from array of predetermined words until the random word does not equal the last word that was guessed</li>
  </ul>

```swift
var wordsToGuess = ["GALLAUGHER", "XCODE", "SWIFT", "CODING", "IOS", "APPLE"]
var newWord:String
repeat{
    newWord = wordsToGuess.randomElement()!
}while newWord == wordToGuess
wordToGuess = newWord
```
</ul>
<h3>Word Garden is Responsive!</h3>
<p align = "center"><kbd><img src = "/images/responsive_ipad.png" height = "500"></kbd><kbd><img src = "/images/responsive_iphone_11.png" height = "500"></kbd><kbd><img src = "/images/responsive_iphone_se.png" height = "500"></kbd></p>
