//
//  UINavigation.Extension.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 22/06/23.
//

import UIKit

extension UINavigationController {
    func transparentNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        navigationItem.backBarButtonItem = UIBarButtonItem(
        title: "", style: .plain, target: nil, action: nil)
    }
    
    func hide() {
        self.setNavigationBarHidden(true, animated: true)
    }
}
