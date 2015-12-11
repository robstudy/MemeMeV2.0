//
//  MemeMeCollectionVC.swift
//  MemeMeV2.0
//
//  Created by Robert Garza on 11/30/15.
//  Copyright © 2015 Robert Garza. All rights reserved.
//

import UIKit

private let reuseIdentifier = "memeCell"

class MemeMeCollectionVC: UICollectionViewController {
    
    var memes: [Meme]!{
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    //data to pass to MemeMeDVC
    var sendIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView?.backgroundColor = UIColor.whiteColor()

        // Register cell classes
        self.collectionView!.registerClass(MemeCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        let space: CGFloat = 3.0
        let dimension = (self.view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSizeMake(dimension, dimension)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.collectionView!.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section < 4){
            return memes.count
        } else {
            return 3
        }
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MemeCollectionViewCell
        
        let meme = memes[indexPath.item]
    
        let imageView = UIImageView(image: meme.memeImage)
        cell.backgroundView = imageView
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let index = indexPath.row
        
        passDataToMemeDVC(index)
        
        performSegueWithIdentifier("showMemeImage", sender: self)
    }
    
    //MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showMemeImage"){
            let memeDVC:MemeDVC = segue.destinationViewController as! MemeDVC
            memeDVC.holdIndex = sendIndex
        }
    }
    
    func passDataToMemeDVC(index: Int){
        sendIndex = index
    }
}
