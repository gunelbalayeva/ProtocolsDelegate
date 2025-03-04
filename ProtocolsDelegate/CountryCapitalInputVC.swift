//
//  CountryCapitalInputVC.swift
//  ProtocolsDelegate
//
//  Created by User on 04.03.25.
//

import UIKit
protocol CountryCapitalInputDelegate :AnyObject{
    
    func saveCapital(name:String, index :Int)
    
}

class CountryCapitalInputVC : UIViewController {
    
    var cntryName:String? = nil
    var countryIndex:Int? = nil
    var delegate:CountryCapitalInputDelegate?
    
    @IBOutlet weak var cnNameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var clickButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        clickButton.layer.cornerRadius = 16
        cnNameLabel.text = cntryName
    }
    
    
    @IBAction func didTapSave() {
            guard let index = countryIndex else { return }
                       delegate?.saveCapital(name: textField.text ?? "", index: index)
                       self.dismiss(animated: true)
        
    }
    

    
}










