//
//  PageOptionViewController.swift
//  CartCoreDataA1
//
//  Created by Jakkawad Chaiplee on 8/27/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import CoreData

class PageOptionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var productTitle:String!
    var colorTitle:String!
    var sizeTitle:String!
    
    var colorArray = [String]()
    var sizeArray = [String]()

    @IBOutlet weak var tableView:UITableView!
    
    @IBAction func btnAdd(sender: AnyObject) {
        //print("Add")
        if productTitle != nil && colorTitle != nil && sizeTitle != nil {
            //print("!=nil")
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: context)
            let item = Item(entity: entity!, insertIntoManagedObjectContext: context)
            item.name = productTitle
            item.size = sizeTitle
            item.color = colorTitle
            
            context.insertObject(item)
            
            do {
                try context.save()
            } catch {
                print("Error")
            }
            
            
        } else {
            //print("==nil")
        }
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*
        let cell0 = tableView.dequeueReusableCellWithIdentifier("tableCell0")
        if productTitle != nil {
            cell0?.detailTextLabel?.text = productTitle
        }
        return cell0!
        */
        if indexPath.row == 0 {
            let cell0 = tableView.dequeueReusableCellWithIdentifier("tableCell0")
            if productTitle != nil {
                cell0?.detailTextLabel?.text = productTitle
            }
            return cell0!
        } else if indexPath.row == 1 {
            let cell1 = tableView.dequeueReusableCellWithIdentifier("tableCell1")
            if colorTitle != nil {
                cell1?.detailTextLabel?.text = colorTitle
            }
            return cell1!
        } else {
            let cell2 = tableView.dequeueReusableCellWithIdentifier("tableCell2")
            if sizeTitle != nil {
                cell2?.detailTextLabel?.text = sizeTitle
            }
            return cell2!
        }
    }
    
    override func viewDidAppear(animated: Bool) {
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
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ProductSegue" {
            //print("Product")
        } else if segue.identifier == "ColorSegue" {
            //print("Color")
            let pageColor = segue.destinationViewController as! PageColorViewController
            colorArray = ["สีแดง", "สีสม", "สีชมพู"]
            pageColor.colorArray = colorArray
        } else if segue.identifier == "SizeSegue" {
            //print("Size")
            let pageSize = segue.destinationViewController as! PageSizeViewController
            sizeArray = ["M", "L", "XL"]
            pageSize.sizeArray = sizeArray
        } else {
            //print("Error")
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
