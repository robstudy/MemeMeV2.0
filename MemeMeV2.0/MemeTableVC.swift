//
//  MemeTableVC.swift
//  MemeMeV2.0
//
//  Created by Robert Garza on 12/3/15.
//  Copyright © 2015 Robert Garza. All rights reserved.
//

import UIKit

class MemeTableVC: UITableViewController {
    
    var memes: [Meme]!{
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        //return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
        return appDelegate.memes
    }
    
    var sendMemeImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        //Register Cell Class
        //self.collectionView!.registerClass(MemeCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        //self.tableView!.registerClass(MemeTVCell.self, forCellReuseIdentifier: "memeTableCell")
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView!.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("memeTableCell", forIndexPath: indexPath) as! MemeTVCell

        // Configure the cell...
        let meme = memes[indexPath.item]
        
        let memeImageView = meme.memeImage
        let memeLayoutText = meme.topText + "..." + meme.bottomText
        
        if let theMemeImage = cell.memeImage {
            theMemeImage.image = memeImageView
        }
        cell.memeText.text = memeLayoutText
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let meme = memes[indexPath.item]
        setDataImage(meme.memeImage!)
        performSegueWithIdentifier("showMemeImage", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showMemeImage"){
            let memeDVC:MemeDVC = segue.destinationViewController as! MemeDVC
            let data = sendMemeImage
            memeDVC.holdImage = data
        }
    }
    
    func setDataImage(sendImage: UIImage){
        sendMemeImage = sendImage
    }
    

    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            let memeIndex = indexPath.item
            (UIApplication.sharedApplication().delegate as!AppDelegate).memes.removeAtIndex(memeIndex)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        })
        return [deleteAction]
    }


    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    
    
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
