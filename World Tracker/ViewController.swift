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
    
    //this is used to track the positio and orientation of device relative to the real world
    //
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.session.run(configuration)
    }


}

