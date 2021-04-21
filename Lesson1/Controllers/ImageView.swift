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
    
    func setNewImage(imageName: String) {
        imageView?.load(url: imageName)
    }    

    func imageSettings(imageName: String, likes: inout Int) {
        backgroundColor = .white
        imageView = Avatar()
        imageView?.load(url: imageName)
        let shadow = imageView?.setShadow()
        addSubview(shadow!)
        imageView?.settings()
        shadow!.addSubview(imageView!)
        controlSettings(like: &likes)
    }
    
    private func controlSettings(like: inout Int) {
        control = Like(numberOfLikes: &like)
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
