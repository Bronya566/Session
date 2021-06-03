//
//  Like.swift
//  Lesson1
//
//  Created by Marcus on 07.03.2021.
//

import UIKit

class Like: UIControl {
    private var likes = 0
    private var likesView: UILabel?
    private var imageView: UIButton!
    init(numberOfLikes: Int) {
        super.init(frame: CGRect(x: 50, y: 400, width: 70, height: 30))
        likes = numberOfLikes
        isSelected = true
    }
    
    init(like: Int) {
        super.init(frame: CGRect(x: 50, y: 20, width: 70, height: 30))
        likes = like
        isSelected = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setControl() {
        imageView = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        if isSelected {
            imageView.tintColor = .red
        } else {
            imageView.tintColor = .blue
        }
        imageView.addTarget(self, action: #selector(moreLike), for: .touchDown)
        addSubview(imageView)
        likesView = UILabel(frame: CGRect(x: 40, y: 0, width: 30, height: 30))
        likesView?.text = String(likes)
        addSubview(likesView!)
    }
    
    @objc func moreLike() {
        if isSelected {
            isSelected = false
            changeLikes(like: -1)
            imageView.tintColor = .blue
            UIView.animate(withDuration:1.0, animations: {
                self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                    })
        } else {
            isSelected = true
            changeLikes(like: 1)
            imageView.tintColor = .red
            UIView.animate(withDuration:1.0, animations: {
                self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 2))
                    })
        }
        likesView?.text = String(likes)
    }
    
    func changeLikes(like: Int) {
        likes += like
    }
    
}
