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

        let userDefaults = UserDefaults.standard
        if let whichItem = userDefaults.array(forKey: "whichsArray") as? [[String]] {
            whichsArray = whichItem
        }
        if let assistItem = userDefaults.array(forKey: "assistsArray") as? [[String]] {
            assistsArray = assistItem
        }
        if let goalItem = userDefaults.array(forKey: "goalsArray") as? [[String]] {
            goalsArray = goalItem
        }
        if let timeItem = userDefaults.array(forKey: "timesArray") as? [[String]] {
            timesArray = timeItem
            print(timeItem)
        }
        if let howScoreItem = userDefaults.array(forKey: "howScoresArray") as? [[String]] {
            howScoresArray = howScoreItem
            print(howScoresArray)
        } else {
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        whichArray = whichsArray[selectedCellIndex]
        assistArray = assistsArray[selectedCellIndex]
        goalArray = goalsArray[selectedCellIndex]
        timeArray = timesArray[selectedCellIndex]
        howScoreArray = howScoresArray[selectedCellIndex]
        
        tableView.reloadData()
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

        
        self.navigationController?.popViewController(animated: true)
        
        whichItem = whichTextField.text
        assistItem = assistTextField.text
        goalItem = goalTextField.text
        timeItem = timeTextField.text
        howScoreItem = howScoreTextField.text
    
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


