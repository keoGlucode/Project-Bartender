//
//  ListTableViewCell.swift
//  Bartender
//
//  Created by Keo Shiko on 2021/03/23.
//  Copyright © 2021 Glucode. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var listLabel: UILabel!
    
    @IBOutlet weak var listImage: UIImageView!
    
    
 
    func setOutlets(item : Details) {
        listImage.loadImages(urlString: item.strDrinkThumb)
        
        listLabel.text = item.strDrink
    }
}
