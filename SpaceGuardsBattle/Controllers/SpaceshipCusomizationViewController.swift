//
//  SpaceshipCusomization.swift
//  SpaceGuardsBattle
//
//  Created by Cristina Buccino on 25/02/22.
//

import Foundation
import UIKit
import SwiftUI
class SpaceshipCustomizationViewController: UIViewController {
    @IBAction func dismissPopup(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
        
    }

    @IBOutlet weak var chooseyourshipLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    
    
    @IBOutlet weak var shipSelected: UIImageView!
    

    override func viewDidLoad() {
        
    
        
        chooseyourshipLabel.layer.borderWidth = 1.0
        chooseyourshipLabel.layer.cornerRadius = 8
       chooseyourshipLabel.layer.borderColor = UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1).cgColor;
        shipSelected.image = UIImage(named: NavType.sharedGameData.type + NavType.sharedGameData.form + NavType.sharedGameData.color)
//        segmentedBodies.selectedSegmentIndex = 0
        bodiesChange(segmentedBodies)
        
//         STROKES AND CORNER RADIUS
        
        button1.layer.borderWidth = 2.0
        button1.layer.borderColor = UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1).cgColor;
        button1.layer.cornerRadius = 10
        
        button2.layer.borderWidth = 2.0
        button2.layer.borderColor = UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1).cgColor;
        button2.layer.cornerRadius = 10
        
        button3.layer.borderWidth = 2.0
        button3.layer.borderColor = UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1).cgColor;
        button3.layer.cornerRadius = 10
        
        button4.layer.borderWidth = 2.0
        button4.layer.borderColor = UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1).cgColor;
        button4.layer.cornerRadius = 10
        
        button5.layer.borderWidth = 2.0
        button5.layer.borderColor = UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1).cgColor;
        button5.layer.cornerRadius = 10
        
        button6.layer.borderWidth = 2.0
        button6.layer.borderColor = UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1).cgColor;
        button6.layer.cornerRadius = 10

        
    
    }
       
    
//    ROMBI
//    rosse
    let imageq1r = UIImage(named: "1qr")
    let imageq2r = UIImage(named: "2qr")
    let imageq3r = UIImage(named: "3qr")
    let imageq4r = UIImage(named: "4qr")
    let imageq5r = UIImage(named: "5qr")
    let imageq6r = UIImage(named: "6qr")
//    verdi
    let imageq1v = UIImage(named: "1qv")
    let imageq2v = UIImage(named: "2qv")
    let imageq3v = UIImage(named: "3qv")
    let imageq4v = UIImage(named: "4qv")
    let imageq5v = UIImage(named: "5qv")
    let imageq6v = UIImage(named: "6qv")
//    violet
    let imageq1violet = UIImage(named: "1qviola")
    let imageq2violet = UIImage(named: "2qviola")
    let imageq3violet = UIImage(named: "3qviola")
    let imageq4violet = UIImage(named: "4qviola")
    let imageq5violet = UIImage(named: "5qviola")
    let imageq6violet = UIImage(named: "6qviola")
//    blu
    let imageq1b = UIImage(named: "1qb")
    let imageq2b = UIImage(named: "2qb")
    let imageq3b = UIImage(named: "3qb")
    let imageq4b = UIImage(named: "4qb")
    let imageq5b = UIImage(named: "5qb")
    let imageq6b = UIImage(named: "6qb")
    
    
    
//    CERCHIO
//    rosse
    let imagec1r = UIImage(named: "1cr")
    let imagec2r = UIImage(named: "2cr")
    let imagec3r = UIImage(named: "3cr")
    let imagec4r = UIImage(named: "4cr")
    let imagec5r = UIImage(named: "5cr")
    let imagec6r = UIImage(named: "6cr")
//    verdi
    let imagec1v = UIImage(named: "1cv")
    let imagec2v = UIImage(named: "2cv")
    let imagec3v = UIImage(named: "3cv")
    let imagec4v = UIImage(named: "4cv")
    let imagec5v = UIImage(named: "5cv")
    let imagec6v = UIImage(named: "6cv")
//    viola
    let imagec1violet = UIImage(named: "1cviola")
    let imagec2violet = UIImage(named: "2cviola")
    let imagec3violet = UIImage(named: "3cviola")
    let imagec4violet = UIImage(named: "4cviola")
    let imagec5violet = UIImage(named: "5cviola")
    let imagec6violet = UIImage(named: "6cviola")
