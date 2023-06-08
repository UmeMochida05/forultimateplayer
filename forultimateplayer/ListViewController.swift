//
//  ListViewController.swift
//  forultimateplayer
//
//  Created by 持田ゆうり on 2023/05/28.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var titleOfMatchArray: Array<String> = []
    var dateOfMatchArray: Array<Date> = []
    var styleOfMatchArray: Array<String> = []
    
    var doubleArray: [[String]] = []
    
    var whichArray: Array<String> = []
    var assistArray: Array<String> = []
    var goalArray: Array<String> = []
    var timeArray: Array<String> = []
    var howScoreArray: Array<String> = []
    
    @IBAction func toList(segue: UIStoryboardSegue){
        
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.register(UINib(nibName: "ListViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        let userDefaults = UserDefaults.standard
        if let titleItem = userDefaults.array(forKey: "titleOfMatchArray") as? Array<String> {
            titleOfMatchArray = titleItem
        }
        if let dateItem = userDefaults.array(forKey: "dateOfMatchArray") as? Array<Date> {
            dateOfMatchArray = dateItem
        }
        if let styleItem = userDefaults.array(forKey: "styleOfMatchArray") as? Array<String> {
            styleOfMatchArray = styleItem
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleOfMatchArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! ListViewCell
        cell.img.image = UIImage(systemName: "Slice 2")
        cell.titlelabel.text = titleOfMatchArray[indexPath.row]
        cell.stylelabel.text = styleOfMatchArray[indexPath.row]
        
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        
        let dateString = dateFormatter.string(from: dateOfMatchArray[indexPath.row])
        cell.datelabel.text = dateString
        
        print("Title: \(titleOfMatchArray[indexPath.row])")
        print ("Style: \(styleOfMatchArray[indexPath.row])")
        print("Date: \(dateOfMatchArray[indexPath.row])")
        
        return cell
        
        
        
        
        }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let tappedIndex = indexPath.row
        
        if doubleArray.count > tappedIndex {
            
        
        let matchInfo = doubleArray[tappedIndex]
        
            if let resultVC = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController{
                
                resultVC.whichArray = [whichArray[indexPath.row]]
                resultVC.assistArray = [assistArray[indexPath.row]]
                resultVC.goalArray = [goalArray[indexPath.row]]
                resultVC.timeArray = [timeArray[indexPath.row]]
                resultVC.howScoreArray = [howScoreArray[indexPath.row]]
                
                navigationController?.pushViewController(resultVC, animated: true)
            }
        }
        else{
            print("Invalid index: \(tappedIndex)")
        }
        
        let whichInfo = whichArray[tappedIndex]
        let assistInfo = assistArray[tappedIndex]
        let goalInfo = goalArray[tappedIndex]
        let timeInfo = timeArray[tappedIndex]
        let howScoreInfo = howScoreArray[tappedIndex]
        
        let matchDate = [whichInfo, assistInfo, goalInfo, timeInfo, howScoreInfo]
        doubleArray.append(matchDate)
        
        print ("Tappd cell at index: \(tappedIndex)")
        print ("which: \(matchDate[0])")
        print("Assist: \(matchDate[1])")
        print("Goal: \(matchDate[2])")
        print("Time: \(matchDate[3])")
        print("HowScore: \(matchDate[4])")
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "toInfoVC", sender: nil)
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


