//
//  ViewController.swift
//  ColorChanger
//
//  Created by Leon Fridman on 8/5/22.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var colorViewWindow: UIView!
    @IBOutlet var redCounterLabel: UILabel!
    @IBOutlet var greenCounterLabel: UILabel!
    @IBOutlet var blueCounterLabel: UILabel!

    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSliders()
        setupLabels()
        setupColorViewWindow()
    }

    // MARK: - Sliders methods
    @IBAction func setRedColorSlider() {
        let counter = round(redColorSlider.value * 100) / 100.0
        redCounterLabel.text = String(counter)
        colorViewWindow.backgroundColor = UIColor(red: CGFloat(counter), green: CGFloat(greenColorSlider.value), blue: CGFloat(blueColorSlider.value), alpha: 1)
    }
    
    @IBAction func setGreenColorSlider() {
        let counter = round(greenColorSlider.value * 100) / 100.0
        greenCounterLabel.text = String(counter)
        colorViewWindow.backgroundColor = UIColor(red: CGFloat(redColorSlider.value), green: CGFloat(counter), blue: CGFloat(blueColorSlider.value), alpha: 1)
    }

    @IBAction func setBlueColorSlider() {
        let counter = round(blueColorSlider.value * 100) / 100.0
        blueCounterLabel.text = String(counter)
        colorViewWindow.backgroundColor = UIColor(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value), blue: CGFloat(counter), alpha: 1)
    }
    
    
    // MARK: - Setup Methods
    private func setupSliders() {
        redColorSlider.minimumTrackTintColor = .red
        redColorSlider.minimumValue = 0
        redColorSlider.maximumValue = 1
        redColorSlider.value = 0.40
        
        greenColorSlider.minimumTrackTintColor = .green
        greenColorSlider.minimumValue = 0
        greenColorSlider.maximumValue = 1
        greenColorSlider.value = 0.70
        
        blueColorSlider.minimumValue = 0
        blueColorSlider.maximumValue = 1
        blueColorSlider.minimumTrackTintColor = .blue
        blueColorSlider.value = 0.25
    }
    
    private func setupLabels() {
        redCounterLabel.text = String(redColorSlider.value)
        greenCounterLabel.text = String(greenColorSlider.value)
        blueCounterLabel.text = String(blueColorSlider.value)
    }
    
    private func setupColorViewWindow() {
        colorViewWindow.layer.cornerRadius = 10
        colorViewWindow.backgroundColor = UIColor(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value), blue: CGFloat(blueColorSlider.value), alpha: 1)
    }
    
}
