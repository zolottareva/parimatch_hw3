//
//  ShowDetailsViewController.swift
//  task4(HW3)
//
//  Created by Золотарева Марина Олеговна on 27.12.2020.
//

import UIKit
class StatsViewController: UIViewController{
    var leftView = UIView()
    var leftViewImage = UIImageView()
    var leftViewTopLabel = UILabel()
    var leftViewBottomLabel = UILabel()
    
    var rightView = UIView()
    var rightViewImage = UIImageView()
    var rightViewTopLabel = UILabel()
    var rightViewBottomLabel = UILabel()
    
    var checkStatsButton = UIButton()
    
    convenience init(leftImage: String, leftTopText: String, leftBottomText: String,
                     rightImage: String, rightTopText: String, rightBottomText: String) {
        self.init()
        self.leftViewImage = UIImageView(image: UIImage(named: leftImage))
        self.leftViewTopLabel.text = leftTopText
        self.leftViewBottomLabel.text = leftBottomText
        
        self.rightViewImage = UIImageView(image: UIImage(named: rightImage))
        self.rightViewTopLabel.text = rightTopText
        self.rightViewBottomLabel.text = rightBottomText
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(leftView)
        view.addSubview(rightView)
        view.backgroundColor = .systemGray4
    }
    override func viewDidAppear(_ animated: Bool) {
        leftView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width * 2/5, height: self.view.frame.height * 3/5)
        leftView.addSubview(leftViewImage)
        leftView.addSubview(leftViewTopLabel)
        leftView.addSubview(leftViewBottomLabel)
    
        leftViewImage.frame = CGRect(x: 20, y: leftView.frame.height/4, width: leftView.frame.width * 2/5, height: leftView.frame.height/2)

        leftViewTopLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        leftViewTopLabel.textColor = .black
        leftViewTopLabel.textAlignment = .center
        leftViewTopLabel.frame = CGRect(x: leftView.frame.width * 2/5 + 20, y: leftView.frame.height/4 + 3,
                                        width: leftView.frame.width * 3/5 - 3, height: leftView.frame.height/4)
        
        leftViewBottomLabel.frame = CGRect(x: leftView.frame.width * 2/5 + 20, y: leftView.frame.height/2 + 6,
                                            width: leftView.frame.width * 3/5 - 3, height: leftView.frame.height/4)
        leftViewBottomLabel.textColor = .black
        leftViewBottomLabel.font = UIFont.systemFont(ofSize: 17)
        leftViewBottomLabel.textAlignment = .center
        
        rightView.frame = CGRect(x: self.view.frame.width * 3/5, y: 0, width: self.view.frame.width * 2.5, height: self.view.frame.height * 3/5)
        rightView.addSubview(rightViewImage)
        rightView.addSubview(rightViewTopLabel)
        rightView.addSubview(rightViewBottomLabel)
        
        rightViewImage.frame = CGRect(x: 0, y: rightView.frame.height/4, width: leftView.frame.width * 2/5, height: rightView.frame.height/2)
        
        rightViewTopLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        rightViewTopLabel.textColor = .black
        rightViewTopLabel.textAlignment = .center
        rightViewTopLabel.frame = CGRect(x: leftView.frame.width * 2/5 + 3, y: leftView.frame.height/4 + 3,
                                width: leftView.frame.width * 3/5 - 3, height: leftView.frame.height/4)
        
        rightViewBottomLabel.frame = CGRect(x: leftView.frame.width * 2/5 + 3, y: leftView.frame.height/2 + 6,
                                   width: leftView.frame.width * 3/5 - 3, height: leftView.frame.height/4)
        rightViewBottomLabel.textColor = .black
        rightViewBottomLabel.font = UIFont.systemFont(ofSize: 17)
        rightViewBottomLabel.textAlignment = .center
        
        checkStatsButton = UIButton(frame: CGRect(x: 10, y: self.view.frame.height * 4/7 + 4,
                                                  width: self.view.frame.width - 20, height: self.view.frame.height * 3/7 - 20))
        checkStatsButton.backgroundColor = .systemRed
        checkStatsButton.setTitle("Check Stats", for: .normal)
        checkStatsButton.setTitleColor(.white, for: .normal)
        checkStatsButton.layer.cornerRadius = 10
        checkStatsButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        view.addSubview(checkStatsButton)
    }
    @objc func checkStatsButtonPressed(_ sender: UIButton? = nil){
        let alert = Alert()
        alert.view.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        alert.view.backgroundColor = .white
        if let parent = self.parent as? ViewController {
            parent.view.center = alert.view.center
        }
        alert.view.layer.cornerRadius = 20
        alert.view.layer.masksToBounds = true
        alert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        alert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(alert, animated: true, completion: nil)
    }
}
class ShowDetailsViewController: UIViewController {

    let topStats = StatsViewController(leftImage: "video-icon.png", leftTopText: "Videos", leftBottomText: "115",
                                       rightImage: "heart-icon.png", rightTopText: "Hearts", rightBottomText: "5483")
    let bottomStats = StatsViewController(leftImage: "game-icon.png", leftTopText: "Games", leftBottomText: "453",
                                       rightImage: "win-icon.png", rightTopText: "Wins", rightBottomText: "340")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImageView(image: UIImage(named: "Happy Face.png"))
        image.frame = CGRect(x: (view.frame.width - 200)/2, y: 60, width: 200, height: 200)
        image.layer.cornerRadius = image.frame.width/2
        image.clipsToBounds = true
        view.addSubview(image)
        
        let nameLabel = UILabel(frame: CGRect(x: 0, y: 270, width: view.frame.width, height: 40))
        nameLabel.text = name
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)
        
        let playerEnthusiastLabel = UILabel(frame: CGRect(x: view.frame.width * 1/4, y: 320,
                                                          width: view.frame.width * 1/2, height: 40))
        playerEnthusiastLabel.text = "Player enthusiast"
        playerEnthusiastLabel.textColor = .systemGray
        playerEnthusiastLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        playerEnthusiastLabel.textAlignment = .center
        view.addSubview(playerEnthusiastLabel)
        
        topStats.view.frame = CGRect(x: 20, y: 370, width: view.frame.width - 40, height: view.frame.height * 1/6)
        bottomStats.view.frame = CGRect(x: 20, y: 380 + view.frame.height * 1/6,
                                        width: view.frame.width - 40, height: view.frame.height * 1/6)
        
        let bottomLabel = UILabel(frame: CGRect(x: 20, y: view.frame.height - 130,
                                                width: view.frame.width - 40, height: 40))
        bottomLabel.text = "Lorem ipsum text since Jan 2015"
        bottomLabel.textColor = .black
        bottomLabel.font = UIFont.systemFont(ofSize: 17)
        bottomLabel.textAlignment = .center
        view.addSubview(bottomLabel)
    }

    override func viewWillAppear(_ animated: Bool) {
        topStats.view.layer.cornerRadius = 20
        topStats.view.layer.masksToBounds = true
        view.addSubview(topStats.view)
        self.addChild(topStats)
        topStats.didMove(toParent: self)
        
        bottomStats.view.layer.cornerRadius = 20
        bottomStats.view.layer.masksToBounds = true
        view.addSubview(bottomStats.view)
        self.addChild(bottomStats)
        bottomStats.didMove(toParent: self)
    }
}
