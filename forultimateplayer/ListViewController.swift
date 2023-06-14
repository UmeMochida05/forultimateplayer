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
    var resultVC: UIViewController!
    
    
    let userdefaults = UserDefaults.standard
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var addButton: UIButton!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.register(UINib(nibName: "ListViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
       
        if let titleItem = userdefaults.array(forKey: "titleOfMatchArray") as? [String] {
            titleOfMatchArray = titleItem
        }
        if let dateItem = userdefaults.array(forKey: "dateOfMatchArray") as? [Date] {
            dateOfMatchArray = dateItem
        }
        if let styleItem = userdefaults.array(forKey: "styleOfMatchArray") as? [String] {
            styleOfMatchArray = styleItem
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.register(UINib(nibName: "ListViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        if let titleItem = userdefaults.array(forKey: "titleOfMatchArray") as? [String] {
            titleOfMatchArray = titleItem
        }
        if let dateItem = userdefaults.array(forKey: "dateOfMatchArray") as? [Date] {
            dateOfMatchArray = dateItem
        }
        if let styleItem = userdefaults.array(forKey: "styleOfMatchArray") as? [String] {
            styleOfMatchArray = styleItem
        }
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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "ResultViewController") as! ResultViewController
        nextVC.selectedCellIndex = indexPath.row
        navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultVC" {
            if let indexPath = tableView.indexPathForSelectedRow {
                guard let destination = segue.destination as? ResultViewController else {
                    return
                }
                destination.selectedCellIndex = indexPath.row
                
            }
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
    
    

