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
        return appDelegate.memes
    }
    
    //data to pass to MemeMeDVC
    var sendMemeImage: UIImage?
    var sendImageNoText: UIImage?
    var sendTopText: String?
    var sendBottomText: String?
    
    // MARK: - Loaded Views

    override func viewDidLoad() {
        super.viewDidLoad()
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
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        passDataToMemeDVC(meme.memeImage!, regImage: meme.image!, topText: meme.topText, bottomText: meme.bottomText)
        performSegueWithIdentifier("showMemeImage", sender: self)
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
    
    //MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showMemeImage"){
            let memeDVC:MemeDVC = segue.destinationViewController as! MemeDVC
            memeDVC.holdImage = sendMemeImage
            memeDVC.holdBlankImage = sendImageNoText
            memeDVC.holdTopText = sendTopText
            memeDVC.holdBottomText = sendBottomText
        }
    }
    
    func passDataToMemeDVC(sendCompleteImage: UIImage, regImage: UIImage, topText: String, bottomText:String){
        sendMemeImage = sendCompleteImage
        sendImageNoText = regImage
        sendTopText = topText
        sendBottomText = bottomText
    }
}
