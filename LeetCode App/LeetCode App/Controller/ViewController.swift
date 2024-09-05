//
//  ViewController.swift
//  LeetCode App
//
//  Created by Shaik Ismail on 01/09/24.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,LeetCodeDelegate{
    
    var leetcodemanager=LeetCodeManager()
    
    @IBOutlet var searchField: UITextField!
    
    
    @IBOutlet var totalSolved: UILabel!
    
    @IBOutlet var easySolved: UILabel!
    
    @IBOutlet var mediumSolved: UILabel!
    
    @IBOutlet var hardSolved: UILabel!
    
    @IBOutlet var rankingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchField.delegate=self
        leetcodemanager.delegate=self
        
    }
    
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        searchField.endEditing(true)
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let username=searchField.text
        {
            leetcodemanager.getUsername(username: username)
        }
        searchField.text=""
        
    }
    
    func updateUI(leetcode:LeetCodeModel)
    {
        DispatchQueue.main.async {
            self.totalSolved.text="\(leetcode.totalSolved)"
            self.easySolved.text="\(leetcode.easySolved)"
            self.mediumSolved.text="\(leetcode.mediumSolved)"
            self.hardSolved.text="\(leetcode.hardSolved)"
            self.rankingLabel.text="\(leetcode.ranking)"
        }
    }
}

