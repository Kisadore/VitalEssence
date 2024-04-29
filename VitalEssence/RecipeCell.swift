//
//  RecipeCell.swift
//  VitalEssence
//
//  Created by Kiahna Isadore on 4/22/24.
//

import UIKit


class RecipeCell: UITableViewCell {
    
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var recipeLabel: UILabel!
    
    @IBAction func getRecipeButtonTapped(_ sender: UIButton) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
