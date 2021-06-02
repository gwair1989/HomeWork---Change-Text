//
//  ViewController.swift
//  Change Text in Code
//
//  Created by Aleksandr Khalupa on 31.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let textField = UITextField()
    let pressedButton = UIButton()
    let changeLabel = UILabel()
    let prefixArray = ["do", "can", "are", "is", "does", "could", "would", "may", "should", "where", "who", "what", "whitch", "when", "why", "how"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    
    @objc func pressButton(){
        
        guard let text = textField.text else {return}
        
        guard let firstСharacter = text.first?.uppercased() else {return}
        
        for prefix in prefixArray{
            if text.hasPrefix(prefix) || text.hasPrefix(prefix.capitalized) {
                changeLabel.text = "\(firstСharacter)" + "\(text.dropFirst())?"
                return
            }else{
                changeLabel.text = textField.text
            }
        }
    }
    
    func setUI(){
        
        view.backgroundColor = .systemGreen
        
        view.addSubview(textField)
        textField.frame = CGRect(x: 20, y: view.frame.height / 4, width: view.frame.width - 40, height: 35)
        textField.backgroundColor = .white
        textField.placeholder = "Enter your question"
        textField.textAlignment = .center
        
        view.addSubview(changeLabel)
        changeLabel.frame = CGRect(x: 20, y: view.frame.height / 2, width: view.frame.width - 40, height: 150)
        changeLabel.font = .systemFont(ofSize: 30)
        changeLabel.textAlignment = .center
        changeLabel.numberOfLines = 5
        
        view.addSubview(pressedButton)
        pressedButton.frame = CGRect(x: 20, y: view.frame.height / 1.2, width: view.frame.width - 40, height: 50)
        pressedButton.setTitle("Conver Question", for: .normal)
        pressedButton.setTitleColor(.systemRed, for: .normal)
        pressedButton.titleLabel?.font = .systemFont(ofSize: 45)
        pressedButton.addTarget(nil, action: #selector(pressButton), for: .touchUpInside)
        
    }
}

