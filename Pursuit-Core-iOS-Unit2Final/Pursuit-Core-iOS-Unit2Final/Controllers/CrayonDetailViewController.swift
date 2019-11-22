//
//  CrayonDetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Matthew Ramos on 11/22/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CrayonDetailViewController: UIViewController {

    @IBOutlet weak var crayonName: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var detailView: UIView!

    
    var crayon: Crayon?
    var colorValues = [0.0, 0.0, 0.0, 0.0] {
    didSet {
    detailView.backgroundColor = UIColor(displayP3Red: CGFloat(colorValues[0] / 255), green: CGFloat(colorValues[1] / 255), blue: CGFloat(colorValues[2] / 255), alpha: CGFloat(colorValues[3]))
    }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        configureStepper()
        colorValues = [crayon?.red ?? 0.0, crayon?.green ?? 0.0, crayon?.blue ?? 0.0, 1.0]
        print(colorValues)
        configureRedSlider()
        configureGreenSlider()
        configureBlueSlider()
    }
    
    func configureStepper() {
        alphaStepper.minimumValue = 0.0
        alphaStepper.maximumValue = 1.0
        alphaStepper.value = 1.0
        alphaStepper.stepValue = 0.1
        alphaLabel.text = String(alphaStepper.value)
    }
    
    func configureRedSlider() {
        redSlider.minimumValue = 0
        redSlider.maximumValue = 255
        redSlider.value = Float(colorValues[0])
        redLabel.text = String(format: "%1.f", redSlider.value)
    }
    
    func configureGreenSlider() {
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 255
        greenSlider.value = Float(colorValues[1])
        greenLabel.text = String(format: "%1.f", greenSlider.value)
        
    }
    
    func configureBlueSlider() {
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 255
        blueSlider.value = Float(colorValues[2])
        blueLabel.text = String(format: "%1.f", blueSlider.value)
    }
    
    func updateUI () {
        guard let myCrayon = crayon else {
            fatalError("Crayon not define, check prepare segue")
        }
        detailView.backgroundColor = myCrayon.colorMaker()
        crayonName.text = myCrayon.name
        alphaLabel.text = "1.0"
        
    }
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        redLabel.text = String(format: "%1.f", sender.value)
        colorValues[0] = Double(sender.value)
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        greenLabel.text = String(format: "%1.f", sender.value)
        colorValues[1] = Double(sender.value)
    }
    
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        blueLabel.text = String(format: "%1.f", sender.value)
        colorValues[2] = Double(sender.value)
    }
    
    

    @IBAction func stepperPressed(_ sender: UIStepper) {
        alphaLabel.text = String(format: "%.1f", alphaStepper.value)
        colorValues[3] = alphaStepper.value
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        colorValues = [crayon?.red ?? 0.0, crayon?.green ?? 0.0, crayon?.blue ?? 0.0, 1.0]
        configureRedSlider()
        configureBlueSlider()
        configureGreenSlider()
        configureStepper()
    }
    

}
