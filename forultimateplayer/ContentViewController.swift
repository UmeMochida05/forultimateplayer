//
//  ContentViewController.swift
//  forultimateplayer
//
//  Created by 持田ゆうり on 2023/05/28.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    var dateItem: Date!
    var styleItem: String!
    
    
    func datePickerValueChanged(_ sender: UIDatePicker){
        dateItem = sender.date
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if let content = textField.text, !content.isEmpty {
            var titleOfMatchArray = UserDefaults.standard.array(forKey: "titleOfMatchArray")as? [String] ?? []
            titleOfMatchArray.append(content)
            UserDefaults.standard.set(titleOfMatchArray, forKey: "titleOfMatchArray")
            
            var dateOfMatchArray = UserDefaults.standard.array(forKey: "dateOfMatchArray")as? [Date] ?? []
            dateOfMatchArray.append(dateItem)
            UserDefaults.standard.set(dateOfMatchArray, forKey: "dateOfMatchArray")
            
            var styleOfMatchArray = UserDefaults.standard.array(forKey: "styleOfMatchArray")as? [String] ?? []
            styleOfMatchArray.append(styleItem)
            UserDefaults.standard.set(styleOfMatchArray, forKey: "styleOfMatchArray")
            
            textField.text = ""
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
