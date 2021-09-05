//
//  SettingsViewController.swift
//  RGB
//
//  Created by Николай on 05.09.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var currentColor: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCurrentColor()
        setColorValueLabels()
        setupUI()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        setCurrentColor()
        setColorValueLabels()
    }
    
    private func setCurrentColor() {
        currentColor.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setColorValueLabels() {
        redValueLabel.text = formattedString(redSlider.value)
        greenValueLabel.text = formattedString(greenSlider.value)
        blueValueLabel.text = formattedString(blueSlider.value)
    }
    
    private func setupUI() {
        currentColor.layer.cornerRadius = 15
    }
    
    private func formattedString(_ value: Float) -> String {
        String(format: "%.2f", value)
    }

}
