//
//  UpdateTableViewController.swift
//  ToDoList_300921136
//
//  Created by Sajid gangat on 2017-02-17.
//  Copyright © 2017 Sajid. All rights reserved.
// SAJID GANGAT 
// Student ID :300921136
//

import UIKit
import Firebase
import FirebaseDatabase

class UpdateTableViewController: UIViewController {

    
    @IBOutlet weak var txtDescription: UITextView!
    //@IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var TextTiltle: UITextField!
    var todo : Todo!
    var databaseref : FIRDatabaseReference!
    {
        return FIRDatabase.database().reference()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        TextTiltle.text = todo.title
        txtDescription.text = todo.message
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func UpdateBtn(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let date = NSDate()
        //var dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "MM-dd-yyyy"
        let dateString = dateFormatter.string(from: date as Date)
        //println(dateString)
        let tlt = TextTiltle.text
        let desc = txtDescription.text
       // let todoref = databaseref.child("ToDoList").childByAutoId()
        
        let red = CGFloat(arc4random_uniform(UInt32(255.5)))/255
        let blue = CGFloat(arc4random_uniform(UInt32(255.5)))/255
        let green = CGFloat(arc4random_uniform(UInt32(255.5)))/255
        
        let updatetodo = Todo(title: tlt!, message: desc!, date: dateString,red: red, blue: blue, green: green)
        
        let key = todo.ref!.key
        
        let updateref = databaseref.child("/ToDoList/\(key)/")
        updateref.updateChildValues(updatetodo.toAnyObject())
         self.navigationController?.popViewController(animated: true)
      //  todoref.setValue(todo.toAnyObject())

    }
   
}
