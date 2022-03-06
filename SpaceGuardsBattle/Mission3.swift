//
//  Mission3.swift
//  SGB-SpaceGuardsBattle
//
//  Created by Piero Chianese on 05/03/22.
//

import Foundation
import SpriteKit
import GameplayKit
import AVKit
import NotificationCenter
import UIKit


class Mission3: SKScene, SKPhysicsContactDelegate {
    let velocityMultiplier: CGFloat = 0.10
    var health: CGFloat = 1
    var isPlayerAlive = true
    let progressBar = IMProgressBar(emptyImageName: "emptyImage" ,filledImageName: "filledImage")
    let scoreLabel = SKLabelNode(text: "Score : 0")
    var over = SKScene(fileNamed: "Over")
    var win = SKScene(fileNamed: "Win")
    var isFiring = false
    var updateTime: Double = 0
    var conquistato = false
    var firingInterval: Double = 0.5
    var updateeShotTime : Double = 0
    var stoconqui = false
    var firingEnemyInterval : Double = 0.8
    var isGamePaused = false
    var recupero = false
    var inizioanimazione = false
    var star = SKEmitterNode(fileNamed: "Starfield")
    var star2 = SKEmitterNode(fileNamed: "Starfield")
    let Time = NSLocalizedString("Time", comment: "")
    let Scor = NSLocalizedString("Score", comment: "")
    let Conquista = NSLocalizedString("Conquista", comment: "")
    let Recupera = NSLocalizedString("Recupera", comment: "")
    let Playag = NSLocalizedString("PlayAgain", comment: "")
    let Pau = NSLocalizedString("Pause", comment: "")
    let Mainss = NSLocalizedString("MenPri", comment: "")
    var timer3 = 40
    var timlab = SKLabelNode(text: "Time: ")
    var tim : Timer? = nil
    var tutorial = false
    let rettangolo = SKSpriteNode(imageNamed: "orangebox")
    var startmission = true
    var score: Int = 0
    let pauseButton = SKSpriteNode(imageNamed: "pause")
    let conquer = SKSpriteNode(imageNamed: "ufo")
    let pauseBG = SKSpriteNode(imageNamed: "pauseBG")
    let pauseText = SKLabelNode(text: "")
    let pauseLeave = SKLabelNode(text: "")
    let pauseCancel = SKSpriteNode(imageNamed: "pauseCancel")
    
    let palle = 10
    
    let cam = SKCameraNode()
    var canShoot = false
    enum NodesZPosition: CGFloat {
        case background, hero, joystick
    }
    
    var asteroidsTileMap : SKTileMapNode!
    let gameLayer = SKNode()
    let pauseLayer = SKNode()
    let hudLayer = SKNode()
    var Nav = NavType.sharedGameData.type + NavType.sharedGameData.form + NavType.sharedGameData.color
    
    //    var palle : TransitionDelegate?
    
    //MARK: DIDMOVE FUNCTION
    override func didMove(to view: SKView) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(pauseGame), name: .goToBackground, object: nil)
        
