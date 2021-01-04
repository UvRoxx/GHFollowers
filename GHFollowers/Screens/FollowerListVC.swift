//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by UTKARSH VARMA on 2021-01-03.
//

import UIKit

class FollowerListVC: UIViewController {
    var userName:String!
    
    let networkManager = NetworkManager.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.getData(userName, atPage: 1) { (data, error) in
            if let followers = data{
                print(followers)
            }else{
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happend", message: error!.rawValue, buttonTitle: "Ok")
                DispatchQueue.main.async {
                    self.navigationController!.popToRootViewController(animated: true)
                    
                }
            }
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    



}
