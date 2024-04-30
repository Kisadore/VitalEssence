//
//  DetailViewController.swift
//  VitalEssence
//
//  Created by Kiahna Isadore on 4/23/24.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var youtubeLinkLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UITextView!
    @IBOutlet weak var instructionsLabel: UITextView!
    
    var instructions: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Instructions: \(instructions?.strInstructions ?? "Instructions not available")")
        
        if let instructions = instructions {
                    titleLabel.text = instructions.strMeal
                    instructionsLabel.text = instructions.strInstructions
                    
                    if let mealPath = instructions.strMealThumb, let imageUrl = URL(string: mealPath) {
                        Nuke.loadImage(with: imageUrl, into: recipeImageView)
                    }
                } else {
                    // Handle case when instructions are nil
                    print("Instructions are nil")
                }
    }
}
