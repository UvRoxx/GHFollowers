//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by UTKARSH VARMA on 2021-01-03.
//

import UIKit

extension UIViewController{
    func presentGFAlertOnMainThread(title:String,message:String,buttonTitle:String){
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
