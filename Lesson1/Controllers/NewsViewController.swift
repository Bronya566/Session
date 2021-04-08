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
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return news.count
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "News", for: indexPath) as! NewsTableViewCell
        cell.newsImageView?.image = UIImage(systemName: news[indexPath.row].imageName ?? "person")
        
        
        cell.newsLabel?.text = news[indexPath.row].text
        return cell
    }
    

}
