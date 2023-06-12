//
//  ResultViewController.swift
//  forultimateplayer
//
//  Created by 持田ゆうり on 2023/05/28.
//

import UIKit

class ResultViewController: UIViewController {
    
    var doubleArray: [[String]] = []
    
    var whichArray: Array<String> = []
    var assistArray: Array<String> = []
    var goalArray: Array<String> = []
    var timeArray: Array<String> = []
    var howScoreArray: Array<String> = []
    
    var selectedCellIndex: Int!
    var contentsArray: Array<Array<String>>!
    var contentArray: Array<String>!
    
    var userdefaults = UserDefaults.standard

    
    var num: [Int] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.register(UINib(nibName: "ResultViewCell", bundle: nil), forCellReuseIdentifier: "customCell2")
        
        let userDefaults = UserDefaults.standard
        if let whichItem = userDefaults.array(forKey: "whichArray") as? Array<String> {
            whichArray = whichItem
        }
        if let assistItem = userDefaults.array(forKey: "assistArray") as? Array<String> {
            assistArray = assistItem
        }
        if let goalItem = userDefaults.array(forKey: "goalArray") as? Array<String> {
            goalArray = goalItem
        }
        if let timeItem = userDefaults.array(forKey: "timeArray") as? Array<String> {
            timeArray = timeItem
            print(timeItem)
        }
        if let howScoreItem = userDefaults.array(forKey: "howScoreArray") as? Array<String> {
            howScoreArray = howScoreItem
            print(howScoreArray)
        } else {
            
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if userdefaults.object(forKey: "content") as? Array<Any> != nil {
            contentsArray = userdefaults.object(forKey: "content") as? Array<Array<String>>
            
            print(contentsArray)
        } else {
            contentsArray[selectedCellIndex] = contentArray
            userdefaults.set(contentsArray, forKey: "content")
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
    
    


extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell2", for: indexPath) as! ResultViewCell
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        cell.whichlabel.text = whichArray[indexPath.row]
        cell.assistlabel.text = assistArray[indexPath.row]
        cell.goallabel.text = goalArray[indexPath.row]
        cell.timelabel.text = timeArray[indexPath.row]
        cell.howscorelabel.text = howScoreArray[indexPath.row]
        
        
        print("Which: \(whichArray[indexPath.row])")
        print("Assist: \(assistArray[indexPath.row])")
        print("Goal: \(goalArray[indexPath.row])")
        print("Time: \(timeArray[indexPath.row])")
        print("HowScore: \(howScoreArray[indexPath.row])")
        
        return cell
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "toMemoryVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMemoryVC" {
            let destinationVC = segue.destination as! MemoryViewController
            
            
            destinationVC.selectedCellIndex = selectedCellIndex
            
        }
    }
    
    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}


