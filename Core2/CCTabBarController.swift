//
//  CCTabBarController.swift
//  bistar
//
//  Created by vicky on 06/12/18.
//  Copyright © 2018 bistar. All rights reserved.
//

import UIKit

class CCTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "logo2.png")
        let imageView = UIImageView(image:logo)

        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }

}
