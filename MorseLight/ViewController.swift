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
    @IBOutlet weak var alphaNumTextField: UITextField!
    
    /*
     * The moseCodeLabel is OUTPUT that will display the morsecode text translated from alphanum after 'Translate!' (translateOnClick) is pressed
     */
    @IBOutlet weak var morseCodeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    } //START FUNCTIONALITY

    /*
     * This button when pressed translates English written in alphaNumTextField (INPUT) and outputs the corresponding Morse Code translation, moseCodeLabel (OUTPUT)
     */
    @IBAction func translateOnClick(_ sender: Any) { // connect button to UI

    } //translateOnClick(Any)
    
} //UIViewController

