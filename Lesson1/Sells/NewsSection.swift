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
    private let photoService = PhotoService()
    
    init(image: String, reloadAction: @escaping () -> Void) {
        newsImageView = UIImageView()
        let photo = photoService.photo(byUrl: image, action: reloadAction)
        newsImageView.image = photo
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
    private var showMore: UIButton?
    private var label: UILabel?
    init(text: String) {
        super.init(style: .default, reuseIdentifier: "")
        label = UILabel(frame: CGRect(x: 10, y: 10, width: self.frame.size.width, height: 20))
        var finalText = text
        self.addSubview(label!)
        if text.count > 200 {
            let number = Int(text.count - 200)
            finalText.removeLast(number)
            finalText.append("...")
            showMore = UIButton(frame: CGRect(x: 50, y: 60, width: 100, height: 15))
            showMore?.setTitle("Show more", for: .normal)
            self.addSubview(showMore!)
            showMore?.backgroundColor = .blue
            showMore?.isSelected = false
            showMore?.isUserInteractionEnabled = true
            showMore?.addTarget(self, action: #selector(showMoreTap), for: .touchUpInside)
        }
        label?.text = finalText
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    @objc func showMoreTap() {
        guard let showMore = showMore else {
            return
        }
        if showMore.isSelected {
            showMore.isSelected = false
            showMore.setTitle("Show more", for: .normal)
        } else {
            showMore.setTitle("Show less", for: .normal)
            showMore.isSelected = true
        }
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
