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
    

        
       static var audioPlayer = AVAudioPlayer()
        
        override func viewDidLoad() {
    //    super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // sound file.
        let sound = Bundle.main.path(forResource: "Menu", ofType:
        "wav")
        do {
        // We try to get the initialize it with the URL we created above.
            HomeScreenViewController.audioPlayer = try AVAudioPlayer (contentsOf: URL(fileURLWithPath: sound!) )
        }
        catch{
            print(error)
            
        }
            HomeScreenViewController.audioPlayer.numberOfLoops = -1
            HomeScreenViewController.audioPlayer.play()
        }
        
        
       func stopmusic(){
           HomeScreenViewController.audioPlayer.stop()
        }
    
    
    
    
    
    
    
    @IBAction func playGameButtonPressed(_ sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = true
        if let play = storyboard?.instantiateViewController(withIdentifier: "GalaxySelectionViewController") as? GalaxySelectionViewController {
            navigationController?.pushViewController(play, animated: false)
            
        }
    }
    @IBAction func playGamecenterButton(_ sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = true
        if let pippo = storyboard?.instantiateViewController(withIdentifier: "MultiplayerViewController") as? MultiplayerViewController {
            navigationController?.pushViewController(pippo, animated: false)
        }
        }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
