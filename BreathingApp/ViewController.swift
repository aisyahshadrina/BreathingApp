//
//  ViewController.swift
//  BreathingApp
//
//  Created by Aisyah Shadrina on 19/05/19.
//  Copyright © 2019 Aisyah Shadrina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var roundedButton: UIButton!
    
    @IBOutlet weak var roundView: UIImageView!
    
    @IBOutlet weak var breathLabel: UILabel!
    
    var timer : Timer?
    var ifLabel : Bool = true
    @IBAction func Start(_ sender: Any) {
        
        
        if roundedButton.currentTitle == "Start" {
            timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: { timer in
                self.breathLabel.text = self.ifLabel ? "Inhale" : "Exhale"
                self.ifLabel = !self.ifLabel
            })

            roundedButton.setTitle("Done", for: .normal)
            roundedButton.backgroundColor = .red
            fadeIn()
            
            
        } else {
            timer?.invalidate()
            timer = nil
            
            roundedButton.setTitle("Start", for: .normal)
            roundedButton.backgroundColor = .green
            self.roundView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.roundView.layer.removeAllAnimations()
            self.breathLabel.text = "Exhale"
            self.ifLabel = true
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.roundedButton.layer.cornerRadius = 5
    }
    
    
    func fadeIn() {
        
        UIView.animate (withDuration: 2, delay: 0, options:[.autoreverse, .repeat], animations : {
            self.roundView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }) { finished in
        }

    }
    
    func changeLabel() {
            breathLabel.text = "Inhale"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.breathLabel.text = "Exhale"
        }
    }
}
