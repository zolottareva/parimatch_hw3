//
//  SecondAnimationViewController.swift
//  task2(HW3)
//
//  Created by Золотарева Марина Олеговна on 24.12.2020.
//

import UIKit

class SecondAnimationViewController: UIViewController {

    let rectangle = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let circle = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        rectangle.backgroundColor = .black
        rectangle.center = view.center
        view.addSubview(rectangle)
        
        circle.layer.masksToBounds = true
        circle.layer.cornerRadius = circle.layer.frame.width/2
        circle.backgroundColor = .white
        circle.center = view.center
        view.addSubview(circle)
        
        let startAnimationButton = UIButton(frame:
                                                CGRect(x: (view.frame.width - 200)/2,
                                                       y: view.frame.height - view.frame.height/4 - 10,
                                                       width: 200,
                                                       height: view.frame.height/20))
        startAnimationButton.backgroundColor = .red
        startAnimationButton.setTitle("Start Animation", for: .normal)
        startAnimationButton.addTarget(self, action: #selector(animate), for: .touchUpInside)
        view.addSubview(startAnimationButton)
        
        
        let goToNextAnimationButton = UIButton(frame:
                                                CGRect(x: (view.frame.width - 200)/2,
                                                       y: view.frame.height - view.frame.height/5,
                                                       width: 200,
                                                       height: view.frame.height/20))
        goToNextAnimationButton.backgroundColor = .green
        goToNextAnimationButton.setTitle("Next", for: .normal)
        view.addSubview(goToNextAnimationButton)
        goToNextAnimationButton.addTarget(self, action: #selector(goToThird), for: .touchUpInside)
    }
    @objc func goToThird(){
        self.performSegue(withIdentifier: "toThirdAnimation", sender: Any?.self)
    }
    @objc func animate(){
        UIView.animate(withDuration: 0.5, animations: { [self] in
            self.rectangle.backgroundColor = .red
            self.circle.backgroundColor = .blue },
                       completion: { finished in
                        self.animatePhaseTwo()
        })
    }
    func animatePhaseTwo(){
        guard self.circle.backgroundColor != .white else {
            return
        }
        if self.rectangle.backgroundColor == .red{
            UIView.animate(withDuration: 0.5, animations: { [self] in
                            self.rectangle.backgroundColor = .green
                            self.circle.backgroundColor = .yellow},
                           completion: { finished in
                            self.animatePhaseTwo()
                            })
        }
        if self.rectangle.backgroundColor == .green{
            UIView.animate(withDuration: 0.5, animations: { [self] in
                            self.rectangle.backgroundColor = .orange
                            self.circle.backgroundColor = .systemPink},
                           completion: { finished in
                            self.animatePhaseTwo()
                            })
        }
        if self.rectangle.backgroundColor == .orange{
            UIView.animate(withDuration: 0.5, animations: { [self] in
                            self.rectangle.backgroundColor = .white
                            self.circle.backgroundColor = .black},
                           completion: { finished in
                            self.animatePhaseTwo()
                            })
        }
        if self.rectangle.backgroundColor == .white{
            UIView.animate(withDuration: 0.5, animations: { [self] in
                            self.rectangle.backgroundColor = .white
                            self.circle.backgroundColor = .white},
                           completion: { finished in
                            self.animatePhaseTwo()
                            })
        }

    }
}
