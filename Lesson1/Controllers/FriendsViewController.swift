//
//  FriendsViewController.swift
//  Lesson1
//
//  Created by Marcus on 22.02.2021.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    var friends: [User] = []
    private var friendGrouping: [String:[User]] = [:]
    private var letters: [String] = []
    private var networkService = NetworkService()
    private let photoService = PhotoService()
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.deleteRealm()
        networkService.vkFriends { data in
            self.updateFriends(data: data)
        }
    }
    
    private func updateFriends(data: [User]) {
        friends = data
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? FriendsImageViewController,
           let indexPath = tableView.indexPathForSelectedRow
        {
            let index = indexPath.section
            let letter = letters[index]
            let friend = friendGrouping[letter]?[indexPath.row]
            controller.photoFriends.0 = friend?.name ?? "somebody"
            controller.photoFriends.1 = friend?.imageName ?? "person"
            controller.photoFriends.2 = friend?.avatarLikes ?? 0
            controller.photoFriends.3 = friend?.photos
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let first = letters[section]
        let friends = friendGrouping[first]
        return friends?.count ?? 0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        groupOfFriends()
        return friendGrouping.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Friends1", for: indexPath) as! Friend1TableViewCell
        let index = indexPath.section
        let friend = friendGrouping[letters[index]] ?? []
        let name = friend[indexPath.item]
        cell.titleLabel.text = name.name
        let imageForName = friend[indexPath.item]
        let photo = photoService.photo(byUrl: imageForName.imageName ?? "") {
            tableView.reloadData()
        }
        cell.iconImageView.image = photo
    //    cell.iconImageView?.load(url: imageForName.imageName ?? "")
        cell.iconImageView?.layer.cornerRadius = cell.imageView!.frame.height/2
        cell.iconImageView?.layer.masksToBounds = true
        
        return cell
        
        
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        view.backgroundColor = .init(white: 1, alpha: 0.5)
        let label = UILabel()
        label.textColor = .black
        view.addSubview(label)
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = letters[section]
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                        label.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        return view
    }
    
    private func getCell(text: String, image: UIImage?, id: String?) -> Friend1TableViewCell {
        let cell = Friend1TableViewCell()
        cell.textLabel?.text = text
        cell.imageView?.image = image
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    private func groupOfFriends() {
        var groups: [String: [User]] = [:]
        for friend in friends {
            if let first = friend.name.first?.uppercased() {
                if groups.contains(where: {$0.key == first}) {
                    groups[first] = groups[first]! + [friend]
                } else {
                    groups[first] = [friend]
                }
            }
        }
        friendGrouping = groups
        letters = friendGrouping.map { $0.key }.sorted()
    }
    
    
}

class FriendsImageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    var photoFriends: (String, String, Int, [String]?) = ("", "", 0, [])
    var imageView: ImageView?
    var currentImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = ImageView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
        imageView?.imageSettings(imageName: photoFriends.1, likes: &photoFriends.2) {
            return
        }
        view.addSubview(imageView!)
        self.navigationItem.title = photoFriends.0
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
    }
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        var photo: [String] = []
        if let photos = photoFriends.3 {
            photo = [photoFriends.1] + photos
        } else {
            photo = [photoFriends.1]
        }
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                if currentImage == photo.count - 1 {
                    currentImage = 0
                    
                }else{
                    currentImage += 1
                }
                
                UIView.animate(withDuration: 0.5, delay: 0.0, options: [UIView.AnimationOptions.curveEaseIn, UIView.AnimationOptions.transitionCurlUp], animations: {
                    
                    self.imageView?.imageView?.transform = CGAffineTransform.identity.scaledBy(x: 0.5, y: 0.5)
                    
                }) { (finished) in
                    UIView.animate(withDuration: 1, animations: {
                        self.imageView?.setNewImage(imageName: photo[self.currentImage]) {
                            return
                        }
                        
                        self.imageView?.imageView?.transform = CGAffineTransform(translationX: (self.imageView?.frame.width)!, y: 0)
                        self.imageView?.imageView?.transform = CGAffineTransform.identity
                        
                    })
                }
                
                
            case UISwipeGestureRecognizer.Direction.right:
                if currentImage == 0 {
                    currentImage = photo.count - 1
                }else{
                    currentImage -= 1
                }
                
                UIView.animate(withDuration: 0.5, delay: 0.0, options: [UIView.AnimationOptions.curveEaseIn, UIView.AnimationOptions.transitionCurlUp], animations: {
                    self.imageView?.imageView?.transform = CGAffineTransform(translationX: -(self.imageView?.frame.width)! + 10, y: 0)
                    self.imageView?.imageView?.alpha = 0
                    
                }) { (finished) in
                    self.imageView?.setNewImage(imageName: photo[self.currentImage]) {
                        
                    }
                    UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.curveEaseIn, animations:{
                        self.imageView?.imageView?.transform = CGAffineTransform.identity.scaledBy(x: 0.5, y: 0.5)
                    }) { (finished) in
                        self.imageView?.imageView?.alpha = 1
                        UIView.animate(withDuration: 1, animations: {
                            self.imageView?.imageView?.transform = CGAffineTransform.identity
                        })
                    }
                }
                
            default:
                break
            }
        }
    } 
}






