//
//  DetailViewController.swift
//  Shopping Helper
//
//  Created by Sean Lin on 11/5/14.
//  Copyright (c) 2014 Sean Lin. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    var items = [String]()
    var selectedItem = 0
    
    var ShoplistItem = Shoplist()
    
    override func viewWillAppear(_ animated: Bool) {
        ShoplistItem.shoplist = ShoplistItem.shoplistData.allKeys as! [String]
        let chosenCatergory = ShoplistItem.shoplist[selectedItem]
        items = ShoplistItem.shoplistData.object(forKey: chosenCatergory) as! [String]
        NSLog("view appear \(items)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         //self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return items.count
    }

 
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as UITableViewCell

        cell.textLabel!.text=items[indexPath.row]
        
        return cell
    }
    

   
    
    // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    

    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            let chosenCatergory = ShoplistItem.shoplist[selectedItem] //deletes from the data model
            (ShoplistItem.shoplistData[chosenCatergory] as! NSMutableArray).remove(indexPath.row)
            
            //delete the row from the data source
            tableView.deleteRows(at: [indexPath as IndexPath], with: .fade) }
    }
    @IBAction func unwindSegue (segue:UIStoryboardSegue){
        if segue.identifier=="donesegue"{
            let source = segue.source as! ItemViewController
            if !source.addItem.isEmpty{
                items.append(source.addItem)
                tableView.reloadData()
                let chosenCatergory = ShoplistItem.shoplist[selectedItem]
                (ShoplistItem.shoplistData[chosenCatergory] as AnyObject).add(source.addItem)
            }
        }
    }

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
