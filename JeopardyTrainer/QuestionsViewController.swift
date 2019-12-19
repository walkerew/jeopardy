//
//  QuestionsViewController.swift
//  JeopardyTrainer
//
//  Created by Emily Walker on 12/8/19.
//  Copyright © 2019 Emily Walker. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var showAnswerButton: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var getItRightLabel: UILabel!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    

    
    var clue: Clue!
    var categoryTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if clue == nil {
            questionLabel.text = "ERROR: clue was nil"
        }
        if categoryTitle == nil {
            questionLabel.text = "ERROR: categoryTitle was nil"
        }
        
        categoryLabel.text = "Category: \(categoryTitle!)"
        questionLabel.text = clue.question
        answerLabel.text = clue.answer
    }
    
    @IBAction func showAnswerButtonPressed(_ sender: Any) {
        showAnswerButton.isHidden = true
        answerLabel.isHidden = false
        yesButton.isHidden = false
        noButton.isHidden = false
        getItRightLabel.isHidden = false
    }
    
    
    @IBAction func noButtonPressed(_ sender: Any) {
    }
    @IBAction func yesButtonPressed(_ sender: Any) {
    }
    
   

}
