//
//  ViewController.swift
//  GithubRepoFind
//
//  Created by Kamil Buczel on 18.01.2018.
//  Copyright © 2018 Kamajabu. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func urlSessionJsonDecoderButtonDidTouch(_ sender: Any) {
        goToUrlSessionScreen()
    }



    func goToUrlSessionScreen() {
        if let urlSessionScreenViewController = UrlSessionScreenViewController
            .storyboardInstance() {
            self.present(urlSessionScreenViewController,
                                       animated: true,
                                       completion: nil)
        }
    }
}

