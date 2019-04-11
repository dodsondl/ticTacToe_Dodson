//
//  SKScene.swift
//  ticTacToe_Dodson
//
//  Created by Daniel Dodson on 4/11/19.
//  Copyright © 2019 Daniel Dodson. All rights reserved.
//

import UIKit
import SpriteKit

class KScene: SKScene {

    
    override func didMove(to view: SKView) {
        
        addEmitter()
    }
    
    func addEmitter() {
        
        let emitter = SKEmitterNode(fileNamed: "Gem")!
        emitter.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(emitter)
    }
    
}
