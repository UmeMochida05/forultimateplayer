//
//  ListViewController.swift
//  forultimateplayer
//
//  Created by 持田ゆうり on 2023/05/28.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var titleOfMatchArray: [String] = []
    var dateOfMatchArray: [Date] = []
    var styleOfMatchArray: [String] = []
    
    
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.register(UINib(nibName: "ListViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        let userDefaults = UserDefaults.standard
        if let titleItem = userDefaults.array(forKey: "titleOfMatchArray") as? [String] {
            titleOfMatchArray = titleItem
        }
        if let dateItem = userDefaults.array(forKey: "dateOfMatchArray") as? [Date] {
            dateOfMatchArray = dateItem
        }
        if let styleItem = userDefaults.array(forKey: "styleOfMatchArray") as? [String] {
            styleOfMatchArray = styleItem
        }

        // Do any additional setup after loading the view.
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
        
        func addDate(title: String, date: Date, style: String) {
            titleOfMatchArray.append(title)
            dateOfMatchArray.append(date)
            styleOfMatchArray.append(style)
            tableView.reloadData()
            tableView.reloadData()
        
           
        
        
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
