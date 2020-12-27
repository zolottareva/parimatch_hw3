//
//  FourthAnimationViewController.swift
//  task2(HW3)
//
//  Created by Золотарева Марина Олеговна on 24.12.2020.
//

import UIKit

class FourthAnimationViewController: UIViewController {
    let commonView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    let greenCircle = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    var yellowCircle = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    
    override func viewDidLoad() {
 //       yellowCircle = UIView(frame: CGRect(x: view.center.x + 20, y: view.center.y, width: 80, height: 80))
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        
        greenCircle.layer.cornerRadius = greenCircle.layer.frame.width/2
        greenCircle.backgroundColor = .green
        commonView.addSubview(greenCircle)
        greenCircle.center = CGPoint(x: commonView.center.x, y: commonView.center.y + 30)
       
        yellowCircle.layer.cornerRadius = yellowCircle.layer.frame.width/2
        yellowCircle.backgroundColor = .yellow
        commonView.addSubview(yellowCircle)
        yellowCircle.center = CGPoint(x: commonView.center.x, y: commonView.center.y - 30)
        view.addSubview(commonView)
        commonView.center = view.center
        
        let startAnimationButton = UIButton(frame:
                                                CGRect(x: (view.frame.width - 200)/2,
                                                       y: view.frame.height - view.frame.height/4 - 10,
                                                       width: 200,
                                                       height: view.frame.height/20))
        startAnimationButton.backgroundColor = .red
        startAnimationButton.setTitle("Start Animation", for: .normal)
        startAnimationButton.addTarget(self, action: #selector(animate), for: .touchUpInside)
        view.addSubview(startAnimationButton)
        
    }
    @objc func animate(){
        UIView.animate(withDuration: 1, animations: {
            self.commonView.transform = CGAffineTransform(rotationAngle: .pi)
        }, completion: {
            finished in
            UIView.animate(withDuration: 1, animations: {
                           self.commonView.transform = CGAffineTransform(rotationAngle: .pi * (-2))})
        })
    }
}
