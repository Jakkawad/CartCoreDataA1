//
//  Page2ViewController.swift
//  CartCoreDataA1
//
//  Created by Jakkawad Chaiplee on 8/27/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import CoreData

class Page2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var items = [Item]()
    var fetchedResultsController:NSFetchedResultsController!
    
    var testArray = [String]()
    
    @IBOutlet weak var tableView:UITableView!
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest  = NSFetchRequest(entityName: "Item")
        
        
        do {
            /*
            fetchRequest.returnsObjectsAsFaults = false
            fetchRequest.propertiesToGroupBy = ["name"]
            fetchRequest.propertiesToFetch = ["name","color","size"]
            fetchRequest.resultType = .DictionaryResultType
            */
            
            let results = try context.executeFetchRequest(fetchRequest)
            print(results)
            self.items = results as! [Item]
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell0 = tableView.dequeueReusableCellWithIdentifier("tableCell0") as! Page2Cell0TableViewCell
        let item = items[indexPath.row]
        /*
        cell0?.textLabel?.text = item.name
        cell0?.detailTextLabel?.text = item.color
        */
        cell0.lblName.text = item.name
        cell0.lblColor.text = item.color
        cell0.lblSize.text = item.size
        
        return cell0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Right)
        managedContext.deleteObject(items[indexPath.row])
        items.removeAtIndex(indexPath.row)
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        fetchAndSetResults()
        for a in items {
            //print(a)
            
            //testArray.append(a.name!)
            /*
            if a.name == a.name || a.color == a.color || a.size == a.size {
                print("Same")
            } else {
                print("Not Same")
            }
            */
            
        }
        //print(testArray)
        
        tableView.reloadData()
    }
    
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
