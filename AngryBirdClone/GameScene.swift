//
//  GameScene.swift
//  AngryBirdClone
//
//  Created by ali_dln on 18.03.2020.
//  Copyright © 2020 ali_dln. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene,SKPhysicsContactDelegate{
    
  
    
    
    var bird = SKSpriteNode()
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    
    var gameStarted = false
    
    var originalPosition : CGPoint?
    
    var score = 0
    
    var scoreLabel = SKLabelNode()
    
    
    enum CollisionType : UInt32 {
        
        case bird = 1
        case box = 2
        
        
    }
  
    
    override func didMove(to view: SKView) {
       
        /*
        let texture = SKTexture(imageNamed: "AngryBird")
        
        bird2 = SKSpriteNode(texture: texture)
        
        bird2.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 16)
        bird2.position = CGPoint(x: -self.frame.width / 4, y: -self.frame.height / 4)
        bird2.zPosition = -1
            
        self.addChild(bird2)
     */
        
        bird = childNode(withName: "bird") as! SKSpriteNode
        
            // Physics Body
        let texture = SKTexture(imageNamed: "AngryBird")
        
            // Bird
        
        bird.physicsBody = SKPhysicsBody(circleOfRadius: texture.size().height / 13)
        
        
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.mass = 0.15
        bird.physicsBody?.isDynamic = true
        
        bird.physicsBody?.categoryBitMask = CollisionType.bird.rawValue
        bird.physicsBody?.collisionBitMask = CollisionType.bird.rawValue
        bird.physicsBody?.contactTestBitMask = CollisionType.box.rawValue
        
        
        originalPosition = bird.position
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
        self.physicsWorld.contactDelegate = self
        
        
        let boxTexture = SKTexture(imageNamed: "Brick")
        let size = CGSize(width: boxTexture.size().width / 6 , height: boxTexture.size().height / 6)
        
        box1 = childNode(withName: "box1") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: size)
        box1.physicsBody?.mass = 0.4
        box1.physicsBody?.affectedByGravity = true
        box1.physicsBody?.isDynamic = true
        box1.physicsBody?.allowsRotation = true
        
        box1.physicsBody?.collisionBitMask = CollisionType.bird.rawValue
        
        box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: size)
        box2.physicsBody?.mass = 0.4
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.allowsRotation = true
              
        box2.physicsBody?.collisionBitMask = CollisionType.bird.rawValue
        
        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: size)
        box3.physicsBody?.mass = 0.4
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.allowsRotation = true
        
        box3.physicsBody?.collisionBitMask = CollisionType.bird.rawValue
              
        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: size)
        box4.physicsBody?.mass = 0.4
        box4.physicsBody?.affectedByGravity = true
        box4.physicsBody?.isDynamic = true
        box4.physicsBody?.allowsRotation = true
        
        box4.physicsBody?.collisionBitMask = CollisionType.bird.rawValue
              
        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: size)
        box5.physicsBody?.mass = 0.4
        box5.physicsBody?.affectedByGravity = true
        box5.physicsBody?.isDynamic = true
        box5.physicsBody?.allowsRotation = true
        
        box5.physicsBody?.collisionBitMask = CollisionType.bird.rawValue
        
        
        
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 60
        scoreLabel.position = CGPoint(x: 0, y: self.frame.height / 4)
        scoreLabel.zPosition = 3
        scoreLabel.text = "0"
        
        self.addChild(scoreLabel)
              
        
        
     
        }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
    
        if contact.bodyA.collisionBitMask == CollisionType.bird.rawValue || contact.bodyB.contactTestBitMask == CollisionType.bird.rawValue {
            
            
            score = score + 1
            
            scoreLabel.text = String(score)
            
            
        }
        
        
    }
        
      
    
    
    func touchDown(atPoint pos : CGPoint) {
       
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       /*
        bird.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 100))
        bird.physicsBody?.affectedByGravity = true
        
        */
        
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    
                    
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            
                            if sprite == bird {
                                bird.position = touchLocation
                                
                            }
                           
                        }
                      
                    }
               
            }
            
            
        }
        
        }
      
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    
                    
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            
                            if sprite == bird {
                                bird.position = touchLocation
                                
                            }
                           
                            
                        }
                       
                    }
               
            }
            
            
        }
        
        }
      
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    
                    
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            
                            if sprite == bird {
                                
                                let dx = -(touchLocation.x - originalPosition!.x)
                                let dy = -(touchLocation.y - originalPosition!.y)
                                
                                let impulse = CGVector(dx: dx, dy: dy)
                                
                                
                                bird.physicsBody?.affectedByGravity = true
                                bird.physicsBody?.applyImpulse(impulse)
                                
                                gameStarted = true
                                
                                
                            }
                           
                            
                        }
                        
                    }
               
            }
            
            
        }
        
        }
        
       
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        
        if let physicBody = bird.physicsBody {
            
            if physicBody.velocity.dx <= 0.1 && physicBody.velocity.dy <= 0.1 && physicBody.angularVelocity <= 0.1 && gameStarted == true {
                
                bird.physicsBody?.affectedByGravity = false
                bird.physicsBody?.angularVelocity = 0
                bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                bird.zPosition = 1
                bird.position = originalPosition!
                
                gameStarted = false
                
                score = 0
                
                scoreLabel.text = String(score)
                
                
                
                
            }
            
            
            
        }
        
       
    }
}

