//
//  ResultViewController.swift
//  forultimateplayer
//
//  Created by 持田ゆうり on 2023/05/28.
//

import UIKit

class ResultViewController: UIViewController {
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
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.register(UINib(nibName: "ResultViewCell", bundle: nil), forCellReuseIdentifier: "customCell2")
        
        if let whichItem = userdefaults.array(forKey: "whichsArray") as? [[String]] {
            whichsArray = whichItem
        }
        if let assistItem = userdefaults.array(forKey: "assistsArray") as? [[String]] {
            assistsArray = assistItem
        }
        if let goalItem = userdefaults.array(forKey: "goalsArray") as? [[String]] {
            goalsArray = goalItem
        }
        if let timeItem = userdefaults.array(forKey: "timesArray") as? [[String]] {
            timesArray = timeItem
            print(timeItem)
        }
        if let howScoreItem = userdefaults.array(forKey: "howScoresArray") as? [[String]] {
            howScoresArray = howScoreItem
            print(howScoresArray)
        } else {
            
        }
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.register(UINib(nibName: "ResultViewCell", bundle: nil), forCellReuseIdentifier: "customCell2")
        
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
       
        tableView.reloadData()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "MemoryViewController") as! MemoryViewController
        //performSegue(withIdentifier: "toMemoryVC", sender: nil)
        nextVC.selectedCellIndex = selectedCellIndex
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMemoryVC" {
            let destinationVC = segue.destination as! MemoryViewController
            destinationVC.selectedCellIndex = selectedCellIndex
            
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
    
}
    
    
    extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return whichsArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell2", for: indexPath) as! ResultViewCell
            
            selectedCellIndex = indexPath.row
            
            let whichArray = whichsArray[selectedCellIndex]
            let assistArray = assistsArray[selectedCellIndex]
            let goalArray = goalsArray[selectedCellIndex]
            let timeArray = timesArray[selectedCellIndex]
            let howScoreArray = howScoresArray[selectedCellIndex]
            
            cell.whichlabel.text = whichArray.joined(separator: ",")
            cell.assistlabel.text = assistArray.joined(separator: ",")
            cell.goallabel.text = goalArray.joined(separator: ",")
            cell.timelabel.text = timeArray.joined(separator: ",")
            cell.howScorelabel.text = howScoreArray.joined(separator: ",")
            
            print(whichArray)
            print(assistArray)
            print(goalArray)
            print(timeArray)
            print(howScoreArray)
            
            
            
            return cell
        }
        
        
       // @IBAction func Back(_ sender: Any) {
            //self.dismiss(animated: true)
        //}
        
    }
    
    

