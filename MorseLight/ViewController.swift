//
//  ViewController.swift
//  MorseLight
//
//  Created by Noah Carpenter on 4/4/20.
//  Copyright © 2020 Noah Carpenter. All rights reserved.
//

import UIKit

//CONNECT BUTTONS
class ViewController: UIViewController {

    /*
     * The alphaNumTextField is a INPUT that is used to type an alphanum statement. This should include all lowercase letters, all numbers, and the following symbols *add symbols from dictionary*.
     */
    @IBOutlet weak var alphaNumTextField: UITextView!
    
    /*
     * The moseCodeLabel is OUTPUT that will display the morsecode text translated from alphanum after 'Translate!' (translateOnClick) is pressed
     */
    @IBOutlet weak var morseCodeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    

    /*
     * This button when pressed translates English written in alphaNumTextField (INPUT) and outputs the corresponding Morse Code translation, moseCodeLabel (OUTPUT)
     */
    @IBAction func translateOnClick(_ sender: Any) { // connect button to UI
        /*
         * dictionary that translates from english to morse code
         */
        let alphaToMorseKey:[Character: String] = [
            "a": ".- ",
            "b": "-... ",
            "c": "-.-. ",
            "d": "-.. ",
            "e": ". ",
            "f": "..-. ",
            "g": "--. ",
            "h": ".... ",
            "i": ".. ",
            "j": ".--- ",
            "k": "-.- ",
            "l": ".-.. ",
            "m": "-- ",
            "n": "-. ",
            "o": "--- ",
            "p": ".--. ",
            "q": "--.- ",
            "r": ".-. ",
            "s": "... ",
            "t": "- ",
            "u": "..- ",
            "v": "...- ",
            "w": ".-- ",
            "x": "-..- ",
            "y": "-.-- ",
            "z": "--.. ",
            "0": "----- ",
            "1": ".---- ",
            "2": "..--- ",
            "3": "...-- ",
            "4": "....- ",
            "5": "..... ",
            "6": "-.... ",
            "7": "--... ",
            "8": "---.. ",
            "9": "----. ",
            ".": ".-.-.- ",
            ",": "--..-- ",
            "?": "..--.. ",
            "'": "-....-",
            "!": "-.-.-- ",
            "/": "-.--.- ",
            "(": "-.--. ",
            ")": "-.--.- ",
            ":": "---... ",
            ";": "-.-.-. ",
            "$": "...-..- ",
            " ": " "
        ]
        
        /*
         * this function turns a string into an array of characters, with each letter where it's corresponding letter in the string would be
         */
        func strToAlphaArr(input str: String) -> [Character] {
            var arr = [Character]()
            for char in str {
                arr.append(char)
            }
            return arr
        } //strToArray(String) -> [Character]
        let alphaArr = strToAlphaArr(input: alphaNumTextField.text!)
         
        /*
         * the alphaArrToMorseArr function takes the resulting array of the strToAlphaArr function and translates each individual character in the alpha array, and translates it to its corresponding morse code
         */
        func alphaArrToMorseArr(arr: [Character]) -> [String] {
            var morseArr = [String]()
            for char in arr {
                morseArr.append(alphaToMorseKey[char]!)
            } //for
            return morseArr
        } //alphaArrToMorseArr([Character]) -> Void
        let morseArr = alphaArrToMorseArr(arr: alphaArr)
        //print(morseArr)
         
        /*
         * the morseArrToMorseStr function takes an array of strings that are already in morse, and creates a String that is the appended items of the Morse String put together for the resulting string of morse 'characters'
         */
        func morseArrToMorseStr(arr: [String]) -> String {
            var morseStr = String()
            for morse in morseArr {
                morseStr.append(morse)
            } // for
            return morseStr
        } // morseArrToMorseStr([Str]) -> Void
        let morseStr = morseArrToMorseStr(arr: morseArr)
         
        /*
         * this function is experimental, and designed to work with the flashlight. the dashes in morse represent long bursts of light, and the dots will represent quick bursts of light to read in morse code. A pause between words works simply as a pause.
         */
        func morseLightflashes(morse: String) -> String {
            let morseStr = morse
            var flashStr = ""
            
            for char in morseStr {
                if char == "-" {
                    flashStr.append("long ")
                }
                else if char == "." {
                    flashStr.append("short ")
                }
                else if char == " " {
                    flashStr.append("pause ")
                }
            }
            return flashStr
        }
         
        /*
         * For the alphaStrToMorseStr function, we put together the process of turning the original string to an array of characters, turning the array of alpha characters to an array of morse Strings, then putting the morse Strings together to make a string of morse code, and returns the morse code
         */
        func alphaStrToMorseStr(alpha: String) -> (statement: String, morse: String, flashes: String) {
            let alphaStr = alpha
            let alphaArr = strToAlphaArr(input: alphaStr)
            let morseArr = alphaArrToMorseArr(arr: alphaArr)
            let morseStr = morseArrToMorseStr(arr: morseArr)
            let flashStr = morseLightflashes(morse: morseStr)
            return (alphaStr, morseStr, flashStr)
        } //alphaStrToMorseStr(String) -> String
        morseCodeLabel.text = morseStr

    } //translateOnClick(Any)
    
} //UIViewController

