//
//  ColoredViewController.swift
//  NestedCollectionIntoTableDemo
//
//  Created by Amir Abbas on 2/24/1397 AP.
//  Copyright © 1397 AP Amir Abbas. All rights reserved.
//

import UIKit

class ColoredViewController: UIViewController {
    var backgroundColor: UIColor = .white
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = backgroundColor
        navigationItem.title = colorDescs[backgroundColor]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
