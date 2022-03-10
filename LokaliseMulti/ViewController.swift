//
//  ViewController.swift
//  LokaliseMulti
//
//  Created by Sunil on 9/3/2022.
//

import UIKit
import Foundation
import Lokalise

class ViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var labelText2: UILabel!
    @IBOutlet weak var labelText3: UILabel!
    @IBOutlet weak var labelText4: UILabel!
    @IBOutlet weak var labelText5: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

        
        // recommend by lokalise documentaiton but not working at the moment.
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateUserInterface),
            name: NSNotification.Name.LokaliseDidUpdateLocalization,
            object: nil
        )
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // It is not recommended but for testin purposes
        self.labelText.text = "new_password".lokaliseBundle
        self.labelText2.text = "confirm_password".lokaliseBundle
        self.labelText3.text = "view".lokaliseBundle
        self.labelText4.text = "signup_button".lokaliseBundle
        self.labelText5.text = "incentive".lokaliseBundle

    }

    // recommend by lokalise documentaiton but not working at the moment.

    @objc func updateUserInterface() {
        // Update your interface in Swift
        self.labelText.text = "new_password".lokaliseBundle
        self.labelText2.text = "confirm_password".lokaliseBundle
        self.labelText3.text = "view".lokaliseBundle
        self.labelText4.text = "signup_button".lokaliseBundle
        self.labelText5.text = "incentive".lokaliseBundle
    }

}



extension String {
    var lokaliseBundle: String {

        return Lokalise.shared.localizedString(forKey: self,
                                               value: "",
                                               table: nil)
    }
    var localized: String {
        return NSLocalizedString(self, comment:"")
    }

}
