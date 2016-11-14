//
//  ParallaxImageCell.swift
//  Parallax
//
//  Created by Imanou Petit on 14/11/2016.
//  Copyright © 2016 Imanou Petit. All rights reserved.
//

import UIKit

class ParallaxImageCell: UITableViewCell {
    
    @IBOutlet weak var parallaxCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var parallaxImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Set parallaxImageView properties
        parallaxImageView.clipsToBounds = true
        parallaxImageView.contentMode = .scaleAspectFill
    }

    func parallaxOffset(newOffsetY: CGFloat) {
        // The parallax effect is given by changing the parallaxCenterConstraint's constant
        // Update parallaxCenterConstraint according to some computation
        let parallaxOffsetSpeed = CGFloat(20)
        parallaxCenterConstraint.constant = (newOffsetY - frame.origin.y) / bounds.height * parallaxOffsetSpeed
    }

}
