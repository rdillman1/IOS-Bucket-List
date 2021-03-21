//
//  AlterViewController.swift
//  TWU_BucketList
//
//  Created by GentryD on 3/7/21.
//

import UIKit

class AlterViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet var labelTest: UILabel!
    @IBOutlet var labelTitle: UITextField!
    @IBOutlet var labelLatitude: UITextField!
    @IBOutlet var labelLongitude: UITextField!
    @IBOutlet var labelDiscription: UITextField!
    var update: (() -> Void)?
    
    var currentPosition = 0
    var item: String?
    var latitude: String?
    var longitude: String?
    var desc: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTest.text = "\(currentPosition)"
        labelTitle.text = item
        labelLatitude.text = latitude
        labelLongitude.text = longitude
        labelDiscription.text = desc
        labelTitle.delegate = self
      labelLatitude.delegate = self
        labelLongitude.delegate = self
        labelDiscription.delegate = self

       let delete =  UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(didDelete))
        delete.tintColor = UIColor.red
        navigationItem.rightBarButtonItem = delete
        
    
    }
    @objc func didDelete() {
        let deleteAlert = UIAlertController(title: "Delete", message: "All data will be lost.", preferredStyle: UIAlertController.Style.alert)

        deleteAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
            func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                return true
            }
            self.deleteConfirm()
          }))

        deleteAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
         
          }))

        
        present(deleteAlert, animated: true, completion: nil)
    }
        
        
        @objc func deleteConfirm(){
        guard let count = UserDefaults().value(forKey: "count") as? Int else{
            return
        }
      
        let newCount = count - 1
    UserDefaults().setValue(newCount, forKey: "count")
       UserDefaults().setValue(nil, forKey: "item\(currentPosition)")
        UserDefaults().setValue(nil, forKey: "latitude\(currentPosition)")
        UserDefaults().setValue(nil, forKey: "longitude\(currentPosition)")
        UserDefaults().setValue(nil, forKey: "description\(currentPosition)")
        update?()
        navigationController?.popViewController(animated: true)
        
   }
    
    @IBAction func didComplete() {
        guard let completed = UserDefaults().value(forKey: "count") as? Int else{
            return
        }
        let newCompleted = completed + 1
        UserDefaults().setValue(newCompleted, forKeyPath: "Completed")
        let deleteAlert = UIAlertController(title: "Completed", message: "Congrats you have completed another task! That's \(newCompleted) total!", preferredStyle: UIAlertController.Style.alert)

        deleteAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
            func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                return true
            }
            self.deleteConfirm()
            
          }))
        present(deleteAlert, animated: true, completion: nil)
        
        
        
        }
    
    @IBAction func didEdit() {
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            return true
        }
        self.editConfirm()
    }
    
    @objc func editConfirm(){
        guard let count = UserDefaults().value(forKey: "count") as? Int else{
            return
        }
        
        
        guard let titletext = labelTitle.text, !titletext.isEmpty else{
            return
        }
        guard let latitudetext = labelLatitude.text, !latitudetext.isEmpty else{
            return
        }
        guard let longitudetext = labelLongitude.text, !longitudetext.isEmpty else{
            return
        }
        guard let descriptiontext = labelDiscription.text, !descriptiontext.isEmpty else{
            return
        }
       UserDefaults().setValue(nil, forKey: "item\(currentPosition)")
        UserDefaults().setValue(nil, forKey: "latitude\(currentPosition)")
        UserDefaults().setValue(nil, forKey: "longitude\(currentPosition)")
        UserDefaults().setValue(nil, forKey: "description\(currentPosition)")
      let newCount = count+1
        UserDefaults().set(titletext, forKey: "item_\(newCount)")
        UserDefaults().set(latitudetext, forKey: "latitude_\(newCount)")
        UserDefaults().set(longitudetext, forKey: "longitude_\(newCount)")
        UserDefaults().set(descriptiontext, forKey: "description_\(newCount)")
         update?()
        navigationController?.popViewController(animated: true)
    }
        
        
    }
    


