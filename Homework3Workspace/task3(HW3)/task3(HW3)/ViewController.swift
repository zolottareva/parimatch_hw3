//
//  ViewController.swift
//  task3(HW3)
//
//  Created by Золотарева Марина Олеговна on 24.12.2020.
//

import UIKit

class ViewController: UIViewController {
    let circle = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    let colorsArray = [UIColor.yellow, UIColor.orange, UIColor.red, UIColor.blue, UIColor.green, UIColor.purple]
    override func viewDidLoad() {
        super.viewDidLoad()
        circle.center = view.center
    }
    override func viewDidAppear(_ animated: Bool) {
        circle.backgroundColor = .red
        circle.layer.cornerRadius = 20
        view.addSubview(circle)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
         view.addGestureRecognizer(tap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
        doubleTap.numberOfTapsRequired = 2
        view.addGestureRecognizer(doubleTap)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(gesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)

        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(gesture:)))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(gesture:)))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    func changeCircleColorToNew(){
        let previousColor = self.circle.backgroundColor
        while(self.circle.backgroundColor == previousColor){
            self.circle.backgroundColor = colorsArray.randomElement()
        }
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        UIView.animate(withDuration: 1.5, animations: { [self] in
            self.circle.center = view.center
        })
    }
    func animateCirclePath()
    {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: self.circle.center.x - 80, y: self.circle.center.y), radius: 80, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        let animation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
        animation.duration = 3
        animation.beginTime = CACurrentMediaTime() + 1.5
        animation.path = circularPath.cgPath
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        circle.layer.add(animation, forKey: "MyAnimation")
        circle.center = view.center
    }
    @objc func handleDoubleTap(_ sender: UITapGestureRecognizer? = nil) {
        UIView.animate(withDuration: 1.5, animations: { [self] in
            circle.center = view.center
        }, completion: {finished in self.animateCirclePath()})
    }
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .right {
            UIView.animate(withDuration: 1.5, animations: { [self] in
                self.circle.center = CGPoint(x: self.circle.center.x + 30, y: self.circle.center.y)
                changeCircleColorToNew()
            })
        }
        else if gesture.direction == .left {
            UIView.animate(withDuration: 1.5, animations: { [self] in
                self.circle.center = CGPoint(x: self.circle.center.x - 30, y: self.circle.center.y)
                changeCircleColorToNew()
            })
        }
        else if gesture.direction == .up {
            UIView.animate(withDuration: 1.5, animations: { [self] in
                self.circle.center = CGPoint(x: self.circle.center.x, y: self.circle.center.y - 30)
                changeCircleColorToNew()
            })
        }
        else if gesture.direction == .down {
            UIView.animate(withDuration: 1.5, animations: { [self] in
                self.circle.center = CGPoint(x: self.circle.center.x, y: self.circle.center.y + 30)
                changeCircleColorToNew()
            })
        }
    }

}

