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
    
    var whichsArray: [[String]] = []
    var assistsArray: [[String]] = []
    var goalsArray: [[String]] = []
    var timesArray: [[String]] = []
    var howScoresArray: [[String]] = []
    
    var whichArray: [String] = []
    var assistArray: [String] = []
    var goalArray: [String] = []
    var timeArray: [String] = []
    var howScoreArray: [String] = []
    
    var selectedCellIndex: Int!
    
    var userdefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        let userdefaults = UserDefaults.standard
        if let whichItem = userdefaults.array(forKey: "whichsArray") as? [[String]] {
            whichsArray = whichItem
            whichArray = whichsArray[selectedCellIndex]
        }
        if let assistItem = userdefaults.array(forKey: "assistsArray") as? [[String]] {
            assistsArray = assistItem
            assistArray = assistsArray[selectedCellIndex]
        }
        if let goalItem = userdefaults.array(forKey: "goalsArray") as? [[String]] {
            goalsArray = goalItem
            goalArray = goalsArray[selectedCellIndex]
        }
        if let timeItem = userdefaults.array(forKey: "timesArray") as? [[String]] {
            timesArray = timeItem
            timeArray = timesArray[selectedCellIndex]
            print(timeItem)
        }
        if let howScoreItem = userdefaults.array(forKey: "howScoresArray") as? [[String]] {
            howScoresArray = howScoreItem
            howScoreArray = howScoresArray[selectedCellIndex]
            print(howScoresArray)
        } else {
            
        }
        
        // Do any additional setup after loading the view.
    }
    

    
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let whichContent = whichTextField.text, !whichContent.isEmpty else {
            return
        }
        
        guard let timeContent = timeTextField.text, !timeContent.isEmpty else {
            return
        }
        
        whichArray.append(whichContent)
        assistArray.append(assistTextField.text ?? "")
        goalArray.append(goalTextField.text ?? "")
        timeArray.append(timeContent)
        howScoreArray.append(howScoreTextField.text ?? "")
        
        //contentArrayを2重のcontentsArrayにも追加。(置き換え。)
        whichsArray[selectedCellIndex] = whichArray
        assistsArray[selectedCellIndex] = assistArray
        goalsArray[selectedCellIndex] = goalArray
        timesArray[selectedCellIndex] = timeArray
        howScoresArray[selectedCellIndex] = howScoreArray
        
        userdefaults.set(whichsArray, forKey: "whichsArray")
        userdefaults.set(assistsArray, forKey: "assistsArray")
        userdefaults.set(goalsArray, forKey: "goalsArray")
        userdefaults.set(timesArray, forKey: "timesArray")
        userdefaults.set(howScoresArray, forKey: "howScoresArray")
    
        self.navigationController?.popViewController(animated: true)
        
        whichItem = whichTextField.text
        assistItem = assistTextField.text
        goalItem = goalTextField.text
        timeItem = timeTextField.text
        howScoreItem = howScoreTextField.text
        
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


