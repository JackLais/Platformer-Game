//
//  Sahil.swift
//  Platformer Game
//
//  Created by Student on 4/7/22.
//

import SpriteKit
import GameplayKit

enum SahilFacing:CGFloat {
    case forward = 1.0
    case backward = -1.0
}

enum SahilMoveState:CGFloat {
    case still = 0
    case walking = 1
    case running = 2
    case jumping = 3
    case sliding = 4
}

class Sahil: SKSpriteNode {
    //static let walkAnimationA = Sahil.makeAnimations(texName: "Idle")
}
