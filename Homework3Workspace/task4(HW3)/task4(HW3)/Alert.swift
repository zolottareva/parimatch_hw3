//
//  Alert.swift
//  task4(HW3)
//
//  Created by Золотарева Марина Олеговна on 27.12.2020.
//

import UIKit

class Alert: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bigAlertLabel = UILabel(frame: CGRect(x: 10, y: 20, width: view.frame.width - 20, height: 40))
        bigAlertLabel.text = "Big Alert Title"
        bigAlertLabel.textColor = .black
        bigAlertLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        bigAlertLabel.textAlignment = .center
        view.addSubview(bigAlertLabel)
        
        let alertTextLabel = UILabel(frame: CGRect(x: 10, y: 80, width: view.frame.width - 20, height: 200))
        alertTextLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        alertTextLabel.numberOfLines = 10
        alertTextLabel.textColor = .black
        alertTextLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        alertTextLabel.textAlignment = .natural
        view.addSubview(alertTextLabel)
        
        let okButton = UIButton(frame: CGRect(x: 10, y: 300, width: self.view.frame.width - 20, height: 40))
        okButton.backgroundColor = .systemRed
        okButton.setTitle("OK", for: .normal)
        okButton.setTitleColor(.white, for: .normal)
        okButton.layer.cornerRadius = 10
        okButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        okButton.addTarget(self, action: #selector(okButtonPressed(_:)), for: .touchUpInside)
        view.addSubview(okButton)
    }
    override func viewDidAppear(_ animated: Bool) {
        view.frame = CGRect(x: view.center.x, y: view.center.y, width: 400, height: 400)
    }
    @objc func okButtonPressed(_ sender: UIButton? = nil){
        self.modalTransitionStyle = .crossDissolve
        self.dismiss(animated: true, completion: nil)
    }
}
