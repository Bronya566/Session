//
//  Friend1TableViewCell.swift
//  Lesson1
//
//  Created by Marcus on 27.02.2021.
//

import UIKit

class Friend1TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
   
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(animation))
        
        iconImageView.addGestureRecognizer(tap)
        iconImageView.isUserInteractionEnabled = true
    }
  
    
  
    
    
    @objc func animation(gesture: UITapGestureRecognizer) {
        iconImageView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        UIView.animate(withDuration: 0.7,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: .curveEaseOut,
                       animations: {
                        self.iconImageView.transform = .identity},
                       completion: nil)

}
}
