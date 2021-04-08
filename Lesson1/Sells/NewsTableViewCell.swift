//
//  NewsTableViewCell.swift
//  Lesson1
//
//  Created by Marcus on 17.03.2021.
//

import Foundation
import UIKit

class NewsTableViewCell: UITableViewCell{
    @IBOutlet weak var newsLabel: UILabel?
    @IBOutlet weak var newsImageView: UIImageView?
    weak var newsButtomLike: UIButton?
    weak var newsButtomComment: UIButton?
    weak var newsButtomRepost: UIButton?
}
