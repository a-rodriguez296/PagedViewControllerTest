//
//  ViewController.swift
//  PruebaPaged
//
//  Created by Alejandro Rodriguez on 10/9/15.
//  Copyright © 2015 Alejandro Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate, ContentViewDelegate {

    let vc1 = "vc1"
    let vc2 = "vc2"
    
    
    var pageViewController: UIPageViewController?
    var pageTitles: Array<String>?
    
    
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    
    
    @IBOutlet var btns: [UIButton]!
    
    func pageWasShown(view: UIViewController, withIndex index: Int) {
        enableButtons()
        btns![index].enabled = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pageTitles = [vc1, vc2]
        
        pageViewController = storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as? UIPageViewController
        pageViewController!.dataSource = self
        pageViewController?.delegate = self
        
        
        let startVC = self.viewControllerAtIndex(0) as PagedContentViewController
        let viewControllers = [startVC]
        
        pageViewController?.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: nil)
        
        pageViewController!.view.frame = CGRectMake(0, 80, self.view.frame.width, self.view.frame.size.height - 100)
        pageViewController?.view.backgroundColor = UIColor.redColor()
        
        addChildViewController(pageViewController!)
        view.addSubview(pageViewController!.view)
        pageViewController!.didMoveToParentViewController(self)
        
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
        
        if  index == NSNotFound {
            return nil
        }
        
        index++
       
        if index == pageTitles?.count{
            return nil
        }
        
        return viewControllerAtIndex(index)
    }
    


    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed == true{
            let currentVC = previousViewControllers[0] as! PagedContentViewController
            
            print(currentVC.pageIndex!)
        }
    }
    
    func viewControllerAtIndex(index:Int) ->PagedContentViewController{
        
        if pageTitles?.count == 0 || index >= pageTitles?.count{
            return PagedContentViewController()
        }
        
        
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("PagedContentViewController") as! PagedContentViewController
        
        vc.pageIndex = index
        vc.pageTitle = "\(index)"
        vc.delegate = self
        
        return vc
    }

    @IBAction func btn1(sender: AnyObject) {
        
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("PagedContentViewController") as! PagedContentViewController
        
        vc.pageIndex = 0
        vc.pageTitle = "\(0)"
        vc.delegate = self
        
        pageViewController?.setViewControllers([vc], direction: .Reverse, animated: true, completion: nil)
        
    }

    
    @IBAction func btn2(sender: AnyObject) {
        
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("PagedContentViewController") as! PagedContentViewController
        
        vc.pageIndex = 1
        vc.pageTitle = "\(1)"
        vc.delegate = self
        
        
        pageViewController?.setViewControllers([vc], direction: .Forward, animated: true, completion: nil)
    }
    
    func enableButtons(){
        for button in btns{
            button.enabled = true
        }
    }

}

