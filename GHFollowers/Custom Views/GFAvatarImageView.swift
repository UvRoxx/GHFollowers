//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by UTKARSH VARMA on 2021-01-04.
//

import UIKit

class GFAvatarImageView: UIImageView {
let placeHolderImage = UIImage(named: "avatar-placeholder")!
     
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeHolderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
