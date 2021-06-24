//
//  ImageView.swift
//  Lesson1
//
//  Created by Marcus on 04.03.2021.
//

import Foundation
import UIKit

    

class ImageView: UIView{

    @IBOutlet var imageView: Avatar?
    private var control: Like?
    private let photoService = PhotoService()
    
    func setNewImage(imageName: String, reloadAction: @escaping () -> Void) {
        let photo = photoService.photo(byUrl: imageName, action: reloadAction)
        imageView?.image = photo
    }    

    func imageSettings(imageName: String, likes: inout Int, action:  @escaping () -> Void) {
        backgroundColor = .white
        imageView = Avatar()
        let photo = photoService.photo(byUrl: imageName, action: action)
        imageView?.image = photo
        let shadow = imageView?.setShadow()
        addSubview(shadow!)
        imageView?.settings()
        shadow!.addSubview(imageView!)
        controlSettings(like: &likes)
    }
    
    private func controlSettings(like: inout Int) {
        control = Like(numberOfLikes: like)
        control?.setControl()
        addSubview(control!)
    }
}

class Avatar: UIImageView {
    func settings() {
        frame = CGRect(x: 0, y: -10, width: 300, height: 300)
        backgroundColor = .red
        layer.cornerRadius = frame.height/2
        clipsToBounds = true
    }
    
    
    
    func setShadow() -> UIView {
        let outerView = UIView(frame: CGRect(x: 50, y: 80, width: 300, height: 300))
        outerView.clipsToBounds = false
        outerView.layer.shadowColor = UIColor.black.cgColor
        outerView.layer.shadowOpacity = 1
        outerView.layer.shadowOffset = CGSize.zero
        outerView.layer.shadowRadius = 10
        outerView.layer.shadowPath = UIBezierPath(roundedRect: outerView.bounds, cornerRadius: 150).cgPath
        return outerView
    }
}
