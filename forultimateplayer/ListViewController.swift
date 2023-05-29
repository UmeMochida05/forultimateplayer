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
    @IBOutlet var addButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.register(UINib(nibName: "ListViewCell", bundle: nil), forCellReuseIdentifier: "customCell")

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleOfMatchArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! ListViewCell
        cell.img.image = UIImage(systemName: "Slice 2")
        cell.datelabel.text = "date"
        cell.titlelabel.text = "text"
        
        cell.titlelabel.text = titleOfMatchArray[indexPath.row]
        cell.stylelabel.text = styleOfMatchArray[indexPath.row]
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        let dateString = dateFormatter.string(from: dateOfMatchArray[indexPath.row])
        cell.datelabel.text = dateString
        
        
        
        return cell
        
        
        }
        
        func addDate(title: String, date: Date, style: String) {
            titleOfMatchArray.append(titlelabel)
            dateOfMatchArray.append(datelabel)
            styleOfMatchArray.append(stylelabel)
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
