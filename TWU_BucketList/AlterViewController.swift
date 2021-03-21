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
    
    
    @IBAction func didEdit() {
        
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
        
        UserDefaults().set(titletext, forKey: "item\(currentPosition)")
        UserDefaults().set(latitudetext, forKey: "latitude\(currentPosition)")
        UserDefaults().set(longitudetext, forKey: "longitude\(currentPosition)")
         UserDefaults().set(descriptiontext, forKey: "description\(currentPosition)")
         update?()
         navigationController?.popViewController(animated: true)
        
        
        
    }
    

}
