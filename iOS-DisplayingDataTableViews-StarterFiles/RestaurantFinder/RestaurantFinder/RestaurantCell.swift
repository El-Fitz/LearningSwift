//
//  RestaurantCell.swift
//  RestaurantFinder
//
//  Created by Thomas Léger on 05/03/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {

	@IBOutlet weak var restaurantTitleLabel: UILabel!
	
	@IBOutlet weak var restaurantCheckinLabel: UILabel!
	
	@IBOutlet weak var restaurantCategoryLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
