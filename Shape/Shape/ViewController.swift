//
//  ViewController.swift
//  Shape
//
//  Created by Saba Khutsishvili on 4/5/21.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        sceneView.debugOptions = [
            SCNDebugOptions.showWorldOrigin,
            SCNDebugOptions.showFeaturePoints
        ]
        
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
        
        drawSphereAtOrigin()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func drawSphereAtOrigin() {
        let geometry = SCNSphere(radius: 0.05)
        let sphere = SCNNode(geometry: geometry)
        sphere.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        sphere.position = SCNVector3(x: 0, y: 0, z: 0)
        
        sceneView.scene.rootNode.addChildNode(sphere)
    }
}
