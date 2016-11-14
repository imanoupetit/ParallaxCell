//
//  ViewController.swift
//  Parallax
//
//  Created by Imanou Petit on 14/11/2016.
//  Copyright © 2016 Imanou Petit. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - Datasource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ParallaxImageCell", for: indexPath) as! ParallaxImageCell
        
        // Display image
        cell.parallaxImageView.image = UIImage(named: "beach")
        
        // Set parallax for cell
        cell.parallaxOffset(newOffsetY: tableView.contentOffset.y)

        return cell
    }
    
    // MARK: - UIScrollViewDelegate
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for cell in tableView.visibleCells as! [ParallaxImageCell] {
            // Set parallax for visible cells
            cell.parallaxOffset(newOffsetY: tableView.contentOffset.y)
        }
    }
    
}
