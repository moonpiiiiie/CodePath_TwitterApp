//
//  TweetViewController.swift
//  Twitter
//
//  Created by Cheng Xue on 9/27/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit
import RSKPlaceholderTextView

class TweetViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var tweetTextView: UITextView!
    
    
    @IBOutlet var wordCount: UILabel!
    
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func tweetButton(_ sender: Any) {
        if (!tweetTextView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true)
            }, failure: { (Error) in
                print("Error posting tweet \(Error)")
                self.dismiss(animated: true)
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tweetTextView.delegate = self
        tweetTextView.becomeFirstResponder()
//        wordCount.text = "140"
    }
    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//       // TODO: Check the proposed new text character count
//       // Allow or disallow the new text
//        let characterLimit = 140
//
//        // Construct what the new text would be if we allowed the user's latest edit
//        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
//        self.wordCount.text = String(newText.count)
//        // TODO: Update Character Count Label
//        // The new text should be allowed? True/False
//
//        return newText.count < characterLimit
//    }



}
