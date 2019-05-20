//
//  BlogViewController.swift
//  CH-final
//
//  Created by Chloe Lo on 5/2/19.
//  Copyright © 2019 Chloe Lo. All rights reserved.
//

import UIKit

class BlogViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    var name: String!
    var city: String!
    var country: String!
    var fav1: String?
    var fav2: String?
    var fav3: String?
    var more: String?
    
    override func viewDidLoad() {        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let title = name + "'s Trip to " + city + ", " + country + "!"
        titleLabel.text = title as? String
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
