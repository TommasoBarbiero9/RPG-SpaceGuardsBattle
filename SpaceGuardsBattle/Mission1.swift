//
//  Mission_1.swift
//  SpaceGuardsBattle
//
//  Created by Luca Perrotti on 28/02/22.
//

import Foundation
import SpriteKit
import GameplayKit
import AVKit


class Mission_1: SKScene, SKPhysicsContactDelegate {
    let velocityMultiplier: CGFloat = 0.10
    var health: CGFloat = 1
    var isPlayerAlive = true
    let progressBar = IMProgressBar(emptyImageName: "emptyImage" ,filledImageName: "filledImage")
    let scoreLabel = SKLabelNode(text: "Score : 0")
    var over = SKScene(fileNamed: "Over")
    var isFiring = false
    var updateTime: Double = 0
    var firingInterval: Double = 1
    var audioPlayer : AVAudioPlayer!
    var Pausa = false
    var star = SKEmitterNode(fileNamed: "Starfield")
    var star2 = SKEmitterNode(fileNamed: "Starfield")
    var timer3: Int = 100
    var timlab = SKLabelNode(text: "Time : 0")
    var tim : Timer? = nil
    let arrow = SKSpriteNode(imageNamed: "arrow")
    let rettangolo = SKSpriteNode(imageNamed: "orangebox")
    var startmission = true
    var score: Int = 0
    let pauseButton = SKSpriteNode(imageNamed: "pauseButton")
    
    let cam = SKCameraNode()
    var canShoot = false
    enum NodesZPosition: CGFloat {
        case background, hero, joystick
    }
    
    var asteroidsTileMap : SKTileMapNode!
    
    let gameLayer = SKNode()
    let pauseLayer = SKNode()
    let hudLayer = SKNode()
    
    
    
    //MARK: DIDMOVE FUNCTION
    override func didMove(to view: SKView) {
        
        
        setupNodes()
        let emitter = SKEmitterNode(fileNamed: "playerTrail.sks")
        
        
        emitter?.targetNode = self
        hero.addChild(emitter!)
        
        
        rettangolo.position = CGPoint(x: 0, y: 0)
        rettangolo.zPosition = NodesZPosition.hero.rawValue + 1
        boxTUT.text = ("\(level1)")
        boxTUT.fontSize = 30
        boxTUT.position = CGPoint(x: 0, y: 200)
        boxTUT.lineBreakMode = .byWordWrapping
        boxTUT.numberOfLines = 12
        boxTUT.preferredMaxLayoutWidth = 350
        boxTUT.verticalAlignmentMode = .top
        boxTUT.fontColor = .black
       
        
        arrow.position = CGPoint(x: 0, y: -ScreenSize.height + (ScreenSize.height * 0.45))
        
        
    
        
        
        
        let tlanet = SKSpriteNode(imageNamed: "1")
        tlanet.scaleTo(screenWidthPercentage: 0.60)
        tlanet.position = CGPoint(x: 400  , y: 600)
        tlanet.physicsBody = SKPhysicsBody(texture: tlanet.texture!, size: tlanet.size)
        tlanet.physicsBody?.isDynamic = false
        tlanet.physicsBody?.categoryBitMask = PhysicsCategory.Planet
        tlanet.physicsBody?.contactTestBitMask = PhysicsCategory.Hero
        
        addChild(tlanet)
        
        var g = scene!.calculateAccumulatedFrame()
        g.size.height = g.size.height - 2000
        g.size.width = g.size.width - 2000
        g.origin.x = g.origin.x + 1000
        g.origin.y = g.origin.y + 1000
        scene!.physicsBody = SKPhysicsBody(edgeLoopFrom: g)
       
        
        
        
        
        
        timlab.position = CGPoint(x: hero.position.x - (ScreenSize.width * 0.45)  , y: hero.position.y + (ScreenSize.height * 0.60))
        
        
        star!.position = CGPoint(x: -hero.position.x / 15 - (ScreenSize.width * 0.45)  , y: -hero.position.y / 15 - (ScreenSize.height * 0.66))
        
        star2!.position = CGPoint(x: -hero.position.x / 7 - (ScreenSize.width * 0.45)  , y: -hero.position.y / 7 - (ScreenSize.height * 0.66))
        
        
        
        
        progressBar.setXProgress(xProgress: health)
        progressBar.position = CGPoint(x: -ScreenSize.width * 0.45  , y: ScreenSize.height * 0.66)
        pauseButton.position = CGPoint(x: ScreenSize.width * 0.45  , y: ScreenSize.height * 0.66)
        scoreLabel.position = CGPoint(x: ScreenSize.width * 0.45  , y: ScreenSize.height * 0.60)
        
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
        

        self.camera = cam
    }
    
    //MARK: TOUCHES FUNCTION

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isFiring = true
        
        for touch in touches {
            let location = touch.location(in: self)
            if pauseButton.contains(location) {
                gameLayer.isHidden = true
            }
        }
        
        
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isFiring = false
        
