//
//  InfoViewController.swift
//  forultimateplayer
//
//  Created by 持田ゆうり on 2023/06/07.
//

import UIKit

class InfoViewController: UIViewController {
    
    var whichArray: [String] = []
    var assistArray: [String] = []
    var goalArray: [String] = []
    var timeArray: [String] = []
    var howScoreArray: [String] = []
    
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.register(UINib(nibName: "ResultViewCell", bundle: nil), forCellReuseIdentifier: "customCell2")
        
        let userDefaults = UserDefaults.standard
        if let whichItem = userDefaults.array(forKey: "whichArray") as? [String] {
            whichArray = whichItem
        }
        if let assistItem = userDefaults.array(forKey: "assistArray") as? [String] {
            assistArray = assistItem
        }
        if let goalItem = userDefaults.array(forKey: "goalArray") as? [String] {
            goalArray = goalItem
        }
        if let timeItem = userDefaults.array(forKey: "timeArray") as? [String] {
            timeArray = timeItem
            print(timeItem)
        }
        if let howScoreItem = userDefaults.array(forKey: "howScoreArray") as? [String] {
            howScoreArray = howScoreItem
            print(howScoreArray)
        } else {
            
        }
        // Do any additional setup after loading the view.
    }
    
    
   
    
    
    
        
        
    }
    
    
        // Do any additional setup after loading the view.
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

extension InfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return whichArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell3", for: indexPath) as! ResultViewCell
        
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
    
    
}



