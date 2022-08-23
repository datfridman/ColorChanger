//
//  MainViewController.swift
//  ColorChanger
//
//  Created by Leon Fridman on 8/23/22.
//

import UIKit

protocol ColorViewControllerDelegate {
    func setNewColors(red: CGFloat, green: CGFloat, blue: CGFloat)
}

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(
            red: CGFloat(0.5),
            green: CGFloat(0.7),
            blue: CGFloat(0.9),
            alpha: 1)
      
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    
     // MARK: - Navigation

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let colorSetVC = segue.destination as? ColorChangerViewController else { return }
         guard let backgoundColorValue = self.view.backgroundColor?.cgColor else { return }
         
         colorSetVC.backgoundColorValue = backgoundColorValue
         colorSetVC.delegate = self
     }
}

// MARK: - Extensions

extension MainViewController: ColorViewControllerDelegate {
    func setNewColors(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.view.backgroundColor = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: 1)
    }
    
}
