//
//  NewsViewController.swift
//  Lesson1
//
//  Created by Marcus on 17.03.2021.
//

import Foundation
import UIKit


class NewsViewController: UITableViewController {
    private let news = TestsData.testsNews()
    private var numberOfNews: (news: Int, type: Int) = (news: 0, type: 0)
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if numberOfNews.news > news.count - 1 {
            numberOfNews.news = 0
            numberOfNews.type = 0
        }
        switch numberOfNews.type {
        case 0: cell = NewsText(text: news[numberOfNews.news].text ?? "")
            numberOfNews.type += 1
        case 1: cell = NewsPhoto(image: news[numberOfNews.news].imageName ?? "")
            numberOfNews.type += 1
        case 2: cell = NewsAction(likes: 100, isRepost: true)
            numberOfNews.type = 0
            numberOfNews.news += 1
        default: cell = UITableViewCell(style: .default, reuseIdentifier: "")
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
}