        if startmission == true {
            tim = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
    //                  print("\(timer3)")
                      timer3 = timer3 - 1
                      timlab.text = "Time : \(timer3)"
                      if timer3 < 0 {
                          timer3 = 30
                          tim?.invalidate()
                      self.over!.scaleMode = scaleMode
                          view?.presentScene(over)
                      }
                  }
            arrow.removeFromParent()
            rettangolo.removeFromParent()
            startmission = false
            analogJoystick.isUserInteractionEnabled = true
        }
        
        
       
        
        
      
    }
    

    
    
    override func update(_ currentTime: TimeInterval) {

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
        
            if action(forKey: "shooting") == nil {
                
                let wait = SKAction.wait(forDuration: 0.6)
                run(wait, withKey: "shooting")
                
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
                
                addChild(shot)
                
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
                scoreLabel.text = "Score : \(score)"
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                 
                    contact.bodyA.node?.removeFromParent()
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
                    scoreLabel.text = "Score : \(score)"
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                       
                        contact.bodyB.node?.removeFromParent()
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
        
        if collision == PhysicsCategory.Planet {
            print("Conquista")
        }
        else if collision2 == PhysicsCategory.Planet{
            print("Conquista")
        }
        
        
    }
    
    //MARK: VARIABLES
    lazy var hero: SKSpriteNode = {
        var sprite = SKSpriteNode(imageNamed: "navicellarossa")
        sprite.position = CGPoint(x: 0, y: 0)
        sprite.zPosition = NodesZPosition.hero.rawValue
        sprite.scaleTo(screenWidthPercentage: 0.35)
        sprite.physicsBody = SKPhysicsBody(texture: sprite.texture!, size: sprite.size)
        sprite.physicsBody?.allowsRotation = false
        sprite.physicsBody?.mass = 100
        sprite.physicsBody?.categoryBitMask = PhysicsCategory.Hero
        sprite.physicsBody?.contactTestBitMask = PhysicsCategory.Asteroid | PhysicsCategory.Planet | PhysicsCategory.Confine
        sprite.physicsBody?.collisionBitMask = PhysicsCategory.Asteroid
        return sprite
        
        
    
    }()
    
    
  
    
    lazy var analogJoystick: AnalogJoystick = {
        let js = AnalogJoystick(diameter: 175, colors: nil, images: (substrate: #imageLiteral(resourceName: "jSubstrate"), stick: #imageLiteral(resourceName: "jStick")))
        js.position = CGPoint(x: -ScreenSize.width + (ScreenSize.width * 0.55), y: -ScreenSize.height + (ScreenSize.height * 0.45))
        js.zPosition = NodesZPosition.joystick.rawValue
        return js
    }()
    

    
    //MARK: FUNCTIONS
    
    func isAppAlreadyLaunchedOnce() -> Bool {
        let defaults = UserDefaults.standard
        if let _ = defaults.string(forKey: "isAppAlreadyLaunchedOnce") {
            print("App already launched")
            return true
        } else {
            defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
            print("App launched first time")
            return false
        }
    }
    
    
    
    let boxTUT = SKLabelNode(text: "Hello")
    
    let level1 =   """
                     Good job cadet, keep train your self destroying more asteroids.
                     Go over the limit of 100 points!
                    """
    
    
    
    
    func setupNodes() {
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        gameLayer.addChild(hero)
        
     
    
    }
    

    
    
    func setupJoystick() {
        hudLayer.addChild(analogJoystick)
        hudLayer.addChild(progressBar)
        hudLayer.addChild(pauseButton)
        hudLayer.addChild(scoreLabel)
            scoreLabel.zPosition = 3
        hudLayer.addChild(timlab)
        gameLayer.addChild(star!)
            star?.zPosition = -0.1
        gameLayer.addChild(star2!)
            star2?.zPosition = -0.1
        
        
            analogJoystick.trackingHandler = { [weak self] data in
                guard let mySelf = self else { return }
                mySelf.hero.position = CGPoint(x: mySelf.hero.position.x + (data.velocity.x * mySelf.velocityMultiplier),
                                             y: mySelf.hero.position.y + (data.velocity.y * mySelf.velocityMultiplier))
                mySelf.hero.zRotation = data.angular
                
                mySelf.analogJoystick.position = CGPoint(x: mySelf.hero.position.x - (ScreenSize.width * 0.45) , y: mySelf.hero.position.y - (ScreenSize.height * 0.55))
                
                mySelf.progressBar.position = CGPoint(x: mySelf.hero.position.x - (ScreenSize.width * 0.45)  , y: mySelf.hero.position.y + (ScreenSize.height * 0.66))
                
                mySelf.scoreLabel.position = CGPoint(x: mySelf.hero.position.x + (ScreenSize.width * 0.45)  , y: mySelf.hero.position.y + (ScreenSize.height * 0.60))
                
                mySelf.star!.position = CGPoint(x: -mySelf.hero.position.x / 15 - (ScreenSize.width * 0.45)  , y: -mySelf.hero.position.y / 15 - (ScreenSize.height * 0.66))
                
                mySelf.star2!.position = CGPoint(x: -mySelf.hero.position.x / 7 - (ScreenSize.width * 0.45)  , y: -mySelf.hero.position.y / 7 - (ScreenSize.height * 0.66))
                
                
                   mySelf.timlab.position = CGPoint(x: mySelf.hero.position.x - (ScreenSize.width * 0.45)  , y: mySelf.hero.position.y + (ScreenSize.height * 0.60))
                
                mySelf.pauseButton.position = CGPoint(x: mySelf.hero.position.x + (ScreenSize.width * 0.45)  , y: mySelf.hero.position.y + (ScreenSize.height * 0.66))
                
            }
    }
    

    
    
    override func didSimulatePhysics() {
        self.camera!.position = hero.position
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
        gameLayer.addChild(asteroidsTileMap!)
        
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
                    
                    self.addChild(tileNode)
                }
            }
        }
    }
}