//    blu
    let imagec1b = UIImage(named: "1cb")
    let imagec2b = UIImage(named: "2cb")
    let imagec3b = UIImage(named: "3cb")
    let imagec4b = UIImage(named: "4cb")
    let imagec5b = UIImage(named: "5cb")
    let imagec6b = UIImage(named: "6cb")
    
   
    @IBOutlet weak var segmentedBodies: UISegmentedControl!
    @IBOutlet weak var done: UIButton!
   
    
    @IBOutlet weak var ship1: UIButton!
    @IBOutlet weak var ship2: UIButton!
    @IBOutlet weak var ship3: UIButton!
    @IBOutlet weak var ship4: UIButton!
    @IBOutlet weak var ship5: UIButton!
    @IBOutlet weak var ship6: UIButton!
    
    @IBAction func type1(_ sender: UIButton) {
        
        NavType.sharedGameData.type = "1"
        shipSelected.image = UIImage(named:  NavType.sharedGameData.type + NavType.sharedGameData.form + NavType.sharedGameData.color )
    }
    
    @IBAction func type2(_ sender: UIButton) {
        
        NavType.sharedGameData.type = "2"
        shipSelected.image = UIImage(named: NavType.sharedGameData.type + NavType.sharedGameData.form + NavType.sharedGameData.color)
    }
    
    @IBAction func type3(_ sender: UIButton) {
        
        NavType.sharedGameData.type = "3"
        shipSelected.image = UIImage(named: NavType.sharedGameData.type + NavType.sharedGameData.form + NavType.sharedGameData.color)
    }
    
    @IBAction func type4(_ sender: UIButton) {
        
        NavType.sharedGameData.type = "4"
        shipSelected.image = UIImage(named: NavType.sharedGameData.type + NavType.sharedGameData.form + NavType.sharedGameData.color)
    }
    
    @IBAction func type5(_ sender: UIButton) {
        
        NavType.sharedGameData.type = "5"
        shipSelected.image = UIImage(named: NavType.sharedGameData.type + NavType.sharedGameData.form + NavType.sharedGameData.color)
    }
    
    @IBAction func type6(_ sender: UIButton) {
        
        NavType.sharedGameData.type = "6"
        shipSelected.image = UIImage(named: NavType.sharedGameData.type + NavType.sharedGameData.form + NavType.sharedGameData.color)
    }
    
    
//    CAMBIO FORME NAVICELLE
    @IBAction func bodiesChange(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0 :
            
            NavType.sharedGameData.form = "q"
            
            ship1.setImage(imageq1r, for: .normal)
            ship2.setImage(imageq2r, for: .normal)
            ship3.setImage(imageq3r, for: .normal)
            ship4.setImage(imageq4r, for: .normal)
            ship5.setImage(imageq5r, for: .normal)
            ship6.setImage(imageq6r, for: .normal)
            
            
            button1.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
            button2.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
            button3.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
            button4.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
            button5.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
            button6.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
            shipSelected.image = UIImage(named: NavType.sharedGameData.type + NavType.sharedGameData.form + NavType.sharedGameData.color)
           
        case 1 :
            NavType.sharedGameData.form = "c"
            ship1.setImage(imagec1r, for: .normal)
            ship2.setImage(imagec2r, for: .normal)
            ship3.setImage(imagec3r, for: .normal)
            ship4.setImage(imagec4r, for: .normal)
            ship5.setImage(imagec5r, for: .normal)
            ship6.setImage(imagec6r, for: .normal)
            
            
            button1.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
            button2.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
            button3.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
            button4.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
            button5.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
            button6.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
            
            shipSelected.image = UIImage(named: NavType.sharedGameData.type + NavType.sharedGameData.form + NavType.sharedGameData.color)
        default :
            break
           }
        
        
    }
    
    
//  CAMBIO COLORI
    
//    ARANCIONE
    @IBAction func orangeButton(_ sender: Any) {

        NavType.sharedGameData.color = "r"
        
        if segmentedBodies.selectedSegmentIndex == 0
        {

            ship1.setImage(imageq1r, for: .normal)
            ship2.setImage(imageq2r, for: .normal)
            ship3.setImage(imageq3r, for: .normal)
            ship4.setImage(imageq4r, for: .normal)
            ship5.setImage(imageq5r, for: .normal)
            ship6.setImage(imageq6r, for: .normal)
            shipSelected.image = UIImage(named: NavType.sharedGameData.type + NavType.sharedGameData.form + NavType.sharedGameData.color)
        }
        else{
            
            ship1.setImage(imagec1r, for: .normal)
            ship2.setImage(imagec2r, for: .normal)
            ship3.setImage(imagec3r, for: .normal)
            ship4.setImage(imagec4r, for: .normal)
            ship5.setImage(imagec5r, for: .normal)
            ship6.setImage(imagec6r, for: .normal)
            shipSelected.image = UIImage(named: NavType.sharedGameData.type + NavType.sharedGameData.form + NavType.sharedGameData.color)
            
        }
    }
    
