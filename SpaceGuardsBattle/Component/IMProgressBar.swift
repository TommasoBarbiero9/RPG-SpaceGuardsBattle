//
//  IMProgressBar.swift
//  SpaceGuardsBattle
//
//  Created by Piero Chianese on 17/02/22.
//

import Foundation

import SpriteKit


class IMProgressBar : SKNode{

var emptySprite : SKSpriteNode? = nil
var progressBar : SKCropNode
init(emptyImageName: String!,filledImageName : String)
{
    progressBar = SKCropNode()
    super.init()
    let filledImage  = SKSpriteNode(imageNamed: filledImageName)
    progressBar.addChild(filledImage)
    progressBar.maskNode = SKSpriteNode(color: UIColor.white,
        size: CGSize(width: filledImage.size.width * 2, height: filledImage.size.height * 2))

    progressBar.maskNode?.position = CGPoint(x: -filledImage.size.width / 2,y: -filledImage.size.height / 2)
    progressBar.zPosition = 0.1
    self.addChild(progressBar)

    if emptyImageName != nil{
        emptySprite = SKSpriteNode.init(imageNamed: emptyImageName)
        self.addChild(emptySprite!)
    }
}
    func setXProgress(xProgress : CGFloat){
        let value = xProgress
        if value < 0 {
            progressBar.maskNode?.xScale = 0
        }else {
            progressBar.maskNode?.xScale = value
            
        }
    }

    func setYProgress(yProgress : CGFloat){
        var value = yProgress
        if yProgress < 0{
            value = 0
        }
        if yProgress > 1 {
            value = 1
        }
        progressBar.maskNode?.yScale = value
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }}
