//
//  MemeDVC.swift
//  MemeMeV2.0
//
//  Created by Robert Garza on 12/7/15.
//  Copyright © 2015 Robert Garza. All rights reserved.
//

import UIKit

class MemeDVC: UIViewController {
    
    @IBOutlet weak var memeImage:UIImageView!
    
    //Hold data to passed from other viewcontrollers
    var holdIndex = 0
    
    //MARK: - View Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        memeImage.contentMode = UIViewContentMode.ScaleAspectFit
    }
    
    override func viewWillAppear(animated: Bool) {
        memeImage.image = (UIApplication.sharedApplication().delegate as!AppDelegate).memes[holdIndex].memeImage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    @IBAction func editMeme(sender: UIBarButtonItem) {
        performSegueWithIdentifier("editMeme", sender: self)

    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "editMeme"){
            let editVC: MemeMeViewController = segue.destinationViewController as! MemeMeViewController
            editVC.calledByMemeDVC = true
            editVC.indexFromMemeDVC = holdIndex
        }
    }


}
