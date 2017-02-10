//
//  ViewController.swift
//  ToDo
//
//  Created by Chris on 2017-01-23.
//  Copyright © 2017 Chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var contactList = [Contact]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    @IBOutlet weak var tableView: UITableView!
    let MIN_NAME_LENGTH = 4
    let MIN_PHONE_LENGTH = 7
    var correct_name = false
    var correct_phone = false
    
    
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
        return self.contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let theCell = self.tableView.dequeueReusableCell(withIdentifier: "TheCell", for: indexPath)
        theCell.textLabel?.text = self.contactList[indexPath.row].Name
        theCell.detailTextLabel?.text = self.contactList[indexPath.row].Phone
        return theCell
    }
}

// Button Actions
extension ViewController {
    
    @IBAction func doAdd(_ sender: UIBarButtonItem) {
        let AddAlert = UIAlertController(title: "Add Contact", message: "Enter Name and Phone", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        AddAlert.addAction(cancelAction)
        
        AddAlert.addTextField(configurationHandler: nil)
        AddAlert.addTextField(configurationHandler: nil)
        
        let addAction = UIAlertAction(title: "Add", style: .default, handler: {(_) in
            guard let theNameField = AddAlert.textFields?.first,
                let thename = theNameField.text
                else {
                    return
            }
            guard let thePhoneField = AddAlert.textFields?.last,
                let thephone = thePhoneField.text
                else{
                    return
            }
            // If we make it here, we have a valid title!!! Therefore let's add it!
            self.contactList.append(Contact(theName: thename , thePhone: thephone))
        })
        
        addAction.isEnabled = false
        AddAlert.addAction(addAction)
        
        AddAlert.textFields?.first?.addTarget(self, action: #selector(nameFieldDidChange(textField:)), for: .editingChanged)
        AddAlert.textFields?.last?.addTarget(self, action: #selector(phoneFieldDidChange(textField:)), for: .editingChanged)
        
        
        present(AddAlert, animated: true, completion: nil)
        
   
    }
}

// Event Handlers
extension ViewController {
    func nameFieldDidChange(textField:UITextField) {
        correct_name =  textField.text!.characters.count >= MIN_NAME_LENGTH
        let theController = self.presentedViewController as? UIAlertController
        theController?.actions.last?.isEnabled = correct_name && correct_phone
    }
    func phoneFieldDidChange(textField:UITextField) {
        correct_phone =  textField.text!.characters.count >= MIN_PHONE_LENGTH
        let theController = self.presentedViewController as? UIAlertController
        theController?.actions.last?.isEnabled = correct_name && correct_phone
    }
// Delegate Methods
}
extension ViewController {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.contactList.remove(at: indexPath.row)
        }
    }
}














