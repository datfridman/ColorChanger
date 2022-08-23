//
//  ViewController.swift
//  ColorChanger
//
//  Created by Leon Fridman on 8/5/22.
//

import UIKit

class ColorChangerViewController: UIViewController {
    
    @IBOutlet var colorViewWindow: UIView!
    
    @IBOutlet var redCounterLabel: UILabel!
    @IBOutlet var greenCounterLabel: UILabel!
    @IBOutlet var blueCounterLabel: UILabel!

    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    var delegate: ColorViewControllerDelegate?
    
    var backgoundColorValue: CGColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorViewWindow.layer.cornerRadius = 10
        
        setupSliders()
        setupLabels()
        setupColorViewWindow()
    }

    @IBAction func doneButton() {
        self.delegate?.setNewColors(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value)
        )
    }
    // MARK: - Sliders methods
    
    @IBAction func setRedColorSlider() {
        redCounterLabel.text = counterForLabels(slider: redColorSlider)
        setupColorViewWindow()
    }
    
    @IBAction func setGreenColorSlider() {
        greenCounterLabel.text = counterForLabels(slider: greenColorSlider)
        setupColorViewWindow()
    }

    @IBAction func setBlueColorSlider() {
        blueCounterLabel.text = counterForLabels(slider: blueColorSlider)
        setupColorViewWindow() 
    }
    
    
    // MARK: - Setup Methods
    
    private func setupSliders() {
        
        let redColorValue = Float(backgoundColorValue.components?[0] ?? 0)
        let greenColorValue = Float(backgoundColorValue.components?[1] ?? 0)
        let blueColorValue = Float(backgoundColorValue.components?[2] ?? 0)
        
        redColorSlider.minimumTrackTintColor = .red
        redColorSlider.value = round(redColorValue * 100) / 100
        
        greenColorSlider.minimumTrackTintColor = .green
        greenColorSlider.value = round(greenColorValue * 100) / 100
        
        blueColorSlider.minimumTrackTintColor = .blue
        blueColorSlider.value = round(blueColorValue * 100) / 100
    }
    
    private func setupLabels() {
        redCounterLabel.text = String(redColorSlider.value)
        greenCounterLabel.text = String(greenColorSlider.value)
        blueCounterLabel.text = String(blueColorSlider.value)
    }
    
    
    // MARK: - Counter and Color functions
    
    private func setupColorViewWindow() {
        colorViewWindow.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1)
    }
    
    private func counterForLabels(slider: UISlider) -> String {
        String(round(slider.value * 100) / 100.0)
    }
    
}



