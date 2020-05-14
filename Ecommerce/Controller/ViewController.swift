//
//  ViewController.swift
//  Ecommerce
//
//  Created by user162241 on 5/12/20.
//  Copyright © 2020 user162241. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        let storyboard = UIStoryboard(name: Stroyboard.LoginStoryboard, bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: StoryboardID.LoginVC)
        present(controller, animated: true, completion: nil)

    }

}

