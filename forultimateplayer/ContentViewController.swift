//
//  ContentViewController.swift
//  forultimateplayer
//
//  Created by 持田ゆうり on 2023/05/28.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UIDatePicker!
    @IBOutlet weak var styleTextField: UITextField!
    
    var titleOfMatchArray: [String]!
    var dateOfMatchArray: [Date]!
    var styleOfMatchArray: [String]!
    
    
    var dateItem: Date!
    var styleItem: String!
    var titleItem: String!
    var listNumber: Int = 0
    
    var userdefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if userdefaults.object(forKey: "titleItem") as? [String] == nil{
            titleOfMatchArray = []
        } else {
            titleOfMatchArray = userdefaults.object(forKey: "titleItem") as? [String]
        }
        
        dateTextField.datePickerMode = .date
        dateTextField.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
        
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveButton
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        dateItem = sender.date
        
        
    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
        guard let content = titleTextField.text, !content.isEmpty else {
            return
        }
        
        titleOfMatchArray.append(String(listNumber))
        
        userdefaults.set(titleOfMatchArray, forKey: "titleItem")
        
        titleItem = content
        dateItem = dateTextField.date
        styleItem = styleTextField.text
        
        
        
        var titleOfMatchArray = UserDefaults.standard.array(forKey: "titleOfMatchArray")as? Array<String> ?? []
        titleOfMatchArray.append(titleItem)
        UserDefaults.standard.set(titleOfMatchArray, forKey: "titleOfMatchArray")
        
        var dateOfMatchArray = UserDefaults.standard.array(forKey: "dateOfMatchArray")as? Array<Date> ?? []
        dateOfMatchArray.append(dateItem)
        UserDefaults.standard.set(dateOfMatchArray, forKey: "dateOfMatchArray")
        
        var styleOfMatchArray = UserDefaults.standard.array(forKey: "styleOfMatchArray")as? Array<String> ?? []
        styleOfMatchArray.append(styleItem)
        UserDefaults.standard.set(styleOfMatchArray, forKey: "styleOfMatchArray")
        
        titleTextField.text = ""
        styleTextField.text = ""
        
        //試合の数に合わせて試合情報を入れるから二重配列の中の配列を用意しておく
        
        var whichsArray: [[String]] = []
        var assistsArray: [[String]] = []
        var goalsArray: [[String]] = []
        var timesArray: [[String]] = []
        var howScoresArray: [[String]] = []
        
        if let whichItem = userdefaults.array(forKey: "whichsArray") as? [[String]] {
            whichsArray = whichItem
            whichsArray.append([])
            userdefaults.set(whichsArray, forKey: "whichsArray")
            print(whichsArray)
        }
        if let assistItem = userdefaults.array(forKey: "assistsArray") as? [[String]] {
            assistsArray = assistItem
            assistsArray.append([])
            userdefaults.set(assistsArray, forKey: "assistsArray")
            print(assistsArray)
        }
        if let goalItem = userdefaults.array(forKey: "goalsArray") as? [[String]] {
            goalsArray = goalItem
            goalsArray.append([])
            userdefaults.set(goalsArray, forKey: "goalsArray")
            print(goalsArray)
        }
        if let timeItem = userdefaults.array(forKey: "timesArray") as? [[String]] {
            timesArray = timeItem
            print(timeItem)
            timesArray.append([])
            userdefaults.set(timesArray, forKey: "timesArray")
            print(timesArray)
        }
        if let howScoreItem = userdefaults.array(forKey: "howScoresArray") as? [[String]] {
            howScoresArray = howScoreItem
            print(howScoresArray)
            howScoresArray.append([])
            userdefaults.set(howScoresArray, forKey: "howScoresArray")
            print(howScoresArray)
        } else {
            
        }
        
        
        
        
        
        
        
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


