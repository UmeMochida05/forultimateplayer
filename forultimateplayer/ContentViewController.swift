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
    
    
    var dateItem: Date!
    var styleItem: String!
    var titleItem: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateTextField.datePickerMode = .date
        dateTextField.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveButton
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        dateItem = sender.date
        
        
    }
    
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let content = titleTextField.text, !content.isEmpty else {
            return
        }
        
        titleItem = content
        dateItem = dateTextField.date
        styleItem = styleTextField.text
        
        var userDefaults = UserDefaults.standard
        
        var titleOfMatchArray = UserDefaults.standard.array(forKey: "titleOfMatchArray")as? [String] ?? []
        titleOfMatchArray.append(titleItem)
        UserDefaults.standard.set(titleOfMatchArray, forKey: "titleOfMatchArray")
        
        var dateOfMatchArray = UserDefaults.standard.array(forKey: "dateOfMatchArray")as? [Date] ?? []
        dateOfMatchArray.append(dateItem)
        UserDefaults.standard.set(dateOfMatchArray, forKey: "dateOfMatchArray")
        
        var styleOfMatchArray = UserDefaults.standard.array(forKey: "styleOfMatchArray")as? [String] ?? []
        styleOfMatchArray.append(styleItem)
        UserDefaults.standard.set(styleOfMatchArray, forKey: "styleOfMatchArray")
        
        titleTextField.text = ""
        
        self.performSegue(withIdentifier: "toMemory", sender: self)
        
        
        
        
        
        
        
        
        
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


