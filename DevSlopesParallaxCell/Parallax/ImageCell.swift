//
//  ImageCell.swift
//  Parallax
//
//  Created by Imanou Petit on 14/11/2016.
//  Copyright © 2016 Imanou Petit. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    
    @IBOutlet weak var parallaxTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var parallaxHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var landscapeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        landscapeImageView.clipsToBounds = true
        landscapeImageView.contentMode = .scaleAspectFill
    }
    
}
