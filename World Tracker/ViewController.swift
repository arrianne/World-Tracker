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
        
        // Adding an omnidirectional light source on the scene view
        self.sceneView.autoenablesDefaultLighting = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add(_ sender: Any) {
        // A node is a position in space
        let node = SCNNode()
        
        // Let's give our node a shape - this is a cube
//        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        
        
        // Freestyle shape
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0.2))
        path.addLine(to: CGPoint(x: 0.2, y: 0.3))
        let shape = SCNShape(path: path, extrusionDepth: 0.2)
        node.geometry = shape
        
        
        // Providing the range of positions for the box
        let x = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let y = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let z = randomNumbers(firstNum: -0.6, secondNum: -0.4)
        

        // Let's give our node an exact position in relation to our starting origin
        // This is based on x,y and z axis
        node.position = SCNVector3(x,y,z)
        
        // Specular is light that is reflected off a surface (needs a light source though)
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        
        // first material defines the surface of the node, diffuse defines the colour
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.systemPink
        
        // The rootnode is our origin location in our scene
        // by making our node a child of that it will always stay relative
        self.sceneView.scene.rootNode.addChildNode(node)
    }

    @IBAction func reset(_ sender: Any) {
        // Every time we press reset, first we have to pause the session
        self.restartSession()
    }
    
    func restartSession(){
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            // by removing the box from the parent node, we are removing it from the scene view
            node.removeFromParentNode()
        }
        // Restarting the scene view but forgetting the original origin and creating a new one
        self.sceneView.session.run(configuration, options:
            [.resetTracking, .removeExistingAnchors])
    }
    
    // Returns a random value within the range that you give it
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
     return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }

}

