//
//  ViewController.swift
//  Text
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
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        
        let text = SCNText(string: "Hello", extrusionDepth: 0.1)
        text.firstMaterial?.diffuse.contents = UIColor.orange
        
        let textNode = SCNNode(geometry: text)
        textNode.position = SCNVector3(x: 0, y: 0, z: -1)
        textNode.scale = SCNVector3(x: 0.02, y: 0.02, z: 0.02)
        
        sceneView.scene.rootNode.addChildNode(textNode)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}
