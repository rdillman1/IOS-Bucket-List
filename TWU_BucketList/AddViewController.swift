//
//  AddViewController.swift
//  TWU_BucketList
//
//  Created by GentryD on 3/7/21.
//

import UIKit


class AddViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var fieldTitle: UITextField!
   @IBOutlet var fieldLatitude: UITextField!
    @IBOutlet var fieldLongitude: UITextField!
    @IBOutlet var fieldDescription: UITextField!
    var update: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fieldTitle.delegate = self
      fieldLatitude.delegate = self
        fieldLongitude.delegate = self
        fieldDescription.delegate = self

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveItem))
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveItem()
        return true
    }
    @objc func saveItem(){
        
        guard let titletext = fieldTitle.text, !titletext.isEmpty else{
            return
        }
        guard let latitudetext = fieldLatitude.text, !latitudetext.isEmpty else{
            return
        }
        guard let longitudetext = fieldLongitude.text, !longitudetext.isEmpty else{
            return
        }
        guard let descriptiontext = fieldDescription.text, !descriptiontext.isEmpty else{
            return
        }
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else{
            return
        }
        
        
        let newCount = count+1
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(titletext, forKey: "item_\(newCount)")
        UserDefaults().set(latitudetext, forKey: "latitude_\(newCount)")
        UserDefaults().set(longitudetext, forKey: "longitude_\(newCount)")
        UserDefaults().set(descriptiontext, forKey: "description_\(newCount)")
        update?()
        
        navigationController?.popViewController(animated: true)
    }

}
