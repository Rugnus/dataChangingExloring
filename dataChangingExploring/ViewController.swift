//
//  ViewController.swift
//  dataChangingExploring
//
//  Created by Sungur on 20.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mySwith: UISwitch!
    
    let userDefaults = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        
        
        
        // Do any additional setup after loading the view.
    }
        
    @IBAction func switchDidChange(_ sender: UISwitch) {
        userDefaults.set(sender.isOn, forKey: "switchChanged")
        
        if sender.isOn {
            view.backgroundColor = .darkGray
            userDefaults.set("photo2", forKey: "secondPhoto")
            let changedPhoto = userDefaults.string(forKey: "secondPhoto")
            imageView.image = UIImage(named: changedPhoto!)
        } else {
            view.backgroundColor = .lightGray
            userDefaults.set("photo1", forKey: "firstPhoto")
            let changedPhoto = userDefaults.string(forKey: "firstPhoto")
            imageView.image = UIImage(named: changedPhoto!)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        mySwith.isOn = userDefaults.bool(forKey: "switchChanged")
        
        if mySwith.isOn {
            view.backgroundColor = .darkGray
            imageView.image = UIImage(named: "photo2")
        } else {
            view.backgroundColor = .lightGray
            imageView.image = UIImage(named: "photo1")
        }
    }
    
    
}

