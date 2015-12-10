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
    var holdImage:UIImage?
    var holdTopText:String?
    var holdBottomText:String?
    var holdBlankImage:UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        memeImage.image = holdImage
        memeImage.contentMode = UIViewContentMode.ScaleAspectFit
        print("\(holdBottomText) \(holdTopText) \(holdBlankImage)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "editMeme"){
            let editVC: MemeMeViewController = segue.destinationViewController as! MemeMeViewController
        }
    }


}
