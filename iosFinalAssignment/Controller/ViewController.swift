////
////  ViewController.swift
////  iosFinalAssignment
////
////  Created by TENZIN TSELHA on 10/21/21.
////

import UIKit
class ViewController: UIViewController, UITextFieldDelegate {
    static var shared = ViewController()
    var textInput : String = ""
    @IBOutlet weak var itemField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        itemField.delegate = self
        itemField.text = ""
        print("1 app started")
        }
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        print("2. after search button pressed")
        itemField.endEditing(true)
        performSegue(withIdentifier: "segue1", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1",
           let ViewControllerForTable = segue.destination as? ViewControllerForTable {
            if itemField.text != nil {
                textInput = itemField.text!
                print("3. text saved and sent to ViewControllerForTable")
                ViewControllerForTable.stringReceived = textInput
            }
        }
    }
}
    
    
    
    



    



    


