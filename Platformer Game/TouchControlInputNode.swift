//
//  TouchControlInputNode.swift
//  Platformer Game
//
//  Created by Student on 4/6/22.
//

import SpriteKit

class TouchControlInputNode : SKSpriteNode {
    
    var alphaUnpressed : CGFloat = 0.5
    var alphaPressed : CGFloat = 0.9
    
    var pressedButtons = [SKSpriteNode]()
    
    var inputDelegate : ControlInputDelegate?
    
    let buttonUp = SKSpriteNode(imageNamed: "ArrowUp")
    let buttonDown = SKSpriteNode(imageNamed: "ArrowDown")
    let buttonLeft = SKSpriteNode(imageNamed: "ArrowLeft")
    let buttonRight = SKSpriteNode(imageNamed: "ArrowRight")
    
    let buttonA = SKSpriteNode(imageNamed: "ButtonA")
    let buttonB = SKSpriteNode(imageNamed: "ButtonB")
    
    init(frame: CGRect) {
        super.init(texture: nil, color: UIColor.clear, size: frame.size)
        
        setupControls(size: frame.size)
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupControls(size: CGSize) {
        addButton(button: buttonUp, position: CGPoint(x: -(size.width) / 3, y: -size.height / 4 + 50 ), name: "up", scale: 2.0)
        addButton(button: buttonDown, position: CGPoint(x: -(size.width) / 3, y: -size.height / 4 + 50 ), name: "down", scale: 2.0)
        addButton(button: buttonLeft, position: CGPoint(x: -(size.width) / 3, y: -size.height / 4 + 50 ), name: "left", scale: 2.0)
        addButton(button: buttonRight, position: CGPoint(x: -(size.width) / 3, y: -size.height / 4 + 50 ), name: "right", scale: 2.0)
        addButton(button: buttonA, position: CGPoint(x: -(size.width) / 3, y: -size.height / 4 + 50 ), name: "A", scale: 2.0)
        addButton(button: buttonB, position: CGPoint(x: -(size.width) / 3, y: -size.height / 4 + 50 ), name: "B", scale: 2.0)
    }
    
    func addButton(button: SKSpriteNode, position: CGPoint, name: String, scale: CGFloat)
    {
        button.position = position
        button.setScale(scale)
        button.name = name
        button.zPosition = 10
        button.alpha = alphaUnpressed
        self.addChild(button)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            
            let location = t.location(in: parent!)
            
            //for all 6-8 buttons listed below
            
            for button in [buttonA, buttonB, buttonUp, buttonDown, buttonLeft, buttonRight] {
                
                if button.contains(location) && pressedButtons.index(of: button) == nil {
                    pressedButtons.append(button)
                    if inputDelegate != nil {
                        inputDelegate?.follow(command: button.name)
                    }
                }
                
                if pressedButtons.index(of: button) == nil {
                    button.alpha = alphaPressed
                }
                else {
                    button.alpha = alphaUnpressed
                }
            }
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            
            let location = t.location(in: parent!)
            let previouslocation = t.previousLocation(in: parent!)
            
            for button in [buttonA, buttonB, buttonUp, buttonDown, buttonLeft, buttonRight] {
                
            }
        }
    }

}
