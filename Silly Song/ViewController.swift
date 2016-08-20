//
//  ViewController.swift
//  Silly Song
//
//  Created by Cathy Oun on 8/16/16.
//  Copyright © 2016 cathyoun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        nameField.autocapitalizationType = .Words
        nameField.returnKeyType = .Done

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(sender: AnyObject) {
        nameField.text  = ""
        lyricsView.text = ""
    }
    @IBAction func displayLyrics(sender: AnyObject) {
        if let name = nameField.text {
            lyricsView.text = lyricsForName(bananaFanaTemplate, fullName: name)
            
        }
    }

}

func shortNameFromName(name: String) -> String {
    let lowercaseName = name.lowercaseString
    let vowelSet = NSCharacterSet(charactersInString: "aeiou")
    if let firstVowelRange = lowercaseName.rangeOfCharacterFromSet(vowelSet) {
        return lowercaseName.substringFromIndex(firstVowelRange.startIndex)
    }
    return lowercaseName
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joinWithSeparator("\n")

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameFromName(fullName)
    let result = lyricsTemplate
    let fullNameResult = result.stringByReplacingOccurrencesOfString("<FULL_NAME>", withString: fullName)
    let finalResult = fullNameResult.stringByReplacingOccurrencesOfString("<SHORT_NAME>", withString: shortName)
    
    return finalResult
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
