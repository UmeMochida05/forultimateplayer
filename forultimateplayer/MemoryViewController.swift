//
//  MemoryViewController.swift
//  forultimateplayer
//
//  Created by 持田ゆうり on 2023/05/28.
//

import UIKit

class MemoryViewController: UIViewController {
    
    @IBOutlet weak var whichTextField: UITextField!
    @IBOutlet weak var assistTextField: UITextField!
    @IBOutlet weak var goalTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var howScoreTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var whichItem: String!
    var assistItem: String!
    var goalItem: String!
    var timeItem: String!
    var howScoreItem: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let content = whichTextField.text, !content.isEmpty else {
            return
        }
        
        guard let content = timeTextField.text, !content.isEmpty else {
            return
        }
        
        whichItem = whichTextField.text
        assistItem = assistTextField.text
        goalItem = goalTextField.text
        timeItem = timeTextField.text
        howScoreItem = howScoreTextField.text
        
        
        var userDefaults = UserDefaults.standard
        
            var whichArray = UserDefaults.standard.array(forKey: "whichArray")as? [String] ?? []
            whichArray.append(whichItem)
            UserDefaults.standard.set(whichArray, forKey: "whichArray")
            
            var assistArray = UserDefaults.standard.array(forKey: "assistArray")as? [String] ?? []
            assistArray.append(assistItem)
            UserDefaults.standard.set(assistArray, forKey: "assistArray")
            
            var goalArray = UserDefaults.standard.array(forKey: "goalArray")as? [String] ?? []
            goalArray.append(goalItem)
            UserDefaults.standard.set(goalArray, forKey: "goalArray")
        
            var timeArray = UserDefaults.standard.array(forKey: "timeArray")as? [String] ?? []
        timeArray.append(timeItem)
        UserDefaults.standard.set(timeArray, forKey: "timeArray")
        
        var howScoreArray = UserDefaults.standard.array(forKey: "howScoreArray")as? [String] ?? []
        howScoreArray.append(howScoreItem)
        UserDefaults.standard.set(howScoreArray, forKey: "howScoreArray")
        
        
        self .performSegue(withIdentifier: "toResult", sender: nil)
        
        whichTextField.text = ""
        assistTextField.text = ""
        goalTextField.text = ""
        timeTextField.text = ""
        howScoreTextField.text = ""
            
           
        
            
            
       
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


