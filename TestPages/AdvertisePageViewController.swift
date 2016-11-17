//
//  AdvertisePageViewController.swift
//  TestPages
//
//  Created by mico on 17/11/2016.
//  Copyright © 2016 partyspy. All rights reserved.
//

import UIKit

let screenW = UIScreen.main.bounds.width
let screenH = UIScreen.main.bounds.height
let screenS = CGSize(width: screenW, height: screenH)

class AdvertisePageViewController: UIViewController, UIScrollViewDelegate {

    var pageCtrl: UIPageControl!
    var beginDraggingOffsetX: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenW, height: screenH))
        scrollView.contentSize = CGSize(width: screenW * 3, height: screenH)
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        
        //The key move!
        scrollView.isPagingEnabled = true
        
        self.view.addSubview(scrollView)
        
        let image1 = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: screenS))
        let image2 = UIImageView(frame: CGRect(origin: CGPoint(x: screenW, y: 0), size: screenS))
        let image3 = UIImageView(frame: CGRect(origin: CGPoint(x: screenW * 2, y: 0), size: screenS))
        image1.image =  UIImage(named: "ad_01")
        image2.image =  UIImage(named: "ad_02")
        image3.image =  UIImage(named: "ad_03")
        scrollView.addSubview(image1)
        scrollView.addSubview(image2)
        scrollView.addSubview(image3)
        
        pageCtrl = UIPageControl(frame: CGRect(x: 0, y: screenH-30, width: screenW, height: 30))
        pageCtrl.numberOfPages = 3
        pageCtrl.currentPageIndicatorTintColor = UIColor.orange
        pageCtrl.pageIndicatorTintColor = UIColor.lightGray
        pageCtrl.currentPage = 0
        self.view.addSubview(pageCtrl)
        self.view.bringSubview(toFront: pageCtrl)
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let xOffset = scrollView.contentOffset.x
        if xOffset < 0.5 * screenW {
            pageCtrl.currentPage = 0
        } else if xOffset > 0.5 * screenW && xOffset < 1.5 * screenW {
            pageCtrl.currentPage = 1
        } else {
            pageCtrl.currentPage = 2
        }
    }
}
