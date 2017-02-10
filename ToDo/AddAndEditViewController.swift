//
//  AddAndEditViewController.swift
//  ToDo
//
//  Created by student on 2017-01-26.
//  Copyright © 2017 Chris. All rights reserved.
//

import UIKit

class AddAndEditViewController: UIViewController {

    @IBOutlet weak var theName: UITextField!
    @IBOutlet weak var thePhone: UITextField!
    @IBOutlet weak var type: UISegmentedControl!
    @IBOutlet weak var theAddress: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    @IBAction func doCancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func Add(_ sender: UIButton) {
    }
}