//        Mission3ViewController.stop
        
        
        if GeneralSettings.sharedGameData.bgsound == true {
        
        let sound = Bundle.main.path(forResource: "Tutorial", ofType:
                                        "wav")
        do {
            // We try to get the initialize it with the URL we created above.
            HomeScreenViewController.audioPlayer = try AVAudioPlayer (contentsOf: URL(fileURLWithPath: sound!) )
        }
        catch{
            print(error)
            
        }
        HomeScreenViewController.audioPlayer.numberOfLoops = -1
        HomeScreenViewController.audioPlayer.volume = 0.05
        HomeScreenViewController.audioPlayer.play()
        
        }
       
            setupTutorial()
            addChild(rettangolo)
            rettangolo.addChild(boxTUT)
      
        setupPauseMenu()
        setupNodes()
        let emitter = SKEmitterNode(fileNamed: "playerTrail.sks")
        
        
        emitter?.targetNode = self
        hero.addChild(emitter!)
        
        
        rettangolo.position = CGPoint(x: 0, y: 0)
        rettangolo.zPosition = NodesZPosition.hero.rawValue + 1
        boxTUT.text = ("\(textENG)")
        boxTUT.fontSize = 30
        boxTUT.position = CGPoint(x: 0, y: 0)
        boxTUT.lineBreakMode = .byWordWrapping
        boxTUT.numberOfLines = 0
        boxTUT.preferredMaxLayoutWidth = 350
        boxTUT.verticalAlignmentMode = .center
        boxTUT.fontColor = .white
        if tutorial == false {
            analogJoystick.isUserInteractionEnabled = false
            
            
            addChild(rettangolo)
            rettangolo.addChild(boxTUT)
            
        }
        
        createplanets(name: "pianetaarancione")
        var g = scene!.calculateAccumulatedFrame()
        g.size.height = g.size.height - 2000
        g.size.width = g.size.width - 2000
        g.origin.x = g.origin.x + 1000
        g.origin.y = g.origin.y + 1000
        scene!.physicsBody = SKPhysicsBody(edgeLoopFrom: g)
        
        
        
        
        
        
        
        star!.position = CGPoint(x: -hero.position.x / 15 - (ScreenSize.width * 0.45)  , y: -hero.position.y / 15 - (ScreenSize.height * 0.66))
        
        star2!.position = CGPoint(x: -hero.position.x / 7 - (ScreenSize.width * 0.45)  , y: -hero.position.y / 7 - (ScreenSize.height * 0.66))
        
        if DeviceType.isiPhone8Plus || DeviceType.isiPhone6Plus || DeviceType.isiPhone7Plus || DeviceType.isiPhone6sPlus {
            timlab.position = CGPoint(x: -ScreenSize.width * 0.68 , y: ScreenSize.height * 0.75)
        } else if DeviceType.isiPhone6 || DeviceType.isiPhone6s || DeviceType.isiPhone7 || DeviceType.isiPhone8 {
            timlab.position = CGPoint(x: -ScreenSize.width * 0.75 , y: ScreenSize.height * 0.80)
        } else {
            timlab.position = CGPoint(x: -ScreenSize.width * 0.45 , y: ScreenSize.height * 0.60)
        }
        
        
        if DeviceType.isiPhone8Plus || DeviceType.isiPhone6Plus || DeviceType.isiPhone7Plus || DeviceType.isiPhone6sPlus {
            progressBar.position = CGPoint(x: -ScreenSize.width * 0.68  , y: ScreenSize.height * 0.85)
        } else if DeviceType.isiPhone6 || DeviceType.isiPhone6s || DeviceType.isiPhone7 || DeviceType.isiPhone8 {
            progressBar.position = CGPoint(x: -ScreenSize.width * 0.80, y: ScreenSize.height * 0.90)
        } else {
            progressBar.position = CGPoint(x: -ScreenSize.width * 0.45  , y: ScreenSize.height * 0.66)
        }
        
        
        if DeviceType.isiPhone8Plus || DeviceType.isiPhone6Plus || DeviceType.isiPhone7Plus || DeviceType.isiPhone6sPlus {
            pauseButton.position = CGPoint(x: ScreenSize.width * 0.70  , y: ScreenSize.height * 0.85)
        } else if DeviceType.isiPhone6 || DeviceType.isiPhone6s || DeviceType.isiPhone7 || DeviceType.isiPhone8 {
            pauseButton.position = CGPoint(x: ScreenSize.width * 0.80  , y: ScreenSize.height * 0.90)
        } else {
            pauseButton.position = CGPoint(x: ScreenSize.width * 0.48  , y: ScreenSize.height * 0.68)
        }
        
        
        if DeviceType.isiPhone8Plus || DeviceType.isiPhone6Plus || DeviceType.isiPhone7Plus || DeviceType.isiPhone6sPlus {
            scoreLabel.position = CGPoint(x: ScreenSize.width * 0.68  , y: ScreenSize.height * 0.75)
        } else if DeviceType.isiPhone6 || DeviceType.isiPhone6s || DeviceType.isiPhone7 || DeviceType.isiPhone8 {
            scoreLabel.position = CGPoint(x: ScreenSize.width * 0.75  , y: ScreenSize.height * 0.80)
        } else {
            scoreLabel.position = CGPoint(x: ScreenSize.width * 0.45  , y: ScreenSize.height * 0.60)
        }
        
        
        progressBar.setXProgress(xProgress: health)
        
        if hero.isHidden == false {
            setupJoystick()
        }
        createAsteroid(quantity: 400)
        physicsWorld.contactDelegate = self
        
        let asteroidNode = self.childNode(withName: "asteroid")
        
        if let campo: SKTileMapNode = asteroidNode as? SKTileMapNode {
            giveTileMapPhysicsBody(map: campo)
            campo.removeFromParent()
        }
        
        
        randomEnemy()
        randomEnemy()
        randomEnemy()
        randomEnemy()
        randomEnemy()
        randomEnemy()
        randomEnemy()
        randomEnemy()
        randomEnemy()
        randomEnemy()
        randomEnemy()
        randomEnemy()
        randomEnemy()
        randomEnemy()
        randomEnemy()
        randomEnemy()
        randomEnemy()
        randomEnemy()
        randomEnemy()
        randomEnemy()
        randomEnemy()
        
        self.camera = cam
    }
    
    //MARK: TOUCHES FUNCTION
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if pauseLayer.isHidden == true {
            isFiring = true
        }
        
        for touch in touches {
            let location = touch.location(in: self)
            if pauseButton.contains(location) {
                pauseGame()
            }
            if pauseLayer.isHidden == false {
                if pauseCancel.contains(location) {
                    
                    isGamePaused = false
                    
                    pauseLayer.isHidden = true
                    gameLayer.isPaused = false
                    hudLayer.isPaused = false
                    
                    analogJoystick.isUserInteractionEnabled = true
                    
                }
                if pauseLeave.contains(location) {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "NavigationViewController")
                    
                    vc.view.frame = (self.view?.frame)!
                    vc.view.layoutIfNeeded()
                    
                    UIView.transition(with: self.view!, duration: 0, animations: {
                        self.view?.window?.rootViewController = vc
                    }, completion: { completed in
                    })
                }
            }
            
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            if conquer.contains(location) {
                if recupero == false && stoconqui == false {
                conquerplanet(tempo: timer3)
                }
                if recupero {
                    inizioanimazione = true
                }
            }
        
        isFiring = false
        
        if startmission == true && tutorial == false && isGamePaused == false {
            rettangolo.removeFromParent()
            startmission = false
            analogJoystick.isUserInteractionEnabled = true
        }
        
        if tutorial == true {
            rettangolo.removeFromParent()
            analogJoystick.isUserInteractionEnabled = true
            
           
            
            
            tutorial = false }
    }
    }
    override func update(_ currentTime: TimeInterval) {
        sondabutton()
        let location = hero.position
        
        
        
        if inizioanimazione {
            let dx = (location.x) -  (gameLayer.childNode(withName: "Sonda")?.position.x ?? 0)
            let dy = (location.y) -  (gameLayer.childNode(withName: "Sonda")?.position.y ?? 0)
            let angle = atan2(dy, dx)

            gameLayer.childNode(withName: "Sonda")?.zRotation = angle - 3 * .pi/6

               
                //Seek
                let velocityX =  cos(angle) * 5
                let velocityY =  sin(angle) * 5

            gameLayer.childNode(withName: "Sonda")?.position.x += velocityX
            gameLayer.childNode(withName: "Sonda")?.position.y += velocityY
            
        }
        
        
        gameLayer.enumerateChildNodes(withName: "1") {enemy,_ in
            
            //Aim
            let dx = (location.x) - enemy.position.x
            let dy = (location.y) - enemy.position.y
            let angle = atan2(dy, dx)

            enemy.zRotation = angle - 3 * .pi/6

            
            
            if enemy.position.distance(point: location) < 1000 && enemy.position.distance(point: location) > 450 {
               
                //Seek
                let velocityX =  cos(angle) * 5
                let velocityY =  sin(angle) * 5

                enemy.position.x += velocityX
                enemy.position.y += velocityY
            }
            if enemy.position.distance(point: location) < 700 {
                if self.updateeShotTime == 0 {
                    self.updateeShotTime = currentTime
                }
                if currentTime - self.updateeShotTime > self.firingInterval{
                    self.fireEnemyBullet()
                    self.updateeShotTime = currentTime
                }
            }
        }

        
        guard !isGamePaused else {
            gameLayer.isPaused = true
            hudLayer.isPaused = true
            pauseLayer.isHidden = false
            return
        }
        
        //check if we should be firing if not get outta here
        guard isFiring else { return }
        
        if updateTime == 0 {
            updateTime = currentTime
        }
        
        if currentTime - updateTime > firingInterval {
            self.fireBullet()
            updateTime = currentTime
        }
    }
    
    
    func fireBullet() {
        if pauseLayer.isHidden == true {
            if tutorial == false {
                if action(forKey: "shooting") == nil {
                
                    
                    let shot = SKSpriteNode(imageNamed: "laser")
                    shot.name = "laser"
                    shot.position = hero.position
                    shot.zPosition = hero.zPosition - 1
                    shot.zRotation = (hero.zRotation)
                    shot.physicsBody = SKPhysicsBody(rectangleOf: shot.size)
                    shot.physicsBody?.collisionBitMask = PhysicsCategory.None
                    shot.physicsBody?.categoryBitMask = PhysicsCategory.Shot
                    shot.physicsBody?.contactTestBitMask = PhysicsCategory.Asteroid
                    shot.physicsBody?.usesPreciseCollisionDetection = true
                    
                    
                    guard isPlayerAlive else { return }
                    
                    gameLayer.addChild(shot)
                    
                    var angolo : CGFloat
                    
                    if shot.zRotation + (3.14 / 2 ) >= 0 {
                        angolo = (((shot.zRotation * 180) / Double.pi ) + 90)
                    } else {
                        angolo = ( (360 + ((shot.zRotation * 180) / Double.pi ))  + 90)
                    }
                    print (angolo)
                    
                    let movement = SKAction.move(to: CGPoint(x: (1000 * cos(((angolo) * Double.pi) / 180)) + hero.position.x, y: (1000 * cos(((180 - 90 - angolo ) * Double.pi) / 180 )) + hero.position.y), duration: 0.6)
                    let sound = SKAction.playSoundFileNamed("laserj", waitForCompletion: false)
                    let removeFromParent = SKAction.removeFromParent()
                    let actions = [sound, movement, removeFromParent]
                    
                    shot.run(SKAction.sequence(actions))
                    let generator = UIImpactFeedbackGenerator(style: .soft)
                    generator.impactOccurred()
                }
            }
        }
    }
    
    func fireEnemyBullet() {
        if pauseLayer.isHidden == true {
            if tutorial == false {
                if action(forKey: "shooting") == nil {
                    
//                    eShot.physicsBody = SKPhysicsBody(rectangleOf: eShot.size)
//                    eShot.physicsBody?.collisionBitMask = PhysicsCategory.None
//                    eShot.physicsBody?.categoryBitMask = PhysicsCategory.Shot
//                    eShot.physicsBody?.contactTestBitMask = PhysicsCategory.Asteroid
//                    eShot.physicsBody?.usesPreciseCollisionDetection = true
                    
         
                    

                    
                    
                    gameLayer.enumerateChildNodes(withName: "1") {enemy,_ in
                        let location = self.hero.position
                        if enemy.position.distance(point: location) < 700 {
                        let eShot = SKSpriteNode(imageNamed: "lasere")
                        eShot.name = "laser"
                            
                            eShot.position = enemy.position
                        eShot.zPosition = enemy.zPosition - 1
                        eShot.physicsBody = SKPhysicsBody(rectangleOf: eShot.size)
                        eShot.physicsBody?.collisionBitMask = PhysicsCategory.None
                        eShot.physicsBody?.categoryBitMask = PhysicsCategory.eneShot
                        eShot.physicsBody?.contactTestBitMask = PhysicsCategory.Hero
                        
                        eShot.zRotation = enemy.zRotation
                        
                  
                        
                            self.gameLayer.addChild(eShot)
                        
                        var angolo : CGFloat
                        
                        if eShot.zRotation + (3.14 / 2 ) >= 0 {
                            angolo = (((eShot.zRotation * 180) / Double.pi ) + 90)
                        } else {
                            angolo = ( (360 + ((eShot.zRotation * 180) / Double.pi ))  + 90)
                        }
                        
                        let movement = SKAction.move(to: CGPoint(x: (1000 * cos(((angolo) * Double.pi) / 180)) + enemy.position.x, y: (1000 * cos(((180 - 90 - angolo ) * Double.pi) / 180 )) + enemy.position.y), duration: 0.6)
                        let sound = SKAction.playSoundFileNamed("laserj", waitForCompletion: false)
                        let removeFromParent = SKAction.removeFromParent()
                        let actions = [sound, movement, removeFromParent]
                        
                        eShot.run(SKAction.sequence(actions))
                    }
                }
                }
            }
        }
    }
    
    
    //MARK: DIDBEGIN FUNCTION
    func didBegin(_ contact: SKPhysicsContact) {
        let collision = contact.bodyA.categoryBitMask
        let collision2 = contact.bodyB.categoryBitMask
        let collision3 = contact.bodyA.categoryBitMask
        let collision4 = contact.bodyB.categoryBitMask
        
        if collision == PhysicsCategory.Asteroid {
            if collision2 == PhysicsCategory.Shot{
                contact.bodyB.node?.removeFromParent()
                let emitter = SKEmitterNode(fileNamed: "asteroidsDestroyed.sks")
                emitter?.targetNode = self
                contact.bodyA.node?.addChild(emitter!)
                
                
                contact.bodyA.node?.run(SKAction.playSoundFileNamed("explosion", waitForCompletion: false))
                
                score = score + 5
                scoreLabel.text = "\(Scor) : \(score)"
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    
                    contact.bodyA.node?.removeFromParent()
                }
                if score > 500 {
                    win!.scaleMode = scaleMode
                    view?.presentScene(win!)
                }
            }
        }else {
            
            if collision2 == PhysicsCategory.Asteroid {
                if collision == PhysicsCategory.Shot{
                    contact.bodyA.node?.removeFromParent()
                    let emitter = SKEmitterNode(fileNamed: "asteroidsDestroyed.sks")
                    emitter?.targetNode = self
                    contact.bodyB.node?.addChild(emitter!)
                    
                    
                    
                    contact.bodyB.node?.run(SKAction.playSoundFileNamed("explosion", waitForCompletion: false))
                    score = score + 3
                    scoreLabel.text = "\(Scor) : \(score)"
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        
                        contact.bodyB.node?.removeFromParent()
                    }
                    
                    if score > 500 {
                        win!.scaleMode = scaleMode
                        view?.presentScene(win!)
                    }
                }
            }
        }
        if collision3 == PhysicsCategory.Asteroid {
            if collision4 == PhysicsCategory.Hero{
                let generator = UIImpactFeedbackGenerator(style: .soft)
                generator.impactOccurred()
                health = health - 0.002
                progressBar.setXProgress(xProgress: health)
                if health < 0.01 {
                    
                    tim?.invalidate()
                    over!.scaleMode = scaleMode
                    view?.presentScene(over!)
                    
                    hero.isHidden = false
                    
                    analogJoystick.removeFromParent()
                }
            }
        }else {
            
            if collision4 == PhysicsCategory.Asteroid {
                if collision3 == PhysicsCategory.Hero{
                    let generator = UIImpactFeedbackGenerator(style: .soft)
                    generator.impactOccurred()
                    health = health - 0.002
                    progressBar.setXProgress(xProgress: health)
                    if health < 0.01 {
                        
                        tim?.invalidate()
                        
                        over!.scaleMode = scaleMode
                        
                        view?.presentScene(over!)
                        //                        self.removeFromParent()
                        hero.isHidden = false
                        //                        isPlayerAlive = false
                        analogJoystick.removeFromParent()
                    }
                }
            }
        }
       
        if collision == PhysicsCategory.enemy {
            if collision2 == PhysicsCategory.Shot{
                contact.bodyB.node?.removeFromParent()
                
                let emitter = SKEmitterNode(fileNamed: "asteroidsDestroyed.sks")
                emitter?.targetNode = self
                contact.bodyA.node?.addChild(emitter!)
                
                
                contact.bodyA.node?.run(SKAction.playSoundFileNamed("explosion", waitForCompletion: false))
                
                score = score + 5
                scoreLabel.text = "\(Scor) : \(score)"
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    
                    contact.bodyA.node?.removeFromParent()
                }
                if score > 500 {
                    win!.scaleMode = scaleMode
                    view?.presentScene(win!)
                }
            }
        }else {
            
            if collision2 == PhysicsCategory.enemy {
                if collision == PhysicsCategory.Shot{
                    contact.bodyA.node?.removeFromParent()
                    let emitter = SKEmitterNode(fileNamed: "asteroidsDestroyed.sks")
                    emitter?.targetNode = self
                    contact.bodyB.node?.addChild(emitter!)
                    
                    
                    
                    contact.bodyB.node?.run(SKAction.playSoundFileNamed("explosion", waitForCompletion: false))
                    score = score + 3
                    scoreLabel.text = "\(Scor) : \(score)"
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        
                        contact.bodyB.node?.removeFromParent()
                    }
                    
                    if score > 500 {
                        win!.scaleMode = scaleMode
                        view?.presentScene(win!)
                    }
                }
            }
        }
        
        
        
        if collision3 == PhysicsCategory.eneShot {
            if collision4 == PhysicsCategory.Hero{
                let generator = UIImpactFeedbackGenerator(style: .soft)
                generator.impactOccurred()
                contact.bodyA.node?.removeFromParent()
                health = health - 0.002
                progressBar.setXProgress(xProgress: health)
                if health < 0.01 {
                    
                    tim?.invalidate()
                    over!.scaleMode = scaleMode
                    view?.presentScene(over!)
                    
                    hero.isHidden = false
                    
                    analogJoystick.removeFromParent()
                }
            }
        }else {
            
            if collision4 == PhysicsCategory.eneShot {
                if collision3 == PhysicsCategory.Hero{
                    let generator = UIImpactFeedbackGenerator(style: .soft)
                    generator.impactOccurred()
                    contact.bodyB.node?.removeFromParent()
                    health = health - 0.002
                    progressBar.setXProgress(xProgress: health)
                    if health < 0.01 {
                        
                        tim?.invalidate()
                        
                        over!.scaleMode = scaleMode
                        
                        view?.presentScene(over!)
                        //                        self.removeFromParent()
                        hero.isHidden = false
                        //                        isPlayerAlive = false
                        analogJoystick.removeFromParent()
                    }
                }
            }
        }
       
        if collision3 == PhysicsCategory.Sonda {
            if collision4 == PhysicsCategory.Hero{
                
                if inizioanimazione  {
                    
                    contact.bodyA.node?.removeFromParent()
                    inizioanimazione = false
                    recupero = false
                    tim?.invalidate()
                    timlab.removeFromParent()
                    stoconqui = false
                }
            }
        }else {
            
            if collision4 == PhysicsCategory.Sonda {
                if collision3 == PhysicsCategory.Hero{
                    
                    
              
                    if inizioanimazione == true {
                        
                        contact.bodyB.node?.removeFromParent()
                        inizioanimazione = false
                        recupero = false
                        tim?.invalidate()
                        timlab.removeFromParent()
                        stoconqui = false
                    }
                }
            }
        }
    }
    
    //MARK: VARIABLES
    lazy var hero: SKSpriteNode = {
        var sprite = SKSpriteNode(imageNamed: Nav)
        sprite.position = CGPoint(x: 0, y: 0)
        sprite.zPosition = NodesZPosition.hero.rawValue
        sprite.scaleTo(screenWidthPercentage: 0.35)
        sprite.physicsBody = SKPhysicsBody(texture: sprite.texture!, size: sprite.size)
        sprite.physicsBody?.allowsRotation = false
        sprite.physicsBody?.mass = 100
        sprite.physicsBody?.categoryBitMask = PhysicsCategory.Hero
        sprite.physicsBody?.contactTestBitMask = PhysicsCategory.Asteroid | PhysicsCategory.Planet | PhysicsCategory.Confine | PhysicsCategory.Sonda
        sprite.physicsBody?.collisionBitMask = PhysicsCategory.Asteroid
        return sprite
    }()
    
   
    var planets : [SKSpriteNode] = []
    
    
    func randomEnemy () {
        let enemy = SKSpriteNode(imageNamed: "enemyBig")
        enemy.name = "1"
        enemy.position = CGPoint(x: Int.random(in: -6500...6500), y: Int.random(in: -6500...6500))
        enemy.zPosition = NodesZPosition.hero.rawValue
        enemy.scaleTo(screenWidthPercentage: 0.35)
        enemy.physicsBody = SKPhysicsBody(texture: enemy.texture!, size: enemy.size)
        
        
        enemy.physicsBody?.allowsRotation = false
        enemy.physicsBody?.mass = 100
        enemy.physicsBody?.categoryBitMask = PhysicsCategory.enemy
        enemy.physicsBody?.contactTestBitMask = PhysicsCategory.Shot
        enemy.physicsBody?.collisionBitMask = PhysicsCategory.None

        gameLayer.addChild(enemy)

    }
    
    lazy var analogJoystick: AnalogJoystick = {
        let js = AnalogJoystick(diameter: 175, colors: nil, images: (substrate: #imageLiteral(resourceName: "jSubstrate"), stick: #imageLiteral(resourceName: "jStick")))
        if DeviceType.isiPhone8Plus || DeviceType.isiPhone6Plus || DeviceType.isiPhone7Plus || DeviceType.isiPhone6sPlus {
            js.position = CGPoint(x: -ScreenSize.width * 0.63, y: -ScreenSize.height * 0.75)
        } else if DeviceType.isiPhone6 || DeviceType.isiPhone6s || DeviceType.isiPhone7 || DeviceType.isiPhone8 {
            js.position = CGPoint(x: -ScreenSize.width * 0.70, y: -ScreenSize.height * 0.80)
        } else {
            js.position = CGPoint(x: -ScreenSize.width * 0.45, y: -ScreenSize.height * 0.55)
        }
        js.zPosition = NodesZPosition.joystick.rawValue
        
        return js
        
    }()
    
    
    
    //MARK: FUNCTIONS
    func sondabutton() {
        
        for planet in planets {
            if planet.position.distance(point: hero.position) < 550 &&  stoconqui == false {
                conquer.isHidden = false
                    conquer.isUserInteractionEnabled = false
            } else {
                conquer.isHidden = true
                conquer.isUserInteractionEnabled = true
            }
        }
    }
    func conquerplanet( tempo:  Int) {
            var cooldown = 20
            var palle = tempo
            let sonda = SKSpriteNode(imageNamed: "0sonda")
        sonda.scaleTo(screenWidthPercentage: 0.20)
        sonda.physicsBody = SKPhysicsBody(texture: sonda.texture!, size: sonda.size)
            sonda.position = hero.position
        sonda.physicsBody?.collisionBitMask = PhysicsCategory.None
            sonda.physicsBody?.categoryBitMask = PhysicsCategory.Sonda
        sonda.physicsBody?.contactTestBitMask = PhysicsCategory.Planet | PhysicsCategory.Hero
            let Textures = (1...6).map { SKTexture(imageNamed: "\($0)sonda") }
        sonda.name = "Sonda"
        
        gameLayer.addChild(sonda)
//        timlab.text = "\(Time) : \(tempo)"
        
        stoconqui = true
        for planet in planets {
            let landing = SKAction.move(to: planet.position, duration: 5)
//            let conquista = SKAction.wait(forDuration: 10)
            let ritiro = SKAction.animate(with: Textures, timePerFrame: 5)
            let actions = [landing,ritiro]
            sonda.run(SKAction.sequence(actions))
            }
        timlab.text = "\(Conquista) : \(palle)"
        timlab.fontColor = .yellow
        gameLayer.addChild(timlab)
        tim = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
            palle = palle - 1
            
            timlab.text = "\(Conquista) : \(palle)"
            
            if palle <= 0 {
                recupero = true
                tim?.invalidate()
                timlab.removeFromParent()
                gameLayer.addChild(timlab)
                tim = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
                cooldown = cooldown - 1
                    timlab.fontColor = .red
                timlab.text = "\(Recupera) : \(cooldown + 1)"
                    stoconqui = false
                    if cooldown < 0 {
                        tim?.invalidate()
                        timlab.removeFromParent()
                        sonda.removeFromParent()
                        conquistato = false
                        recupero = false
                        stoconqui = false
                    }
                }
            }
            
        }
    }
        
    
    func createplanets(name: String) {
        let planet = SKSpriteNode(imageNamed: name)
        planet.scaleTo(screenWidthPercentage: 1)
        planet.position = CGPoint(x: 400  , y: 600)
        planet.zPosition = 0
        planet.physicsBody = SKPhysicsBody(texture: planet.texture!, size: planet.size)
        planet.physicsBody?.isDynamic = false
        planet.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        planet.physicsBody?.contactTestBitMask = PhysicsCategory.Sonda
        gameLayer.addChild(planet)
        planets.append(planet)
    }
    
    @objc func pauseGame() {
        isFiring = false
        isGamePaused = true
        
        pauseLayer.isHidden = false
        gameLayer.isPaused = true
        hudLayer.isPaused = true
        analogJoystick.isUserInteractionEnabled = false
        
        tim?.invalidate()
    }
    
    
    func setupPauseMenu() {
        pauseLayer.isHidden = true
        
        pauseBG.position = CGPoint(x: hero.position.x, y: hero.position.y)
        pauseBG.zPosition = 10
        
        pauseCancel.position = CGPoint(x: -ScreenSize.width * 0.285, y: ScreenSize.height * 0.15)
        pauseCancel.zPosition = 11
        
        pauseText.text = Pau
        pauseText.position = CGPoint(x: 0, y: 100)
        pauseText.zPosition = 11
        pauseText.lineBreakMode = .byWordWrapping
        pauseText.numberOfLines = 2
        pauseText.preferredMaxLayoutWidth = 300
        pauseText.verticalAlignmentMode = .top
        
        pauseLeave.text = Mainss
        pauseLeave.position = CGPoint(x: 0, y: -100)
        pauseLeave.zPosition = 11
        pauseLeave.lineBreakMode = .byWordWrapping
        pauseLeave.numberOfLines = 2
        pauseLeave.preferredMaxLayoutWidth = 300
        pauseLeave.verticalAlignmentMode = .top
    }
    
   
    
    
    let boxTUT = SKLabelNode(text: "Hello")
    let textENG =   """
                    Hello, cadet. Are you ready to start your new adventure? \
                    You better be, just a couple tips, \
                    you can explore the universe through your joystick right here. \
                    You can also shoot and destroy asteroids tapping on the screen.
                    
                    """
    
    
    
    
    func setupTutorial() {
        tutorial.toggle()
        analogJoystick.isUserInteractionEnabled = false
    }
    
    
    func setupNodes() {
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        gameLayer.addChild(hero)
//        gameLayer.addChild(enemy)
        addChild(gameLayer)
        addChild(hudLayer)
        addChild(pauseLayer)
        
        
    }
    
    
    
    
    func setupJoystick() {
        hudLayer.addChild(conquer)
        hudLayer.addChild(analogJoystick)
        hudLayer.addChild(progressBar)
        hudLayer.addChild(pauseButton)
        scoreLabel.text = "\(Scor): \(score)"
        hudLayer.addChild(scoreLabel)
        scoreLabel.zPosition = 3
//        hudLayer.addChild(timlab)
        
        gameLayer.addChild(star!)
        star?.zPosition = -0.1
        gameLayer.addChild(star2!)
        star2?.zPosition = -0.1
        
        pauseLayer.addChild(pauseBG)
        pauseLayer.addChild(pauseCancel)
        pauseLayer.addChild(pauseText)
        pauseLayer.addChild(pauseLeave)
        
        analogJoystick.trackingHandler = { [weak self] data in
            guard let mySelf = self else { return }
            mySelf.hero.position = CGPoint(x: mySelf.hero.position.x + (data.velocity.x * mySelf.velocityMultiplier),
                                           y: mySelf.hero.position.y + (data.velocity.y * mySelf.velocityMultiplier))
            mySelf.hero.zRotation = data.angular
            
            if DeviceType.isiPhone8Plus || DeviceType.isiPhone6Plus || DeviceType.isiPhone7Plus || DeviceType.isiPhone6sPlus {
                mySelf.analogJoystick.position = CGPoint(x: mySelf.hero.position.x - (ScreenSize.width * 0.63) , y: mySelf.hero.position.y - (ScreenSize.height * 0.75))
            } else if DeviceType.isiPhone6 || DeviceType.isiPhone6s || DeviceType.isiPhone7 || DeviceType.isiPhone8 {
                mySelf.analogJoystick.position = CGPoint(x: mySelf.hero.position.x - (ScreenSize.width * 0.70) , y: mySelf.hero.position.y - (ScreenSize.height * 0.80))
            } else {
                mySelf.analogJoystick.position = CGPoint(x: mySelf.hero.position.x - (ScreenSize.width * 0.45) , y: mySelf.hero.position.y - (ScreenSize.height * 0.55))
            }
            
            if DeviceType.isiPhone8Plus || DeviceType.isiPhone6Plus || DeviceType.isiPhone7Plus || DeviceType.isiPhone6sPlus {
                mySelf.progressBar.position = CGPoint(x: mySelf.hero.position.x - (ScreenSize.width * 0.68)  , y: mySelf.hero.position.y + (ScreenSize.height * 0.85))
            } else if DeviceType.isiPhone6 || DeviceType.isiPhone6s || DeviceType.isiPhone7 || DeviceType.isiPhone8 {
                mySelf.progressBar.position = CGPoint(x: mySelf.hero.position.x - (ScreenSize.width * 0.80)  , y: mySelf.hero.position.y + (ScreenSize.height * 0.90))
            } else {
                mySelf.progressBar.position = CGPoint(x: mySelf.hero.position.x - (ScreenSize.width * 0.45)  , y: mySelf.hero.position.y + (ScreenSize.height * 0.66))
            }
            
            if DeviceType.isiPhone8Plus || DeviceType.isiPhone6Plus || DeviceType.isiPhone7Plus || DeviceType.isiPhone6sPlus {
                mySelf.scoreLabel.position = CGPoint(x: mySelf.hero.position.x + (ScreenSize.width * 0.68)  , y: mySelf.hero.position.y + (ScreenSize.height * 0.75))
            } else if DeviceType.isiPhone6 || DeviceType.isiPhone6s || DeviceType.isiPhone7 || DeviceType.isiPhone8 {
                mySelf.scoreLabel.position = CGPoint(x: mySelf.hero.position.x + (ScreenSize.width * 0.75)  , y: mySelf.hero.position.y + (ScreenSize.height * 0.80))
            } else {
                mySelf.scoreLabel.position = CGPoint(x: mySelf.hero.position.x + (ScreenSize.width * 0.45)  , y: mySelf.hero.position.y + (ScreenSize.height * 0.60))
            }
            
            mySelf.star!.position = CGPoint(x: -mySelf.hero.position.x / 15 - (ScreenSize.width * 0.45)  , y: -mySelf.hero.position.y / 15 - (ScreenSize.height * 0.66))
            
            mySelf.star2!.position = CGPoint(x: -mySelf.hero.position.x / 7 - (ScreenSize.width * 0.45)  , y: -mySelf.hero.position.y / 7 - (ScreenSize.height * 0.66))
            
            if DeviceType.isiPhone8Plus || DeviceType.isiPhone6Plus || DeviceType.isiPhone7Plus || DeviceType.isiPhone6sPlus {
                mySelf.timlab.position = CGPoint(x: mySelf.hero.position.x - (ScreenSize.width * 0.68)  , y: mySelf.hero.position.y + (ScreenSize.height * 0.75))
            } else if DeviceType.isiPhone6 || DeviceType.isiPhone6s || DeviceType.isiPhone7 || DeviceType.isiPhone8 {
                mySelf.timlab.position = CGPoint(x: mySelf.hero.position.x - (ScreenSize.width * 0.75)  , y: mySelf.hero.position.y + (ScreenSize.height * 0.80))
            } else {
                mySelf.timlab.position = CGPoint(x: mySelf.hero.position.x - (ScreenSize.width * 0.45)  , y: mySelf.hero.position.y + (ScreenSize.height * 0.60))
            }
            
            if DeviceType.isiPhone8Plus || DeviceType.isiPhone6Plus || DeviceType.isiPhone7Plus || DeviceType.isiPhone6sPlus {
                mySelf.pauseButton.position = CGPoint(x: mySelf.hero.position.x + (ScreenSize.width * 0.70)  , y: mySelf.hero.position.y + (ScreenSize.height * 0.85))
            } else if DeviceType.isiPhone6 || DeviceType.isiPhone6s || DeviceType.isiPhone7 || DeviceType.isiPhone8 {
                mySelf.pauseButton.position = CGPoint(x: mySelf.hero.position.x + (ScreenSize.width * 0.80)  , y: mySelf.hero.position.y + (ScreenSize.height * 0.90))
            } else {
                mySelf.pauseButton.position = CGPoint(x: mySelf.hero.position.x + (ScreenSize.width * 0.48)  , y: mySelf.hero.position.y + (ScreenSize.height * 0.68))
            }
            
            if DeviceType.isiPhone8Plus || DeviceType.isiPhone6Plus || DeviceType.isiPhone7Plus || DeviceType.isiPhone6sPlus {
                mySelf.conquer.position = CGPoint(x: mySelf.hero.position.x + (ScreenSize.width * 0.63)  , y: mySelf.hero.position.y + (-ScreenSize.height * 0.75))
            } else if DeviceType.isiPhone6 || DeviceType.isiPhone6s || DeviceType.isiPhone7 || DeviceType.isiPhone8 {
                mySelf.conquer.position = CGPoint(x: mySelf.hero.position.x + (ScreenSize.width * 0.70)  , y: mySelf.hero.position.y + (-ScreenSize.height * 0.80))
            } else {
                mySelf.conquer.position = CGPoint(x: mySelf.hero.position.x + (ScreenSize.width * 0.45)  , y: mySelf.hero.position.y + (-ScreenSize.height * 0.55))
            }
            mySelf.star!.position = CGPoint(x: -mySelf.hero.position.x / 15 - (ScreenSize.width * 0.45)  , y: -mySelf.hero.position.y / 15 - (ScreenSize.height * 0.66))
            
            mySelf.star2!.position = CGPoint(x: -mySelf.hero.position.x / 7 - (ScreenSize.width * 0.45)  , y: -mySelf.hero.position.y / 7 - (ScreenSize.height * 0.66))
            
            
            mySelf.timlab.position = CGPoint(x: mySelf.hero.position.x - (ScreenSize.width * 0.45)  , y: mySelf.hero.position.y + (ScreenSize.height * 0.60))
            
            mySelf.pauseBG.position = CGPoint(x: mySelf.hero.position.x, y: mySelf.hero.position.y)
            
            mySelf.pauseCancel.position = CGPoint(x: mySelf.hero.position.x - (ScreenSize.width * 0.285), y: mySelf.hero.position.y + (ScreenSize.height * 0.15))
            
            mySelf.pauseText.position = CGPoint(x: mySelf.hero.position.x, y: mySelf.hero.position.y + (ScreenSize.height * 0.1))
            
            mySelf.pauseLeave.position = CGPoint(x: mySelf.hero.position.x, y: mySelf.hero.position.y - (ScreenSize.height * 0.1))
        }
        
        
        
    }
    
    
    
    
    override func didSimulatePhysics() {
        self.camera?.position = hero.position
    }
    
    
    func createAsteroid(quantity: Int) {
        
        // 1
        let tile = SKTileDefinition(texture:
                                        SKTexture(imageNamed: "asteroid1"))
        let tile2 = SKTileDefinition(texture:
                                        SKTexture(imageNamed: "asteroid2"))
        
        let tile3 = SKTileDefinition(texture:
                                        SKTexture(imageNamed: "asteroid3"))
        // 2
        let tilerule = SKTileGroupRule(adjacency:
                                        SKTileAdjacencyMask.adjacencyAll, tileDefinitions: [tile, tile2, tile3])
        // 3
        let tilegroup = SKTileGroup(rules: [tilerule])
        // 4
        let tileSet = SKTileSet(tileGroups: [tilegroup])
        // 5
        let columns = 390
        let rows = 520
        asteroidsTileMap = SKTileMapNode(tileSet: tileSet,columns: columns,rows: rows,tileSize: CGSize(width: tile.size.width / 2, height: tile.size.height / 2 ))
        //6
        for _ in 1...quantity {
            let column = Int.random(in: 0...columns-1)
            let row = Int.random(in: 0...rows-1)
            asteroidsTileMap?.setTileGroup(tilegroup,forColumn: column, row: row)
        }
        
        asteroidsTileMap?.name = "asteroid"
        addChild(asteroidsTileMap!)
        
    }
    
    
    
    func giveTileMapPhysicsBody(map: SKTileMapNode){
        
        let tileMap = map
        let startingLocation:CGPoint = tileMap.position
        
        let tileSizeFratto2 = CGSize(width: tileMap.tileSize.width / 2, height: tileMap.tileSize.height / 2)
        
        let tileSize = tileSizeFratto2
        
        let halfWidth = CGFloat(tileMap.numberOfColumns) / 2.0 * tileSize.width
        let halfHeight = CGFloat(tileMap.numberOfRows) / 2.0 * tileSize.height
        
        print(tileSize)
        
        for col in 0..<tileMap.numberOfColumns {
            
            for row in 0..<tileMap.numberOfRows {
                
                if let tileDefinition = tileMap.tileDefinition(atColumn: col, row: row)
                    
                {
                    let tileArray = tileDefinition.textures
                    let tileTexture = tileArray[0]
                    let x = CGFloat(col) * tileSize.width - halfWidth + (tileSize.width / 2)
                    let y = CGFloat(row) * tileSize.height - halfHeight + (tileSize.height / 2)
                    
                    
                    let tileNode = SKSpriteNode(texture:tileTexture)
                    tileNode.position = CGPoint(x: x, y: y)
                    tileNode.physicsBody = SKPhysicsBody(texture: tileTexture, size: CGSize(width: (tileTexture.size().width ), height: (tileTexture.size().height )))
                    tileNode.physicsBody?.collisionBitMask = 0b1
                    tileNode.physicsBody?.mass = 500
                    tileNode.physicsBody?.categoryBitMask = PhysicsCategory.Asteroid
                    tileNode.physicsBody?.collisionBitMask = PhysicsCategory.Hero | PhysicsCategory.Shot
                    tileNode.physicsBody?.contactTestBitMask = PhysicsCategory.Shot | PhysicsCategory.Hero
                    tileNode.position = CGPoint(x: tileNode.position.x + startingLocation.x, y: tileNode.position.y + startingLocation.y)
                    
                    gameLayer.addChild(tileNode)
                }
            }
        }
    }
}