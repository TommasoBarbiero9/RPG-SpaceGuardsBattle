//
//  HomeScreenViewController.swift
//  SpaceGuardsBattle
//
//  Created by Luca Perrotti on 23/02/22.
//

import Foundation
import UIKit
import AVFoundation
// MARK: HomeScreenViewController: UIViewController

class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet var SettingsMenu: UIView!
    @IBOutlet weak var  selectedNav: UIImageView!
    @IBOutlet weak var linguetta: UIImageView!
    
    @IBOutlet weak var shotbutton: UISegmentedControl!
    
    @IBOutlet weak var Soundon0ff: UISegmentedControl!
    
    
    @IBOutlet weak var JoysticPos: UISegmentedControl!
    
//    @IBOutlet weak var swipeShip: UIImageView!
    @IBOutlet weak var planets: UIImageView!
    
    static var audioPlayer = AVAudioPlayer()
    
    //    @IBAction func swipeUp(_ sender: Any) {
//        self.swipeShip.frame = CGRect(x: 100, y: -100, width: 200, height: 100)
//    }

    
    override func viewDidLoad() {
        
        if GeneralSettings.sharedGameData.JoyPos{
        JoysticPos.selectedSegmentIndex = 0
    } else
    {
        JoysticPos.selectedSegmentIndex = 1
    }
        
        
        if GeneralSettings.sharedGameData.shotyn{
        shotbutton.selectedSegmentIndex = 0
    } else
    {
        shotbutton.selectedSegmentIndex = 1
    }
        
        
        if GeneralSettings.sharedGameData.bgsound{
        Soundon0ff.selectedSegmentIndex = 0
    } else
    {
        Soundon0ff.selectedSegmentIndex = 1
    }
        SettingsMenu.layer.cornerRadius = 15
        settingsLabel.layer.cornerRadius = 15
        settingsLabel.layer.masksToBounds = true

      
    
        selectedNav.image = UIImage(named: NavType.sharedGameData.type + NavType.sharedGameData.form + NavType.sharedGameData.color)
        
        linguetta.shake()
        selectedNav.shake()
//      swipeShip.shake()
        planets.rotate()
//         Do any additional setup after loading the view, typically from a nib.
//         sound file.
        let sound = Bundle.main.path(forResource: "MenuGame", ofType:
                                        "mp3")
        do {
            // We try to get the initialize it with the URL we created above.
            HomeScreenViewController.audioPlayer = try AVAudioPlayer (contentsOf: URL(fileURLWithPath: sound!) )
        }
        catch{
            print(error)
            
        }
        HomeScreenViewController.audioPlayer.numberOfLoops = -1
        HomeScreenViewController.audioPlayer.volume = 0.3
        if GeneralSettings.sharedGameData.bgsound == true {
            HomeScreenViewController.audioPlayer.play()}
    }
    
    func animateIn(){
        
        self.view.addSubview(SettingsMenu)
        SettingsMenu.center = self.view.center
        SettingsMenu.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        SettingsMenu.alpha = 0
        
        UIView.animate(withDuration: 0.4, animations: {
            self.SettingsMenu.alpha = 1
            self.SettingsMenu.transform = CGAffineTransform.identity
        })
    }
    
    func animateOut(){
        UIView.animate(withDuration: 0.3, animations: {
            self.SettingsMenu.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.SettingsMenu.alpha = 0
            
        }) { (success: Bool) in
        self.SettingsMenu.removeFromSuperview()
    }
    }
    
    @IBAction func settingsButtonPressed(_ sender: Any) {
        animateIn()
    }
    
    @IBAction func xButtonPressed(_ sender: Any) {
        animateOut()
    }
    
    
    @IBAction func Soundon0ff(_ sender: UISegmentedControl) {
        
       
            
            switch sender.selectedSegmentIndex {
         
            case 0 :
                GeneralSettings.sharedGameData.bgsound = true
                GeneralSettings.sharedGameData.defaults.set(true, forKey: "bgSound")
                HomeScreenViewController.audioPlayer.play()
                
                
                
            case 1 :
                GeneralSettings.sharedGameData.bgsound = false
                GeneralSettings.sharedGameData.defaults.set(false, forKey: "bgSound")
                HomeScreenViewController.audioPlayer.stop()
            default:
                break
            }}
    
    @IBAction func Shotbutt(_ sender: UISegmentedControl) {
    
   
        
        switch sender.selectedSegmentIndex {
     
        case 0 :
            GeneralSettings.sharedGameData.shotyn = true
            GeneralSettings.sharedGameData.defaults.set(true, forKey: "shotyn")
            
            
        case 1 :
            GeneralSettings.sharedGameData.shotyn = false
            GeneralSettings.sharedGameData.defaults.set(false, forKey: "shotyn")
          
        default:
            break
        }}
    
    
    @IBAction func JoyPos(_ sender: UISegmentedControl) {
    
   
        
        switch sender.selectedSegmentIndex {
     
        case 0 :
            GeneralSettings.sharedGameData.JoyPos = true
            GeneralSettings.sharedGameData.defaults.set(true, forKey: "JoyPos")
            
            
        case 1 :
            GeneralSettings.sharedGameData.JoyPos = false
            GeneralSettings.sharedGameData.defaults.set(false, forKey: "JoyPos")
            
        default:
            break
        }}
    
    
    
    
    func stopmusic(){
        HomeScreenViewController.audioPlayer.stop()
    }

    @IBAction func playGameButtonPressed( sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = true
        if let play = storyboard?.instantiateViewController(withIdentifier: "GalaxySelectionViewController") as? GalaxySelectionViewController {
            navigationController?.pushViewController(play, animated: false)
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
