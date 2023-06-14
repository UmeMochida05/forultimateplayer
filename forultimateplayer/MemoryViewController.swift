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
    
    var doubleArray: [[String]] = []
    
    var whichsArray: [[String]] = []
    var assistsArray: [[String]] = []
    var goalsArray: [[String]] = []
    var timesArray: [[String]] = []
    var howScoresArray: [[String]] = []
    
    var selectedCellIndex: Int!
    
    
    
    var userdefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        if userdefaults.object(forKey: "content") as? Array<Any> != nil {
            
            
        }
        
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
        
        
        var userdefaults = UserDefaults.standard
        
            var whichsArray = UserDefaults.standard.array(forKey: "whichsArray")as? [[String]] ?? []
            whichsArray.append([whichItem])
            UserDefaults.standard.set(whichsArray, forKey: "whichsArray")
            
            var assistsArray = UserDefaults.standard.array(forKey: "assistsArray")as? [[String]] ?? []
            assistsArray.append([assistItem])
            UserDefaults.standard.set(assistsArray, forKey: "assistsArray")
            
            var goalsArray = UserDefaults.standard.array(forKey: "goalsArray")as? [[String]] ?? []
            goalsArray.append([goalItem])
            UserDefaults.standard.set(goalsArray, forKey: "goalsArray")
        
            var timesArray = UserDefaults.standard.array(forKey: "timesArray")as? [[String]] ?? []
        timesArray.append([timeItem])
        UserDefaults.standard.set(timesArray, forKey: "timesArray")
        
        var howScoresArray = UserDefaults.standard.array(forKey: "howScoresArray")as? [[String]] ?? []
        howScoresArray.append([howScoreItem])
        UserDefaults.standard.set(howScoresArray, forKey: "howScoresArray")
        
        
        
        self .performSegue(withIdentifier: "toResult", sender: nil)
        
        whichTextField.text = ""
        assistTextField.text = ""
        goalTextField.text = ""
        timeTextField.text = ""
        howScoreTextField.text = ""
        
        
        self.dismiss(animated: true)
        
            
           
        
            
            
       
            
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


