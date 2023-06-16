//
//  ResultViewController.swift
//  forultimateplayer
//
//  Created by 持田ゆうり on 2023/05/28.
//

import UIKit

class ResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    var whichsArray: [[String]] = [[]]
    var assistsArray: [[String]] = [[]]
    var goalsArray: [[String]] = [[]]
    var timesArray: [[String]] = [[]]
    var howScoresArray: [[String]] = [[]]
    
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
            whichArray = whichsArray[selectedCellIndex]
            print(whichArray,whichsArray)
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
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.register(UINib(nibName: "ResultViewCell", bundle: nil), forCellReuseIdentifier: "customCell2")
        
        
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
            print(timeItem)
            timeArray = timesArray[selectedCellIndex]
        }
        if let howScoreItem = userdefaults.array(forKey: "howScoresArray") as? [[String]] {
            howScoresArray = howScoreItem
            print(howScoresArray)
            howScoreArray = howScoresArray[selectedCellIndex]
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
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(whichArray.count)
        return whichArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell2", for: indexPath) as! ResultViewCell
    
        cell.whichlabel.text = whichArray[indexPath.row]
        cell.assistlabel.text = assistArray[indexPath.row]
        cell.goallabel.text = goalArray[indexPath.row]
        cell.timelabel.text = timeArray[indexPath.row]
        cell.howScorelabel.text = howScoreArray[indexPath.row]
        
        print(whichArray)
        print(assistArray)
        print(goalArray)
        print(timeArray)
        print(howScoreArray)
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCellIndex = indexPath.row
    }
    
    
}



