//
//  ToDoListViewController.swift
//  ToDoList
//
/*
 MIT License
 
 Copyright (c) 2018 Gwinyai Nyatsoka
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import UIKit

class ToDoListViewController: UIViewController , UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

     var toDoItems: [ToDoItem] = [ToDoItem]()
    
    var selectedItem : ToDoItem?
    
        
        override func viewDidLoad() {
            super.viewDidLoad()

            tableView.delegate = self
            
            tableView.dataSource = self
            
            tableView.tableFooterView = UIView()
            
            title = "To Do List"
            
            let testItem = ToDoItem(name: "Test Item", details: "Test Details", completionDate: Date())
            
            self.toDoItems.append(testItem)
            
            
            
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            self.selectedItem = toDoItems[indexPath.row]
            
            performSegue(withIdentifier: "TaskDetailsSegue", sender: selectedItem)
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return toDoItems.count
        
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let toDoItem = toDoItems[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItem")!
            
            cell.detailTextLabel?.text = toDoItem.isComplete ? "complete" : "Incomplete"
            
            return cell
            
            
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TaskDetailsSegue" {
            
            guard let destinationVC =  segue.destination as? ToDoDetailsViewController else { return }
            
            guard let toDOItem = sender as? ToDoItem else {return}
            
             destinationVC.toDoItem = toDOItem
        }
    }
    
    
    }
   


        
        
        
    
