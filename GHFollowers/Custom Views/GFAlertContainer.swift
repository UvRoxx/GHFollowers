//
//  GFAlertContainer.swift
//  GHFollowers
//
//  Created by UTKARSH VARMA on 2021-01-03.
//

import UIKit

class GFAlertContainer: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 2
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
