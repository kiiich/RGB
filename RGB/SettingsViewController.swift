//
//  SettingsViewController.swift
//  RGB
//
//  Created by Николай on 05.09.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var currentColorView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var currentColor: UIColor!
    var delegate: ColorSetterDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initColor()
        setColorValueLabels()
        setupUI()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        setCurrentColor()
        setColorValueLabels()
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        delegate.setColor(color: currentColorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    private func initColor() {
        currentColorView.backgroundColor = currentColor
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0

        let isConverted = currentColor.getRed(
            &red,
            green: &green,
            blue: &blue,
            alpha: nil)
        
        if !isConverted {
            return
        }
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
    }
    
    private func setCurrentColor() {
        currentColorView.backgroundColor = UIColor(
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
        currentColorView.layer.cornerRadius = 15
    }
    
    private func formattedString(_ value: Float) -> String {
        String(format: "%.2f", value)
    }

}
