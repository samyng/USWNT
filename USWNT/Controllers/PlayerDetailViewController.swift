//
//  PlayerDetailViewController.swift
//  USWNT
//
//  Created by Sam Yang on 2/6/16.
//  Copyright © 2016 Sam Yang. All rights reserved.
//

import UIKit

class PlayerDetailViewController: UIViewController {

    var player: Player!
    
    @IBOutlet weak var headshotImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    @IBOutlet weak var clubLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = player.firstName! + " " + player.lastName!
        positionLabel.text = "Position: " + player.position!
        dateOfBirthLabel.text = "Date of Birth: " + player.dateOfBirth!
        heightLabel.text = "Height: " + player.height!
        hometownLabel.text = "Hometown: " + player.hometown!
        clubLabel.text = "Club: " + player.clubName!
        let imageName = player.headshotImageName
        headshotImageView.image = UIImage(named: imageName!)
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
