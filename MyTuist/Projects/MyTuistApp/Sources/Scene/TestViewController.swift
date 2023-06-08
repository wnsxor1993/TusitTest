//
//  TestViewController.swift
//  MyTuistApp
//
//  Created by Zeto on 2023/06/08.
//  Copyright © 2023 juntaek.OH. All rights reserved.
//

import UIKit
import Then
import SnapKit

final class TestViewController: UIViewController {
    
    private let label: UILabel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(label)
        label.text = "테스트"
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}
