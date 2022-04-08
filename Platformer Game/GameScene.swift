//
//  GameScene.swift
//  Platformer Game
//
//  Created by Student on 4/5/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var lastUpdateTime : TimeInterval = 0
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    override func sceneDidLoad() {
        self.lastUpdateTime = 0
    }
    
    override func update(_ currentTime: TimeInterval) {
        if self.lastUpdateTime == 0 {
            self.lastUpdateTime = currentTime
        }
        
        let dt = currentTime - self.lastUpdateTime
        
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
    }
    
}
