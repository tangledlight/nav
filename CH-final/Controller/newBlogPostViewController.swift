//
//  newBlogPostViewController.swift
//  CH-final
//
//  Created by Chloe Lo on 4/18/19.
//  Copyright © 2019 Chloe Lo. All rights reserved.
//

import UIKit

class newBlogPostViewController: UIViewController, UITextViewDelegate {
    
    var imageView: UIImageView!
    
    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var countryName: UITextField!
    
    @IBOutlet weak var favOne: UITextView!
    @IBOutlet weak var favTwo: UITextView!
    @IBOutlet weak var favThree: UITextView!
    
    @IBOutlet weak var more: UITextView!
    @IBOutlet weak var bloggerName: UITextField!
    
    @IBOutlet weak var postButton: UIButton!
    
    var markerCityName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "httyd.jpg")!
        self.imageView = UIImageView(frame: UIScreen.main.bounds)
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.image = image
        self.imageView.alpha = 0.5
        self.view.insertSubview(imageView, at: 0)
//        self.view.backgroundColor = UIColor(patternImage: image)

        
        cityName.text = markerCityName
        
        favOne.delegate = self
        favOne.text = "Number 1 Favorite Thing!"
        favOne.textColor = UIColor.lightGray
        favOne.layer.cornerRadius = 6;
        
        favTwo.delegate = self
        favTwo.text = "Number 2 Favorite Thing!"
        favTwo.textColor = UIColor.lightGray
        favTwo.layer.cornerRadius = 6;
        
        favThree.delegate = self
        favThree.text = "Number 3 Favorite Thing!"
        favThree.textColor = UIColor.lightGray
        favThree.layer.cornerRadius = 6;
        
        more.delegate = self
        more.text = "Write more about your adventures here!!"
        more.textColor = UIColor.lightGray
        more.layer.cornerRadius = 6;
        // Do any additional setup after loading the view.
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("here")
        if textView.textColor == UIColor.lightGray {
            print("here")
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Write about your adventure here!!"
            textView.textColor = UIColor.lightGray
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func postButtonPushed(_ sender: Any) {
        if !(countryName.text!.isEmpty) && !(cityName.text!.isEmpty) && !(bloggerName.text!.isEmpty) {
            let newBlogPost = BlogPost(name: bloggerName.text!, country: countryName.text!, city: cityName.text!, fav1: favOne.text, fav2: favTwo.text, fav3: favThree.text, more: more.text)
        
            addBlogPost(user: bloggerName.text!, country: countryName.text!, identifier: bloggerName.text!.lowercased()+"_"+cityName.text!.lowercased(), blogPost: newBlogPost)
        self.navigationController?.popViewController(animated: true)
        }
       
    }
    
}
