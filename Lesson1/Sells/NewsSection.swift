//
//  NewsSection.swift
//  Lesson1
//
//  Created by Marcus on 03.06.2021.
//

import Foundation
import UIKit

class NewsPhoto: UITableViewCell {
    private var newsImageView: UIImageView
    
    init(image: String) {
        newsImageView = UIImageView(image: UIImage(systemName: image))
        super.init(style: .default, reuseIdentifier: "")
        self.addSubview(newsImageView)
        setupConstraints()
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newsImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            newsImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            newsImageView.widthAnchor.constraint(equalToConstant: 100),
            newsImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

class NewsText: UITableViewCell {
    init(text: String) {
        super.init(style: .default, reuseIdentifier: "")
        self.textLabel?.text = text
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class NewsAction: UITableViewCell {
    private var newsButtomLike: Like
    
    init(likes: Int, isRepost: Bool?) {
        newsButtomLike = Like(like: likes)
        super.init(style: .default, reuseIdentifier: "")
        self.addSubview(newsButtomLike)
        newsButtomLike.setControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
