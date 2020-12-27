//
//  ViewController.swift
//  task4(HW3)
//
//  Created by Золотарева Марина Олеговна on 27.12.2020.
//

import UIKit
var name: String? = "UserName"

class ViewController: UIViewController, UITextFieldDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImageView(image: UIImage(named: "Football.png"))
        image.frame = CGRect(x: 60, y: 60, width: view.frame.width - 120, height: view.frame.height * 1/3)
        view.addSubview(image)
        
        let beyondLimitsLabel = UILabel(frame: CGRect(x: 60, y: 60 + view.frame.height * 1/3 + 10, width: view.frame.width - 120, height: 40))
        beyondLimitsLabel.text = "Beyond Limits"
        beyondLimitsLabel.textColor = .black
        beyondLimitsLabel.font = UIFont.systemFont(ofSize: 25, weight: .black)
        beyondLimitsLabel.textAlignment = .center
        view.addSubview(beyondLimitsLabel)
        
        let enterUsernameField = UITextField(frame: CGRect(x: 50, y: 130 + view.frame.height * 1/3, width: view.frame.width - 100, height: 40))
        enterUsernameField.placeholder = "Enter username"
        enterUsernameField.borderStyle = .roundedRect
        enterUsernameField.font = UIFont.systemFont(ofSize: 17)
        enterUsernameField.textAlignment = .center
        enterUsernameField.autocorrectionType = .no
        enterUsernameField.addTarget(self, action: #selector(textFieldShouldReturn(_:)), for: .editingDidEndOnExit)
        view.addSubview(enterUsernameField)
        
        let giveMeSomeDetailsButton = UIButton(frame: CGRect(x: 20, y: view.frame.height * 10/12, width: view.frame.width - 40, height: view.frame.height/12))
        giveMeSomeDetailsButton.backgroundColor = .systemRed
        giveMeSomeDetailsButton.setTitle("Give Me Some Details", for: .normal)
        giveMeSomeDetailsButton.setTitleColor(.white, for: .normal)
        giveMeSomeDetailsButton.layer.cornerRadius = 10
        giveMeSomeDetailsButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        giveMeSomeDetailsButton.addTarget(self, action: #selector(giveSomeDetailsButtonPressed(_:)), for: .touchUpInside)
        view.addSubview(giveMeSomeDetailsButton)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        name = textField.text
        return true;
    }
    @objc func giveSomeDetailsButtonPressed(_ sender: Any? = nil)
    {
        self.performSegue(withIdentifier: "giveSomeDetailsSegue", sender: (Any).self)
    }
}

