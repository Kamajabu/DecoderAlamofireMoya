//
//  UrlSessionScreenViewController.swift
//  GithubRepoFind
//
//  Created by Kamil Buczel on 18.01.2018.
//  Copyright © 2018 Kamajabu. All rights reserved.
//

import UIKit

class UrlSessionScreenViewController: UIViewController {

    static func storyboardInstance() -> UrlSessionScreenViewController? {
        let storyboard = UIStoryboard(name:"UrlSessionScreen", bundle: nil)
        return storyboard.instantiateInitialViewController() as? UrlSessionScreenViewController
    }

    var articles:[Article]?

    override func viewDidLoad() {
        super.viewDidLoad()

        makeUrlSession()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func makeUrlSession() {
        //Implementing URLSession
        let urlString = "https://swift.mrgott.pro/blog.json"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }

            guard let data = data else { return }
            do {
                //Decode retrived data with JSONDecoder and assing type of Article object
                let articlesData = try JSONDecoder().decode([Article].self, from: data)

                //Get back to the main queue
                DispatchQueue.main.async {
                    //print(articlesData)
                    self.articles = articlesData
                }

            } catch let jsonError {
                print(jsonError)
            }

            }.resume()
    }
    

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
