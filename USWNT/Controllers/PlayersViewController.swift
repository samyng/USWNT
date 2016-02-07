//
//  PlayersViewController.swift
//  USWNT
//
//  Created by Sam Yang on 2/6/16.
//  Copyright © 2016 Sam Yang. All rights reserved.
//

import UIKit
import CoreData

class PlayersViewController: UICollectionViewController {
    var players = []
    @IBOutlet var playersCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadPlayers()
        playersCollectionView.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadPlayers() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: PLAYER_ENTITY_NAME)
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            let nameSortDescriptor:NSSortDescriptor = NSSortDescriptor(key:"firstName", ascending: true)
            players = (results as NSArray).sortedArrayUsingDescriptors([nameSortDescriptor])
            if (players.count == 0) {
                self.createPlayers()
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func createPlayers() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let playerEntityDescription =  NSEntityDescription.entityForName(PLAYER_ENTITY_NAME,
            inManagedObjectContext:managedContext)
        
        // Current Roster
        let morganBrian = NSManagedObject(entity: playerEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        morganBrian.setValue("Morgan", forKey: FIRST_NAME_ATTRIBUTE_NAME)
        morganBrian.setValue("Brian", forKey: LAST_NAME_ATTRIBUTE_NAME)
        morganBrian.setValue("Midfielder", forKey: POSITION_ATTRIBUTE_NAME)
        morganBrian.setValue("Feb 26, 1993", forKey: DOB_ATTRIBUTE_NAME)
        morganBrian.setValue("5-7", forKey: HEIGHT_ATTRIBUTE_NAME)
        morganBrian.setValue("St. Simons Island, Ga.", forKey: HOMETOWN_ATTRIBUTE_NAME)
        morganBrian.setValue("Houston Dash", forKey: CLUB_NAME_ATTRIBUTE_NAME)
        morganBrian.setValue("morgan-brian", forKey: HEADSHOT_IMAGE_NAME_ATTRIBUTE_NAME)
        
        let crystalDunn = NSManagedObject(entity: playerEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        crystalDunn.setValue("Crystal", forKey: FIRST_NAME_ATTRIBUTE_NAME)
        crystalDunn.setValue("Dunn", forKey: LAST_NAME_ATTRIBUTE_NAME)
        crystalDunn.setValue("Defender", forKey: POSITION_ATTRIBUTE_NAME)
        crystalDunn.setValue("July 3, 1992", forKey: DOB_ATTRIBUTE_NAME)
        crystalDunn.setValue("5-1", forKey: HEIGHT_ATTRIBUTE_NAME)
        crystalDunn.setValue("Rockville Centre, N.Y.", forKey: HOMETOWN_ATTRIBUTE_NAME)
        crystalDunn.setValue("Washington Spirit", forKey: CLUB_NAME_ATTRIBUTE_NAME)
        crystalDunn.setValue("crystal-dunn", forKey: HEADSHOT_IMAGE_NAME_ATTRIBUTE_NAME)
        
        let ashlynHarris = NSManagedObject(entity: playerEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        ashlynHarris.setValue("Ashlyn", forKey: FIRST_NAME_ATTRIBUTE_NAME)
        ashlynHarris.setValue("Harris", forKey: LAST_NAME_ATTRIBUTE_NAME)
        ashlynHarris.setValue("Goalkeeper", forKey: POSITION_ATTRIBUTE_NAME)
        ashlynHarris.setValue("Oct 19, 1985", forKey: DOB_ATTRIBUTE_NAME)
        ashlynHarris.setValue("5-9", forKey: HEIGHT_ATTRIBUTE_NAME)
        ashlynHarris.setValue("Satellite Beach, Fla.", forKey: HOMETOWN_ATTRIBUTE_NAME)
        ashlynHarris.setValue("Orlando Pride", forKey: CLUB_NAME_ATTRIBUTE_NAME)
        ashlynHarris.setValue("ashlyn-harris", forKey: HEADSHOT_IMAGE_NAME_ATTRIBUTE_NAME)
        
        let tobinHeath = NSManagedObject(entity: playerEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        tobinHeath.setValue("Tobin", forKey: FIRST_NAME_ATTRIBUTE_NAME)
        tobinHeath.setValue("Heath", forKey: LAST_NAME_ATTRIBUTE_NAME)
        tobinHeath.setValue("Midfielder", forKey: POSITION_ATTRIBUTE_NAME)
        tobinHeath.setValue("May 29, 1988", forKey: DOB_ATTRIBUTE_NAME)
        tobinHeath.setValue("5-6", forKey: HEIGHT_ATTRIBUTE_NAME)
        tobinHeath.setValue("Basking Ridge, N.J.", forKey: HOMETOWN_ATTRIBUTE_NAME)
        tobinHeath.setValue("Portland Thorns FC", forKey: CLUB_NAME_ATTRIBUTE_NAME)
        tobinHeath.setValue("tobin-heath", forKey: HEADSHOT_IMAGE_NAME_ATTRIBUTE_NAME)
        
        let jaeleneHinkle = NSManagedObject(entity: playerEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        jaeleneHinkle.setValue("Jaelene", forKey: FIRST_NAME_ATTRIBUTE_NAME)
        jaeleneHinkle.setValue("Hinkle", forKey: LAST_NAME_ATTRIBUTE_NAME)
        jaeleneHinkle.setValue("Defender", forKey: POSITION_ATTRIBUTE_NAME)
        jaeleneHinkle.setValue("May 28, 1993", forKey: DOB_ATTRIBUTE_NAME)
        jaeleneHinkle.setValue("5-4", forKey: HEIGHT_ATTRIBUTE_NAME)
        jaeleneHinkle.setValue("Denver, Colo.", forKey: HOMETOWN_ATTRIBUTE_NAME)
        jaeleneHinkle.setValue("Western New York Flash", forKey: CLUB_NAME_ATTRIBUTE_NAME)
        jaeleneHinkle.setValue("jaelene-hinkle", forKey: HEADSHOT_IMAGE_NAME_ATTRIBUTE_NAME)
        
        let lindseyHoran = NSManagedObject(entity: playerEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        lindseyHoran.setValue("Lindsey", forKey: FIRST_NAME_ATTRIBUTE_NAME)
        lindseyHoran.setValue("Horan", forKey: LAST_NAME_ATTRIBUTE_NAME)
        lindseyHoran.setValue("Forward", forKey: POSITION_ATTRIBUTE_NAME)
        lindseyHoran.setValue("May 26, 1994", forKey: DOB_ATTRIBUTE_NAME)
        lindseyHoran.setValue("5-9", forKey: HEIGHT_ATTRIBUTE_NAME)
        lindseyHoran.setValue("Golden, Colo.", forKey: HOMETOWN_ATTRIBUTE_NAME)
        lindseyHoran.setValue("Portland Thorns FC", forKey: CLUB_NAME_ATTRIBUTE_NAME)
        lindseyHoran.setValue("lindsey-horan", forKey: HEADSHOT_IMAGE_NAME_ATTRIBUTE_NAME)
        
        let julieJohnston = NSManagedObject(entity: playerEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        julieJohnston.setValue("Julie", forKey: FIRST_NAME_ATTRIBUTE_NAME)
        julieJohnston.setValue("Johnston", forKey: LAST_NAME_ATTRIBUTE_NAME)
        julieJohnston.setValue("Defender", forKey: POSITION_ATTRIBUTE_NAME)
        julieJohnston.setValue("Apr 6, 1992", forKey: DOB_ATTRIBUTE_NAME)
        julieJohnston.setValue("5-7", forKey: HEIGHT_ATTRIBUTE_NAME)
        julieJohnston.setValue("Mesa, Arix.", forKey: HOMETOWN_ATTRIBUTE_NAME)
        julieJohnston.setValue("Chicago Red Stars", forKey: CLUB_NAME_ATTRIBUTE_NAME)
        julieJohnston.setValue("julie-johnston", forKey: HEADSHOT_IMAGE_NAME_ATTRIBUTE_NAME)
        
        let meghanKlingenberg = NSManagedObject(entity: playerEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        meghanKlingenberg.setValue("Meghan", forKey: FIRST_NAME_ATTRIBUTE_NAME)
        meghanKlingenberg.setValue("Klingenberg", forKey: LAST_NAME_ATTRIBUTE_NAME)
        meghanKlingenberg.setValue("Defender", forKey: POSITION_ATTRIBUTE_NAME)
        meghanKlingenberg.setValue("Aug 2, 1988", forKey: DOB_ATTRIBUTE_NAME)
        meghanKlingenberg.setValue("5-2", forKey: HEIGHT_ATTRIBUTE_NAME)
        meghanKlingenberg.setValue("Gibsonia, Pa.", forKey: HOMETOWN_ATTRIBUTE_NAME)
        meghanKlingenberg.setValue("Portland Thorns FC", forKey: CLUB_NAME_ATTRIBUTE_NAME)
        meghanKlingenberg.setValue("meghan-klingenberg", forKey: HEADSHOT_IMAGE_NAME_ATTRIBUTE_NAME)
        
        let aliKrieger = NSManagedObject(entity: playerEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        aliKrieger.setValue("Ali", forKey: FIRST_NAME_ATTRIBUTE_NAME)
        aliKrieger.setValue("Krieger", forKey: LAST_NAME_ATTRIBUTE_NAME)
        aliKrieger.setValue("Defender", forKey: POSITION_ATTRIBUTE_NAME)
        aliKrieger.setValue("Jul 28, 1984", forKey: DOB_ATTRIBUTE_NAME)
        aliKrieger.setValue("5-6", forKey: HEIGHT_ATTRIBUTE_NAME)
        aliKrieger.setValue("Dumfries, Va.", forKey: HOMETOWN_ATTRIBUTE_NAME)
        aliKrieger.setValue("Washington Spirit", forKey: CLUB_NAME_ATTRIBUTE_NAME)
        aliKrieger.setValue("ali-krieger", forKey: HEADSHOT_IMAGE_NAME_ATTRIBUTE_NAME)
        
        let carliLloyd = NSManagedObject(entity: playerEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        carliLloyd.setValue("Carli", forKey: FIRST_NAME_ATTRIBUTE_NAME)
        carliLloyd.setValue("Lloyd", forKey: LAST_NAME_ATTRIBUTE_NAME)
        carliLloyd.setValue("Midfielder", forKey: POSITION_ATTRIBUTE_NAME)
        carliLloyd.setValue("Jul 16, 1982", forKey: DOB_ATTRIBUTE_NAME)
        carliLloyd.setValue("5-8", forKey: HEIGHT_ATTRIBUTE_NAME)
        carliLloyd.setValue("Delran, N.J.", forKey: HOMETOWN_ATTRIBUTE_NAME)
        carliLloyd.setValue("Houston Dash", forKey: CLUB_NAME_ATTRIBUTE_NAME)
        carliLloyd.setValue("carli-lloyd", forKey: HEADSHOT_IMAGE_NAME_ATTRIBUTE_NAME)
        
        let stephanieMcCaffrey = NSManagedObject(entity: playerEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        stephanieMcCaffrey.setValue("Stephanie", forKey: FIRST_NAME_ATTRIBUTE_NAME)
        stephanieMcCaffrey.setValue("McCaffrey", forKey: LAST_NAME_ATTRIBUTE_NAME)
        stephanieMcCaffrey.setValue("Forward", forKey: POSITION_ATTRIBUTE_NAME)
        stephanieMcCaffrey.setValue("Feb 18, 1993", forKey: DOB_ATTRIBUTE_NAME)
        stephanieMcCaffrey.setValue("5-6", forKey: HEIGHT_ATTRIBUTE_NAME)
        stephanieMcCaffrey.setValue("Winchester, Mass.", forKey: HOMETOWN_ATTRIBUTE_NAME)
        stephanieMcCaffrey.setValue("Boston Breakers", forKey: CLUB_NAME_ATTRIBUTE_NAME)
        stephanieMcCaffrey.setValue("stephanie-mccaffrey", forKey: HEADSHOT_IMAGE_NAME_ATTRIBUTE_NAME)
        
        let samanthaMewis = NSManagedObject(entity: playerEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        samanthaMewis.setValue("Samantha", forKey: FIRST_NAME_ATTRIBUTE_NAME)
        samanthaMewis.setValue("Mewis", forKey: LAST_NAME_ATTRIBUTE_NAME)
        samanthaMewis.setValue("Midfielder", forKey: POSITION_ATTRIBUTE_NAME)
        samanthaMewis.setValue("Oct 9, 1992", forKey: DOB_ATTRIBUTE_NAME)
        samanthaMewis.setValue("6-0", forKey: HEIGHT_ATTRIBUTE_NAME)
        samanthaMewis.setValue("Hanson, Mass.", forKey: HOMETOWN_ATTRIBUTE_NAME)
        samanthaMewis.setValue("Western New York Flash", forKey: CLUB_NAME_ATTRIBUTE_NAME)
        samanthaMewis.setValue("samantha-mewis", forKey: HEADSHOT_IMAGE_NAME_ATTRIBUTE_NAME)
        
        let alexMorgan = NSManagedObject(entity: playerEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        alexMorgan.setValue("Alex", forKey: FIRST_NAME_ATTRIBUTE_NAME)
        alexMorgan.setValue("Morgan", forKey: LAST_NAME_ATTRIBUTE_NAME)
        alexMorgan.setValue("Forward", forKey: POSITION_ATTRIBUTE_NAME)
        alexMorgan.setValue("Jul 2, 1989", forKey: DOB_ATTRIBUTE_NAME)
        alexMorgan.setValue("5-7", forKey: HEIGHT_ATTRIBUTE_NAME)
        alexMorgan.setValue("Diamond Bar, Calif.", forKey: HOMETOWN_ATTRIBUTE_NAME)
        alexMorgan.setValue("Orlando Pride", forKey: CLUB_NAME_ATTRIBUTE_NAME)
        alexMorgan.setValue("alex-morgan", forKey: HEADSHOT_IMAGE_NAME_ATTRIBUTE_NAME)
        
        let alyssaNaeher = NSManagedObject(entity: playerEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        alyssaNaeher.setValue("Alyssa", forKey: FIRST_NAME_ATTRIBUTE_NAME)
        alyssaNaeher.setValue("Naeher", forKey: LAST_NAME_ATTRIBUTE_NAME)
        alyssaNaeher.setValue("Goalkeeper", forKey: POSITION_ATTRIBUTE_NAME)
        alyssaNaeher.setValue("Apr 20, 1988", forKey: DOB_ATTRIBUTE_NAME)
        alyssaNaeher.setValue("5-9", forKey: HEIGHT_ATTRIBUTE_NAME)
        alyssaNaeher.setValue("Bridgeport, Conn.", forKey: HOMETOWN_ATTRIBUTE_NAME)
        alyssaNaeher.setValue("Chicago Red Stars", forKey: CLUB_NAME_ATTRIBUTE_NAME)
        alyssaNaeher.setValue("alyssa-naeher", forKey: HEADSHOT_IMAGE_NAME_ATTRIBUTE_NAME)
        
        let kelleyOhara = NSManagedObject(entity: playerEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        kelleyOhara.setValue("Kelley", forKey: FIRST_NAME_ATTRIBUTE_NAME)
        kelleyOhara.setValue("O'Hara", forKey: LAST_NAME_ATTRIBUTE_NAME)
        kelleyOhara.setValue("Defender", forKey: POSITION_ATTRIBUTE_NAME)
        kelleyOhara.setValue("Aug 4, 1988", forKey: DOB_ATTRIBUTE_NAME)
        kelleyOhara.setValue("5-5", forKey: HEIGHT_ATTRIBUTE_NAME)
        kelleyOhara.setValue("Fayetteville, Ga.", forKey: HOMETOWN_ATTRIBUTE_NAME)
        kelleyOhara.setValue("Sky Blue FC", forKey: CLUB_NAME_ATTRIBUTE_NAME)
        kelleyOhara.setValue("kelley-ohara", forKey: HEADSHOT_IMAGE_NAME_ATTRIBUTE_NAME)
        
        let christenPress = NSManagedObject(entity: playerEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        christenPress.setValue("Christen", forKey: FIRST_NAME_ATTRIBUTE_NAME)
        christenPress.setValue("Press", forKey: LAST_NAME_ATTRIBUTE_NAME)
        christenPress.setValue("Forward", forKey: POSITION_ATTRIBUTE_NAME)
        christenPress.setValue("Dec 29, 1988", forKey: DOB_ATTRIBUTE_NAME)
        christenPress.setValue("5-7", forKey: HEIGHT_ATTRIBUTE_NAME)
        christenPress.setValue("Palos Verdes Estate, Calif.", forKey: HOMETOWN_ATTRIBUTE_NAME)
        christenPress.setValue("Chicago Red Stars", forKey: CLUB_NAME_ATTRIBUTE_NAME)
        christenPress.setValue("christen-press", forKey: HEADSHOT_IMAGE_NAME_ATTRIBUTE_NAME)
        
        let malloryPugh = NSManagedObject(entity: playerEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        malloryPugh.setValue("Mallory", forKey: FIRST_NAME_ATTRIBUTE_NAME)
        malloryPugh.setValue("Pugh", forKey: LAST_NAME_ATTRIBUTE_NAME)
        malloryPugh.setValue("Forward", forKey: POSITION_ATTRIBUTE_NAME)
        malloryPugh.setValue("Apr 29, 1998", forKey: DOB_ATTRIBUTE_NAME)
        malloryPugh.setValue("5-4", forKey: HEIGHT_ATTRIBUTE_NAME)
        malloryPugh.setValue("Highland Ranch, Colo.", forKey: HOMETOWN_ATTRIBUTE_NAME)
        malloryPugh.setValue("Real Colorado", forKey: CLUB_NAME_ATTRIBUTE_NAME)
        malloryPugh.setValue("mallory-pugh", forKey: HEADSHOT_IMAGE_NAME_ATTRIBUTE_NAME)
        
        let beckySauerbrunn = NSManagedObject(entity: playerEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        beckySauerbrunn.setValue("Becky", forKey: FIRST_NAME_ATTRIBUTE_NAME)
        beckySauerbrunn.setValue("Sauerbrunn", forKey: LAST_NAME_ATTRIBUTE_NAME)
        beckySauerbrunn.setValue("Defender", forKey: POSITION_ATTRIBUTE_NAME)
        beckySauerbrunn.setValue("Jun 6, 1985", forKey: DOB_ATTRIBUTE_NAME)
        beckySauerbrunn.setValue("5-7", forKey: HEIGHT_ATTRIBUTE_NAME)
        beckySauerbrunn.setValue("St. Louis, Mo.", forKey: HOMETOWN_ATTRIBUTE_NAME)
        beckySauerbrunn.setValue("FC Kansas City", forKey: CLUB_NAME_ATTRIBUTE_NAME)
        beckySauerbrunn.setValue("becky-sauerbrunn", forKey: HEADSHOT_IMAGE_NAME_ATTRIBUTE_NAME)
        
        let hopeSolo = NSManagedObject(entity: playerEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        hopeSolo.setValue("Hope", forKey: FIRST_NAME_ATTRIBUTE_NAME)
        hopeSolo.setValue("Solo", forKey: LAST_NAME_ATTRIBUTE_NAME)
        hopeSolo.setValue("Defender", forKey: POSITION_ATTRIBUTE_NAME)
        hopeSolo.setValue("Jul 30, 1981", forKey: DOB_ATTRIBUTE_NAME)
        hopeSolo.setValue("5-9", forKey: HEIGHT_ATTRIBUTE_NAME)
        hopeSolo.setValue("Richland, Wash.", forKey: HOMETOWN_ATTRIBUTE_NAME)
        hopeSolo.setValue("Seattle Reign FC", forKey: CLUB_NAME_ATTRIBUTE_NAME)
        hopeSolo.setValue("hope-solo", forKey: HEADSHOT_IMAGE_NAME_ATTRIBUTE_NAME)
        
        let emilySonnett = NSManagedObject(entity: playerEntityDescription!,
            insertIntoManagedObjectContext: managedContext)
        emilySonnett.setValue("Emily", forKey: FIRST_NAME_ATTRIBUTE_NAME)
        emilySonnett.setValue("Sonnett", forKey: LAST_NAME_ATTRIBUTE_NAME)
        emilySonnett.setValue("Defender", forKey: POSITION_ATTRIBUTE_NAME)
        emilySonnett.setValue("Nov 25, 1993", forKey: DOB_ATTRIBUTE_NAME)
        emilySonnett.setValue("5-7", forKey: HEIGHT_ATTRIBUTE_NAME)
        emilySonnett.setValue("Marietta, Ga.", forKey: HOMETOWN_ATTRIBUTE_NAME)
        emilySonnett.setValue("Portland Thorns FC", forKey: CLUB_NAME_ATTRIBUTE_NAME)
        emilySonnett.setValue("emily-sonnett", forKey: HEADSHOT_IMAGE_NAME_ATTRIBUTE_NAME)
        
        players = [morganBrian, crystalDunn, ashlynHarris, tobinHeath, jaeleneHinkle, lindseyHoran, julieJohnston, meghanKlingenberg, aliKrieger, carliLloyd, stephanieMcCaffrey, samanthaMewis, alexMorgan, alyssaNaeher, kelleyOhara, christenPress, malloryPugh, beckySauerbrunn, hopeSolo, emilySonnett]
        
        //4
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("kPlayerCollectionCellIdentifier", forIndexPath: indexPath) as! PlayerCollectionViewCell
        let player = players.objectAtIndex(indexPath.item) as! Player
        cell.nameLabel.text = player.firstName! + " " + player.lastName!
        cell.headshotImageView.image = UIImage(named: player.headshotImageName!)
        return cell
    }
    
    @IBAction override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let cell = sender as! PlayerCollectionViewCell
        let indexPath = playersCollectionView .indexPathForCell(cell)
        let item = indexPath?.item
        let detailViewController = segue.destinationViewController as! PlayerDetailViewController
        detailViewController.player = players.objectAtIndex(item!) as! Player
        print(detailViewController.player.firstName)
    }

}
