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
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(rotateButton)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)])
    }

    @objc private func rotateButtonTapped() {
        
    }
}

