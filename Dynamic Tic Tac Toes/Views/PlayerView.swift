//
//  PlayerView.swift
//  Dynamic Tic Tac Toes
//
//  Created by Benjamin Ashamole on 11/15/23.
//

import UIKit

class PlayerView: UIView {
    
    private let textfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Player name..."
        textfield.font = UIFont(name: "Avenir Next", size: 20)
        textfield.keyboardType = .default
        textfield.returnKeyType = .done
        textfield.borderStyle = .roundedRect
        textfield.layer.cornerRadius = 5.0
        textfield.layer.borderWidth = 1.0
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.backgroundColor = .systemGray5
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "Select player color"
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let colorView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 2.0
        view.layer.cornerRadius = 5.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var currentNode: Node?
    
    private var redButton = UIButton()
    private var orangeButton = UIButton()
    private var yellowButton = UIButton()
    
    
    private var blueButton = UIButton()
    private var cyanButton = UIButton()
    private var magentaButton = UIButton()
    
    private var purpleButton = UIButton()
    private var brownButton = UIButton()
    private var pinkButton = UIButton()
    
    var colors: [UIColor] = [.red, .orange, .yellow, .blue, .cyan, .magenta, .purple, .brown, .systemPink]
    
    var nodes = [Node]()
    
    var player = Player()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nodes = [redButton, orangeButton, yellowButton, blueButton, cyanButton, magentaButton, purpleButton, brownButton, pinkButton]
        
        textfield.delegate = self
        
        addSubviews()
        constrainSubviews()
        
        configureNodes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(textfield)
        self.addSubview(label)
        self.addSubview(colorView)
    }
    
    private func constrainSubviews() {
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(textfield.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15))
        constraints.append(textfield.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15))
        constraints.append(textfield.topAnchor.constraint(equalTo: self.topAnchor, constant: 25))
        constraints.append(textfield.heightAnchor.constraint(equalToConstant: 35))
        
        constraints.append(label.leadingAnchor.constraint(equalTo: textfield.leadingAnchor))
        constraints.append(label.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 10))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func configureNodes() {
        addNodesToView()
        constrainNodes()
    }
    
    private func addNodesToView() {
        for (index, node) in nodes.enumerated() {
            node.layer.cornerRadius = 25
            node.layer.shadowColor = UIColor.darkGray.cgColor
            node.layer.shadowOpacity = 1
            node.layer.shadowOffset = .zero
            node.layer.shadowRadius = 10
            node.backgroundColor = colors[index]
            node.translatesAutoresizingMaskIntoConstraints = false
            node.addTarget(self, action: #selector(handleTap(sender:)), for: .touchUpInside)
            colorView.addSubview(node)
        }
    }
    
    
    private func constrainNodes() {
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(colorView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30))
        constraints.append(colorView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30))
        constraints.append(colorView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10))
        constraints.append(colorView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5))
        
        constraints.append(redButton.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(redButton.widthAnchor.constraint(equalToConstant: 50))
        constraints.append(redButton.leadingAnchor.constraint(equalTo: colorView.leadingAnchor, constant: 15))
        constraints.append(redButton.topAnchor.constraint(equalTo: colorView.topAnchor, constant: 15))
        
        constraints.append(orangeButton.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(orangeButton.widthAnchor.constraint(equalToConstant: 50))
        constraints.append(orangeButton.leadingAnchor.constraint(equalTo: colorView.leadingAnchor, constant: 15))
        constraints.append(orangeButton.topAnchor.constraint(equalTo: redButton.bottomAnchor, constant: 20))
        
        constraints.append(yellowButton.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(yellowButton.widthAnchor.constraint(equalToConstant: 50))
        constraints.append(yellowButton.leadingAnchor.constraint(equalTo: colorView.leadingAnchor, constant: 15))
        constraints.append(yellowButton.topAnchor.constraint(equalTo: orangeButton.bottomAnchor, constant: 20))
        
        
        constraints.append(blueButton.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(blueButton.widthAnchor.constraint(equalToConstant: 50))
        constraints.append(blueButton.centerXAnchor.constraint(equalTo: colorView.centerXAnchor))
        constraints.append(blueButton.topAnchor.constraint(equalTo: colorView.topAnchor, constant: 15))
        
        constraints.append(cyanButton.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(cyanButton.widthAnchor.constraint(equalToConstant: 50))
        constraints.append(cyanButton.centerXAnchor.constraint(equalTo: colorView.centerXAnchor))
        constraints.append(cyanButton.topAnchor.constraint(equalTo: blueButton.bottomAnchor, constant: 20))
        
        constraints.append(magentaButton.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(magentaButton.widthAnchor.constraint(equalToConstant: 50))
        constraints.append(magentaButton.centerXAnchor.constraint(equalTo: colorView.centerXAnchor))
        constraints.append(magentaButton.topAnchor.constraint(equalTo: cyanButton.bottomAnchor, constant: 20))
        
        constraints.append(purpleButton.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(purpleButton.widthAnchor.constraint(equalToConstant: 50))
        constraints.append(purpleButton.trailingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: -15))
        constraints.append(purpleButton.topAnchor.constraint(equalTo: colorView.topAnchor, constant: 15))
        
        constraints.append(brownButton.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(brownButton.widthAnchor.constraint(equalToConstant: 50))
        constraints.append(brownButton.trailingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: -15))
        constraints.append(brownButton.topAnchor.constraint(equalTo: purpleButton.bottomAnchor, constant: 20))
        
        
        constraints.append(pinkButton.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(pinkButton.widthAnchor.constraint(equalToConstant: 50))
        constraints.append(pinkButton.trailingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: -15))
        constraints.append(pinkButton.topAnchor.constraint(equalTo: brownButton.bottomAnchor, constant: 20))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func handleTap(sender: Node) {
        if let color = sender.backgroundColor {
            player.color = color
            
            let node = currentNode
            currentNode = sender
            
            sender.layer.borderWidth = 2.0
            sender.layer.borderColor = UIColor.black.cgColor
            
            node?.layer.borderColor = nil
            node?.layer.borderWidth = 0.0
        }
    }
}

extension PlayerView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text {
            player.name = text
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
