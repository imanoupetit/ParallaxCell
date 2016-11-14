//
//  ViewController.swift
//  Parallax
//
//  Created by Imanou Petit on 14/11/2016.
//  Copyright © 2016 Imanou Petit. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let cellHeight = CGFloat(200)
    let parallaxOffsetSpeed = CGFloat(20)
    var parallaxImageHeight: CGFloat {
        let maxOffset = (sqrt(pow(cellHeight, 2) + 4 * parallaxOffsetSpeed * tableView.frame.height) - cellHeight) / 2
        return maxOffset + cellHeight
    }
    
    // MARK: - Datasource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.landscapeImageView.image = UIImage(named: "beach")
        cell.parallaxHeightConstraint.constant = parallaxImageHeight
        cell.parallaxTopConstraint.constant = parallaxOffset(newOffsetY: tableView.contentOffset.y, cell: cell)
        return cell
    }
    
    func parallaxOffset(newOffsetY: CGFloat, cell: UITableViewCell) -> CGFloat {
        return (newOffsetY - cell.frame.origin.y) / parallaxImageHeight * parallaxOffsetSpeed
    }
    
    // MARK: - UIScrollViewDelegate
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = tableView.contentOffset.y
        for cell in tableView.visibleCells as! [ImageCell] {
            cell.parallaxTopConstraint.constant = parallaxOffset(newOffsetY: offsetY, cell: cell)
        }
    }
    
}
