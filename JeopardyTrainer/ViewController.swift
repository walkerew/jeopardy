//
//  ViewController.swift
//  JeopardyTrainer
//
//  Created by Emily Walker on 12/8/19.
//  Copyright © 2019 Emily Walker. All rights reserved.
//
// save file

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var category0Label: UILabel!
    @IBOutlet var category0Buttons: [UIButton]!
    @IBOutlet weak var totalQuestionsLabel: UILabel!
    @IBOutlet weak var answeredCorrectlyLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var categories: Categories!
    var currentCategories = Categories()
    var clues = Clues()
    var clueNumberToShow = 0
    var selectedCategoryNumber = 0
    var totalQuestionsSeen = 0
    var answersCorrect = 0 {
        didSet {
            answeredCorrectlyLabel.text = "\(answersCorrect)"
        }
    }
    var score = 0 {
        didSet {
            if score < 0 {
                scoreLabel.textColor = .red
            } else {
                scoreLabel.textColor = .blue
            }
            scoreLabel.text = "$\(score)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categories = Categories()
        loadCategories()
    }
    
    @IBAction func segueAfterYesPressed(segue: UIStoryboardSegue) {
        answersCorrect += 1
        score = score + clues.clueArray[clueNumberToShow].value
    }
    
    @IBAction func segueAfterNoPressed(segue: UIStoryboardSegue) {
        score = score - clues.clueArray[clueNumberToShow].value
    }
    
    @IBAction func loadButtonPressed(_ sender: Any) {
        loadCategories()
    }
    
    @IBAction func category0ButtonPressed(_ sender: UIButton) {
        
        selectedCategoryNumber = 0
        clueNumberToShow = sender.tag
        totalQuestionsSeen += 1
        totalQuestionsLabel.text = "\(totalQuestionsSeen)"
        sender.isEnabled = false
        sender.backgroundColor = .lightGray
        sender.setTitle("", for: .normal)
        performSegue(withIdentifier: "PresentQuestion", sender: sender)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PresentQuestion" {
            let destination = segue.destination as! QuestionsViewController
            destination.clue = clues.clueArray[clueNumberToShow]
            destination.categoryTitle = self.currentCategories.categoryArray[selectedCategoryNumber].title
        }
    }
    
    
    func loadCategories() {
        categories.categoryArray = []
        currentCategories.categoryArray.removeAll()
        categories.getData {
            self.currentCategories.categoryArray.append(self.categories.categoryArray.randomElement()!)
            self.category0Label.text = self.currentCategories.categoryArray[0].title
            
            self.loadClues()
        }
    }
    
    func loadClues() {
        
        for button in category0Buttons {
            button.isEnabled = true
            button.backgroundColor = .blue
        }
        
        self.clues.clueArray = []
        self.clues.id = self.currentCategories.categoryArray[0].id
        self.clues.getData {
            for i in 0..<self.category0Buttons.count {
                self.category0Buttons[i].setTitle("$\(self.clues.clueArray[i].value)", for: .normal)
            }
        }
    }
    
}




