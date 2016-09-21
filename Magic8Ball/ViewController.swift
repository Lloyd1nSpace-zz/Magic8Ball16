//
//  ViewController.swift
//  Magic8Ball
//
//  Created by Lloyd W. Sykes on 9/20/16.
//  Copyright © 2016 Turn to Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var topLabel = UILabel()
    var bottomLabel = UILabel()
    var triangleImageView = UIImageView()
    var triangleLabel = UILabel()
    var triangleCenterXConstraint: NSLayoutConstraint!
    var triangleCenterYConstraint: NSLayoutConstraint!
    var animateButton = UIButton()
    var fortunes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.black
        self.setupViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func becomeFirstResponder() -> Bool {
        
        return true
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake {
            
            let uIntFortunes = UInt32(self.fortunes.count)
            let randomFortune = arc4random_uniform(uIntFortunes)
            let fortuneNumber = Int(randomFortune)
            let fortune = self.fortunes[fortuneNumber]
            self.triangleLabel.text = fortune.uppercased()
            
        }
        
    }
    
    func setupViews() {
        
        self.fortunes.append("Yes")
        self.fortunes.append("It will never happen!")
        self.fortunes.append("Maybe in 1996")
        self.fortunes.append("They will call you Boombastic")
        
        self.view.addSubview(self.topLabel)
        self.view.addSubview(self.bottomLabel)
        self.view.addSubview(self.triangleImageView)
        self.view.addSubview(self.animateButton)
        self.triangleImageView.addSubview(self.triangleLabel)
        
        self.topLabel.text = "Ask a Question. Then shake your phone."
        self.topLabel.textAlignment = NSTextAlignment.center
        self.topLabel.textColor = UIColor.white
        
        self.bottomLabel.text = "Magic 8 Ball"
        self.bottomLabel.textColor = UIColor.white
        self.bottomLabel.textAlignment = NSTextAlignment.center
        
        self.triangleImageView.image = UIImage(named: "triangle-1")
        
      //  self.triangleLabel.text = "Triangle label"
        
        self.animateButton.setTitle("Animate", for: .normal)
        self.animateButton.addTarget(self, action: #selector(self.animateButtonTapped), for: .touchUpInside)
        
        self.viewsConstraints()
        
    }
    
    func viewsConstraints() {
        
        self.topLabel.translatesAutoresizingMaskIntoConstraints = false
        self.topLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10).isActive = true
        self.topLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.topLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.topLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/8).isActive = true
        
        self.bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        self.bottomLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.bottomLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.bottomLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.bottomLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/8).isActive = true
        
        self.triangleImageView.translatesAutoresizingMaskIntoConstraints = false
        self.triangleCenterXConstraint = self.triangleImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        self.triangleCenterXConstraint.isActive = true
        self.triangleCenterYConstraint = self.triangleImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        self.triangleCenterYConstraint.isActive = true
        self.triangleImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/2).isActive = true
        self.triangleImageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/4).isActive = true
        
        self.triangleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.triangleLabel.topAnchor.constraint(equalTo: self.triangleImageView.topAnchor, constant: -75).isActive = true
        self.triangleLabel.centerXAnchor.constraint(equalTo: self.triangleImageView.centerXAnchor).isActive = true
        self.triangleLabel.widthAnchor.constraint(equalTo: self.triangleImageView.widthAnchor, multiplier: 0.85).isActive = true
        self.triangleLabel.heightAnchor.constraint(equalTo: self.triangleImageView.heightAnchor).isActive = true
        
        self.animateButton.translatesAutoresizingMaskIntoConstraints = false
        self.animateButton.bottomAnchor.constraint(equalTo: self.bottomLabel.topAnchor).isActive = true
        self.animateButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    @IBAction func animateButtonTapped(sender: UIButton!) {
        
        print("Animate button tapped!")
        
        self.animateTriangle()
    }
    
    func animateTriangle() {
        
        if self.triangleCenterXConstraint.constant == 0 {
            
            UIView.animateKeyframes(withDuration: 1, delay: 0, options: UIViewKeyframeAnimationOptions.autoreverse, animations: {
                
                UIView.animate(withDuration: 0.2, animations: {
                    
                    self.triangleCenterXConstraint.constant += 100
                    self.triangleCenterYConstraint.constant += 100
                    
                    self.view.layoutIfNeeded()
                })
                
                
                UIView.animate(withDuration: 0.2, animations: {
                    
                    self.triangleCenterYConstraint.constant -= 300
                    self.triangleCenterXConstraint.constant -= 300
                    
                    self.view.layoutIfNeeded()
                })
                
                UIView.animate(withDuration: 0.2, animations: {
                    
                    self.triangleCenterXConstraint.constant += 200
                    
                    self.view.layoutIfNeeded()
                })
                
                UIView.animate(withDuration: 0.2, animations: {
                
                    self.triangleCenterXConstraint.constant += 200
                    self.view.layoutIfNeeded()
                    
                })
                
//                UIView.animate(withDuration: 0.2, animations: {
//                    
//                    
//                    self.triangleCenterYConstraint.constant -= 200
//                    self.view.layoutIfNeeded()
//                    
//                })
                
                
                }, completion: nil)
        } else {
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.triangleCenterYConstraint.constant = 0
                self.triangleCenterXConstraint.constant = 0
                
                self.view.layoutIfNeeded()
                
            })
            
   
        }
        
        
        
        //        if self.triangleCenterXConstraint.constant == 0 {
        //
        //            UIView.animate(withDuration: 0.5) {
        //
        //                self.triangleCenterXConstraint.constant += 100
        //                self.triangleCenterYConstraint.constant += 100
        //
        //                self.view.layoutIfNeeded()
        //            }
        //
        //
        //        } else {
        //
        //            UIView.animate(withDuration: 0.5) {
        //
        //                self.triangleCenterXConstraint.constant -= 100
        //                self.triangleCenterYConstraint.constant -= 100
        //
        //                self.view.layoutIfNeeded()
        //            }
        //
        //        }
    }
    
}

