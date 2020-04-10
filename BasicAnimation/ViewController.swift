//
//  ViewController.swift
//  BasicAnimation
//
//  Created by Chris Price on 4/9/20.
//  Copyright © 2020 com.chrispriiice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLabel()
        configureButtons()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        label.center = view.center
    }
    
    private func configureLabel() {
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.widthAnchor.constraint(equalTo: label.heightAnchor).isActive = true
        
        label.text = "👾"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 96)
        
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 12
    }
    
    private func configureButtons() {
        let rotateButton = UIButton(type: .system)
        rotateButton.translatesAutoresizingMaskIntoConstraints = false
        rotateButton.setTitle("Rotate", for: .normal)
        rotateButton.addTarget(self, action: #selector(rotateButtonTapped), for: .touchUpInside)
        
        let springButton = UIButton(type: .system)
        springButton.translatesAutoresizingMaskIntoConstraints = false
        springButton.setTitle("Spring", for: .normal)
        springButton.addTarget(self, action: #selector(springButtonTapped), for: .touchUpInside)
        
        let keyButton = UIButton(type: .system)
        keyButton.translatesAutoresizingMaskIntoConstraints = false
        keyButton.setTitle("Key", for: .normal)
        keyButton.addTarget(self, action: #selector(keyButtonTapped), for: .touchUpInside)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(rotateButton)
        stackView.addArrangedSubview(springButton)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)])
    }
    
    @objc private func rotateButtonTapped() {
        label.center = view.center // To reset the animation (in case another animation moved it).
        UIView.animate(withDuration: 2.0, animations: {
            self.label.transform = CGAffineTransform(rotationAngle: .pi/4) // This is an absolute angle.
        }) { _ in UIView.animate(withDuration: 2.0) {
            self.label.transform = .identity
            }
        }
    }
    
    @objc private func springButtonTapped() {
        label.center = view.center
        label.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            self.label.transform = .identity
        }, completion: nil)
    }
    
    @objc private func keyButtonTapped() {
        
    }
    
}