//    VERDE
    
    @IBAction func greenButton(_ sender: Any) {
        
        NavType.sharedGameData.color = "v"
        if segmentedBodies.selectedSegmentIndex == 0
        {

            ship1.setImage(imageq1v, for: .normal)
            ship2.setImage(imageq2v, for: .normal)
            ship3.setImage(imageq3v, for: .normal)
            ship4.setImage(imageq4v, for: .normal)
            ship5.setImage(imageq5v, for: .normal)
            ship6.setImage(imageq6v, for: .normal)
            shipSelected.image = UIImage(named: NavType.sharedGameData.type + NavType.sharedGameData.form + NavType.sharedGameData.color)
        }
        else{
            
            ship1.setImage(imagec1v, for: .normal)
            ship2.setImage(imagec2v, for: .normal)
            ship3.setImage(imagec3v, for: .normal)
            ship4.setImage(imagec4v, for: .normal)
            ship5.setImage(imagec5v, for: .normal)
            ship6.setImage(imagec6v, for: .normal)
            shipSelected.image = UIImage(named: NavType.sharedGameData.type + NavType.sharedGameData.form + NavType.sharedGameData.color)
        }
        
        
        
    }
    
//    VIOLA
    
    @IBAction func violetButton(_ sender: Any) {
        NavType.sharedGameData.color = "viola"
        if segmentedBodies.selectedSegmentIndex == 0
        {

            ship1.setImage(imageq1violet, for: .normal)
            ship2.setImage(imageq2violet, for: .normal)
            ship3.setImage(imageq3violet, for: .normal)
            ship4.setImage(imageq4violet, for: .normal)
            ship5.setImage(imageq5violet, for: .normal)
            ship6.setImage(imageq6violet, for: .normal)
            shipSelected.image = UIImage(named: NavType.sharedGameData.type + NavType.sharedGameData.form + NavType.sharedGameData.color)
        }
        else{
            
            ship1.setImage(imagec1violet, for: .normal)
            ship2.setImage(imagec2violet, for: .normal)
            ship3.setImage(imagec3violet, for: .normal)
            ship4.setImage(imagec4violet, for: .normal)
            ship5.setImage(imagec5violet, for: .normal)
            ship6.setImage(imagec6violet, for: .normal)
            shipSelected.image = UIImage(named: NavType.sharedGameData.type + NavType.sharedGameData.form + NavType.sharedGameData.color)
            
        }
    }
    
//    blu
    
    @IBAction func blueButton(_ sender: Any) {
        NavType.sharedGameData.color = "b"
        if segmentedBodies.selectedSegmentIndex == 0
        {

            ship1.setImage(imageq1b, for: .normal)
            ship2.setImage(imageq2b, for: .normal)
            ship3.setImage(imageq3b, for: .normal)
            ship4.setImage(imageq4b, for: .normal)
            ship5.setImage(imageq5b, for: .normal)
            ship6.setImage(imageq6b, for: .normal)
            shipSelected.image = UIImage(named: NavType.sharedGameData.type + NavType.sharedGameData.form + NavType.sharedGameData.color)
        }
        else{
            
            ship1.setImage(imagec1b, for: .normal)
            ship2.setImage(imagec2b, for: .normal)
            ship3.setImage(imagec3b, for: .normal)
            ship4.setImage(imagec4b, for: .normal)
            ship5.setImage(imagec5b, for: .normal)
            ship6.setImage(imagec6b, for: .normal)
            shipSelected.image = UIImage(named: NavType.sharedGameData.type + NavType.sharedGameData.form + NavType.sharedGameData.color)
            
        }
    }
    
    @IBAction func button1Pressed(_ sender: Any) {
          button1.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1), forState: .normal)
          button2.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button3.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button4.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button5.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button6.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
         
      }
    
    
      @IBAction func button2Pressed(_ sender: Any) {
          button1.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button2.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1), forState: .normal)
          button3.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button4.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button5.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button6.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
      }
      
      @IBAction func button3Pressed(_ sender: Any) {
          button1.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button2.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button3.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1), forState: .normal)
          button4.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button5.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button6.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
      }
      
      
      @IBAction func button4Pressed(_ sender: Any) {
          button1.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button2.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button3.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button4.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1), forState: .normal)
          button5.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button6.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
      }
      
      @IBAction func button5Pressed(_ sender: Any) {
          button1.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button2.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button3.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button4.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button5.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1), forState: .normal)
          button6.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
      }
      
      @IBAction func button6Pressed(_ sender: Any) {
          button1.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button2.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button3.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button4.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button5.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 0), forState: .normal)
          button6.setBackgroundColor(color: UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1), forState: .normal)
      }
   
    
    
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
   
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        let vc = subsequentVC as! HomeScreenViewController
        vc.selectedNav.image = shipSelected.image
    }
}
