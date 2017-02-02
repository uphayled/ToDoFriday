//
//  ViewController.swift
//  ToDo
//
//  Created by Chris on 2017-01-23.
//  Copyright © 2017 Chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var theToDoList = [ToDo]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    @IBOutlet weak var tableView: UITableView!
    let MIN_TITLE_LENGTH = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// DataSource Methods
extension ViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.theToDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let theCell = self.tableView.dequeueReusableCell(withIdentifier: "TheCell", for: indexPath)
        theCell.textLabel?.text = self.theToDoList[indexPath.row].theTitle
        theCell.detailTextLabel?.text = self.theToDoList[indexPath.row].dateCreatedAsString
        return theCell
    }
}

// Button Actions
extension ViewController {
    
    @IBAction func doQuickAdd(_ sender: UIBarButtonItem) {
        let quickAddAlert = UIAlertController(title: "Name and Phone", message: "Please enter Name and Phone Number", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        quickAddAlert.addAction(cancelAction)
        
        quickAddAlert.addTextField(configurationHandler: nil)
        
        let addAction = UIAlertAction(title: "Add", style: .default, handler: {(_) in
            guard let theTextField = quickAddAlert.textFields?.first, let theTitle = theTextField.text
            else {
                return
            }
            // If we make it here, we have a valid title!!! Therefore let's add it!
            self.theToDoList.append(ToDo(theTitle: theTitle))
        })
        
        addAction.isEnabled = false
        quickAddAlert.addAction(addAction)
        
        quickAddAlert.textFields?.first?.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        present(quickAddAlert, animated: true, completion: nil)
    }
    
    @IBAction func doAdd(_ sender: UIBarButtonItem) {
    }
}

// Event Handlers
extension ViewController {
    func textFieldDidChange(textField:UITextField) {
        let theLength = textField.text!.characters.count
        let theController = self.presentedViewController as? UIAlertController
        theController?.actions.last?.isEnabled = theLength >= self.MIN_TITLE_LENGTH
    }
}

// Delegate Methods

extension ViewController {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.theToDoList.remove(at: indexPath.row)
        }
    }
}














