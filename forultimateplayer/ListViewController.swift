//
//  ListViewController.swift
//  forultimateplayer
//
//  Created by 持田ゆうり on 2023/05/28.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var titleOfMatchArray: Array<String>!
    var dateOfMatchArray: Array<Date>!
    var styleOfMatchArray: Array<String>!
    var resultVC: UIViewController!
    
    
    let userdefaults = UserDefaults.standard
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var addButton: UIButton!
    
    @IBAction func toListVC(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func toFinish(segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.register(UINib(nibName: "ListViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
       
        if let titleItem = userdefaults.array(forKey: "titleOfMatchArray") as? Array<String> {
            titleOfMatchArray = titleItem
        }
        if let dateItem = userdefaults.array(forKey: "dateOfMatchArray") as? Array<Date> {
            dateOfMatchArray = dateItem
        }
        if let styleItem = userdefaults.array(forKey: "styleOfMatchArray") as? Array<String> {
            styleOfMatchArray = styleItem
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonTap() {
        self.performSegue(withIdentifier: "toContentVC", sender: self)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        
        if userdefaults.object(forKey: "titleItem") as? Array<String> == nil {
            titleOfMatchArray = []
        } else {
            titleOfMatchArray = userdefaults.object(forKey: "titleItem") as? Array<String>
        }
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
        guard let resultVC = storyboard?.instantiateViewController(identifier: "ResultViewController") as? ResultViewController else {
            return
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
    
    

