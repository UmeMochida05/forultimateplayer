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
    
    var titleOfMatchArray: Array<String>!
    var dateOfMatchArray: Array<Date>!
    var styleOfMatchArray: Array<String>!
    
    
    var dateItem: Date!
    var styleItem: String!
    var titleItem: String!
    var listNumber: Int = 0
    
    var userdefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if userdefaults.object(forKey: "titleItem") as? Array<String> == nil{
            titleOfMatchArray = []
        } else {
            titleOfMatchArray = userdefaults.object(forKey: "titleItem") as? Array<String>
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
        
        var userdefaults = UserDefaults.standard
        
        let contentArray: Array<String> = []
        var contentsArray: Array<Array<String>>!
        
        if userdefaults.object(forKey: "content") as? Array<Any> != nil {
            
            contentsArray = userdefaults.object(forKey: "content") as? Array<Array<String>>
            
            contentsArray.append(contentArray)
            
            userdefaults.set(contentsArray, forKey: "content")
            print(contentsArray)
            
        } else {
            contentsArray = [[]]
            userdefaults.set(contentsArray, forKey: "content")
            print(contentsArray)
        }
        
        
        
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


