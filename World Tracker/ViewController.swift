//
//  ViewController.swift
//  World Trakcer
//
//  Created by Arrianne O'shea on 03/02/2020.
//  Copyright © 2020 Arrianne Barker. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    
    //this is used to track the position and orientation of device relative to the real world
    //
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add(_ sender: Any) {
        // A node is a position in space
        let node = SCNNode()
        
        // Let's give our node a shape
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        // The rootnode is our origin location in our scene
        // by making our node a child of that it will always stay relative
        self.sceneView.scene.rootNode.addChildNode(node)
    }



}

