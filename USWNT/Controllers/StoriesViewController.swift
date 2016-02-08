//
//  StoriesViewController.swift
//  USWNT
//
//  Created by Sam Yang on 2/7/16.
//  Copyright © 2016 Sam Yang. All rights reserved.
//

import UIKit

class StoriesViewController: UIViewController {

    @IBOutlet weak var storiesWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.storiesWebView.loadRequest(NSURLRequest(URL: NSURL(string: "http://www.ussoccer.com/stories")!))
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
