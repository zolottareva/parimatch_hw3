//
//  ThirdAnimationViewController.swift
//  task2(HW3)
//
//  Created by Золотарева Марина Олеговна on 24.12.2020.
//

import UIKit

class ThirdAnimationViewController: UIViewController {

    let rectangle = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        rectangle.backgroundColor = .systemBlue
        rectangle.center = view.center
        view.addSubview(rectangle)
        
        
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
        goToNextAnimationButton.addTarget(self, action: #selector(goToFourth), for: .touchUpInside)
    }
    
    @objc func goToFourth(){
        self.performSegue(withIdentifier: "toFourthAnimation", sender: Any?.self)
    }
    
    @objc func animate(){
        UIView.animate(withDuration: 1, animations: { [self] in
            self.rectangle.layer.cornerRadius = rectangle.frame.width/2
            rectangle.center = view.center
        }, completion: { finished in
            UIView.animate(withDuration: 1, animations: { [self] in
                self.rectangle.layer.cornerRadius = 0
                rectangle.center = view.center
            })
        })
    }

}
