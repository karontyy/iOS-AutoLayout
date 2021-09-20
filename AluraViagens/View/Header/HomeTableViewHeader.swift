//
//  HomeTableViewHeader.swift
//  AluraViagens
//
//  Created by Guilherme Berson on 19/09/21.
//

import UIKit

class HomeTableViewHeader: UIView {
    //MARK: - IBOutlets
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var bannerVeiew: UIView!
    
    func configuraView(){
        headerView.backgroundColor = UIColor(red: 30/255.0, green: 59/255.0, blue: 119/255.0, alpha: 1)
        
        bannerVeiew.layer.cornerRadius = 10
        bannerVeiew.layer.masksToBounds = true
        
        headerView.layer.cornerRadius = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 500 : 200
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}
