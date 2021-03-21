//
//  ViewController.swift
//  TWU_BucketList
//
//  Created by GentryD on 3/7/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView:UITableView!
    
    var items = [String]()
    var descriptions = [String]()
    var latitudes = [String]()
    var longitudes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    updateTasks()
        //setup
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().setValue(true, forKey: "setup")
            UserDefaults().setValue(0, forKey: "count")
            UserDefaults().setValue(0, forKey: "completed")
            
           // self.navigationItem.rightBarButtonItem = self.editButtonItem
            tableView.isEditing = true
        }
        
        
        // Get all current saved tasks
        
        
    }
    
    func updateTasks(){
        
        tableView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
        
       

        items.removeAll()
        latitudes.removeAll()
        longitudes.removeAll()
        descriptions.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        for x in 0..<count {
            if let item = UserDefaults().value(forKey: "item_\(x+1)") as? String{
                items.append(item)}
            if let latitude = UserDefaults().value(forKey: "latitude_\(x+1)") as? String{
                latitudes.append(latitude)}
            if let longitude = UserDefaults().value(forKey: "longitude_\(x+1)") as? String{
                longitudes.append(longitude)}
            if let description = UserDefaults().value(forKey: "description_\(x+1)") as? String{
                descriptions.append(description)}
        }
        tableView.reloadData()
    }
    @IBAction func didAdd(){
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! AddViewController
        vc.title = "New Bucket Item"
        vc.update = {
            DispatchQueue.main.async{
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
        
        
        
}
   
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(identifier: "alter") as! AlterViewController
        vc.title = "Bucket List Item View"
        vc.item = items[indexPath.row]
        vc.latitude = latitudes[indexPath.row]
        vc.longitude = longitudes[indexPath.row]
        vc.desc = descriptions[indexPath.row]
        vc.currentPosition = indexPath.row
        vc.update = {
            DispatchQueue.main.async{
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
   /* func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCell.EditingStyle, forRowAtIndexPath indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
        items.remove(at: indexPath.row)
        latitudes.remove(at: indexPath.row)
        longitudes.remove(at: indexPath.row)
        descriptions.remove(at: indexPath.row)
     // Delete the row from the TableView
      //  tableView.deleteRows(at: indexPath.row, with: .fade)
     }
    }*/
    }

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
       // return latitudes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
    //
        item.textLabel?.text = items[indexPath.row]
        item.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        return item;
    }
    
    
}


