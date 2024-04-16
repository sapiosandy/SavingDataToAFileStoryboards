//
//  ViewController.swift
//  SavingDataToAFileStoryboards
//
//  Created by Sandra Gomez on 4/16/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var createText: UITextView!
    @IBOutlet var displayText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createText.text = "Type your text here"
        displayText.text = ""
    }

    @IBAction func writeFile(_ sender: UIButton) {
        //creates a file
        let fm = FileManager.default
        //defines its location in the documents directory
        let urls = fm.urls(for:.documentDirectory, in: .userDomainMask)
        // gives the file an arbitrary name of file.txt
        let url = urls.last?.appendingPathComponent("file.txt")
        // tries to store the contents of the top text view into the file
        do {
            try createText.text.write(to:url!, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("File reading error")
        }
    }
    @IBAction func readFile(_ sender: UIButton) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.txt")
        // looks for a file named "file.txt" that is stored in the documents directory and then tries to retrieve the contents of that file into the bottom text view.
        do {
            let fileContent = try String(contentsOf:url!, encoding: String.Encoding.utf8)
            displayText.text = fileContent
        } catch {
            print("File reading error")
        }
    }
    
}

