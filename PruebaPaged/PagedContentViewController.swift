//
//  PagedContentViewController.swift
//  PruebaPaged
//
//  Created by Alejandro Rodriguez on 10/9/15.
//  Copyright © 2015 Alejandro Rodriguez. All rights reserved.
//

import UIKit

protocol ContentViewDelegate{
    
    func pageWasShown(view:UIViewController,withIndex index:Int)
}


@objc class PagedContentViewController: UIViewController {

    @IBOutlet weak var lblPageTitle: UILabel!
    
    var pageIndex : Int?
    var pageTitle : String?
    
    var delegate:ContentViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         lblPageTitle.text = pageTitle
        view.backgroundColor = .greenColor()
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let delegate = delegate{
            delegate.pageWasShown(self, withIndex:pageIndex!)
        }
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
