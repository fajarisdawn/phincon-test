//
//  UIImageView.Extension.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 23/06/23.
//

import Foundation
import Kingfisher

extension UIImageView {
    func setImage(_ url: String, placeholder: String? = "image_placeholder") {
        self.kf.setImage(with: URL(string: url), placeholder: UIImage(named: placeholder ?? ""))
    }
    
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
    
    func loadImage(url: URL?, placeholder: String = "image_placeholder") {
        kf.setImage(with: url, placeholder: UIImage(named: placeholder),
                    options: [.transition(.fade(0.33)),
                              .memoryCacheExpiration(.seconds(60))])
    }
    
    func loadImage(url: URL?, size: CGSize, placeholder: String = "image_placeholder") {
        let actualSize = CGSize(
            width: size.width * UIScreen.main.scale,
            height: size.height * UIScreen.main.scale)
        
        let imageProcessor = ResizingImageProcessor(referenceSize: actualSize)
        kf.setImage(with: url, placeholder: UIImage(named: placeholder),
                    options: [.transition(.fade(0.33)),
                              .processor(imageProcessor),
                              .memoryCacheExpiration(.seconds(60))])
    }
}
