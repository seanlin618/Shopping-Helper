//
//  ShopViewController.swift
//  Shopping Helper
//
//  Created by Sean Lin on 11/5/14.
//  Copyright (c) 2014 Sean Lin. All rights reserved.
//

import UIKit

class ShopViewController: UITableViewController {
    
    var shoppinglist = Shoplist()
    var thumbils : [String] = ["household.png","beverage.png","produce.png","bakery.png","meat.png","dairy.png"]
    var subtitle : [String] =
        ["Vacuum, Sofa beds, Curtains, Mirrors...","Coffee, Green tea, Black tea, Coke...","Broccoli, Tomato, Carrot, Garlic...","Toast, Pie, Cake, Whole-grain bread...","Chicken breast, Steak, Salmon, Beef...","Milk, Butter, Cheese, Yogurt..."]
    var DicOrder = -1
    
    
    override func viewDidLoad() {
        let path = Bundle.main.path(forResource: "ShoppingList", ofType: "plist")
        //load the words of the plist file into the array
        shoppinglist.shoplistData = NSMutableDictionary(contentsOfFile: path!)!
        shoppinglist.shoplist = shoppinglist.shoplistData.allKeys as! [String]
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return shoppinglist.shoplistData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as UITableViewCell
        //set the text of the cell
        cell.textLabel!.text=shoppinglist.shoplist[indexPath.row]
        NSLog(shoppinglist.shoplist[indexPath.row]+"!!!")
        
        let DicOrder = checkorder(DicItem: shoppinglist.shoplist[indexPath.row])
        cell.detailTextLabel?.text = subtitle[DicOrder]
        cell.imageView!.image = UIImage(named: thumbils[DicOrder])
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="itemsegue" {
            let itemVC=segue.destination as! DetailViewController
            let indexPath:NSIndexPath=tableView.indexPathForSelectedRow! as NSIndexPath
            itemVC.title=shoppinglist.shoplist[indexPath.row]
            itemVC.ShoplistItem=shoppinglist
            itemVC.selectedItem=indexPath.row
        }
    }
    
    func checkorder(DicItem:String)->Int{
        switch DicItem {
            case "Household" :
                return 0
            case "Beverage" :
                return 1
            case "Produce" :
                return 2
            case "Bakery":
                return 3
            case "Meat" :
                return 4
            case "Dairy" :
                return 5
            default :
                return -1
        }
    }
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}

