//
//  PageViewController.swift
//  PruebaPaged
//
//  Created by Alejandro Rodriguez on 10/9/15.
//  Copyright © 2015 Alejandro Rodriguez. All rights reserved.
//

import UIKit

class PageViewController: UIViewController, UIPageViewControllerDataSource {

    var vcs:Array<UIViewController>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - UIPageViewControllerDataSource
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! PagedContentViewController
        var index = vc.pageIndex!
        
        if index == 0 || index == NSNotFound{
            return nil
        }
        
        index--
        
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! PagedContentViewController
        var index = vc.pageIndex!
        
        if  index == NSNotFound || index == vcs?.count{
            return nil
        }
        
        index++
        
        return viewControllerAtIndex(index)
    }
    
    func viewControllerAtIndex(index:Int) ->PagedContentViewController{
        
        if vcs?.count == 0 || index >= vcs?.count{
            return PagedContentViewController()
        }
        
        
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("") as! PagedContentViewController
        
        vc.pageTitle = "\(index)"
        
        return vc
    }
    
    

}
