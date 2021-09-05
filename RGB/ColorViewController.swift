//
//  ViewController.swift
//  RGB
//
//  Created by Николай on 05.09.2021.
//

import UIKit

protocol ColorSetterDelegate {
    func setColor(color: UIColor)
}

class ColorViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let settingsVC = segue.destination as? SettingsViewController else {
            return
        }
    
        settingsVC.currentColor = mainView.backgroundColor 
        settingsVC.delegate = self
    }
}

extension ColorViewController: ColorSetterDelegate {
    func setColor(color: UIColor) {
        mainView.backgroundColor = color
    }
}
