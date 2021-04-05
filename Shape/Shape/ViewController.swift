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
        
        drawEarthAtOrigin()
        drawBoxAt1200High()
        drawPyramidAt600Low()
        drawPlaneAt900()
        drawTorusAt300()
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
    
    func drawEarthAtOrigin() {
        let geometry = SCNSphere(radius: 0.05)
        let earth = SCNNode(geometry: geometry)
        earth.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "earth")
        earth.geometry?.firstMaterial?.specular.contents = UIColor.yellow
        earth.position = SCNVector3(x: 0, y: 0, z: 0)
        
        sceneView.scene.rootNode.addChildNode(earth)
    }
    
    func drawBoxAt1200High() {
        let geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        let box = SCNNode(geometry: geometry)
        box.position = SCNVector3(x: 0, y: 0.2, z: -0.3)
        box.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        box.geometry?.firstMaterial?.specular.contents = UIColor.white
        
        sceneView.scene.rootNode.addChildNode(box)
    }
    
    func drawPyramidAt600Low() {
        let geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        let pyramid = SCNNode(geometry: geometry)
        pyramid.position = SCNVector3(x: 0, y: -0.2, z: 0.3)
        pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        pyramid.geometry?.firstMaterial?.specular.contents = UIColor.red
        
        sceneView.scene.rootNode.addChildNode(pyramid)
    }
    
    func drawPlaneAt900() {
        let geometry = SCNPlane(width: 0.1, height: 0.1)
        let cat = SCNNode(geometry: geometry)
        cat.position = SCNVector3(x: -0.2, y: 0, z: 0)
        cat.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "cat")
        cat.geometry?.firstMaterial?.isDoubleSided = true
        
        sceneView.scene.rootNode.addChildNode(cat)
    }
    
    func drawTorusAt300() {
        let geometry = SCNTorus(ringRadius: 0.05, pipeRadius: 0.03)
        let torus = SCNNode(geometry: geometry)
        torus.position = SCNVector3(x: 0.2, y: 0, z: 0)
        torus.eulerAngles = SCNVector3(x: .pi / 4, y: 0, z: 0)
        torus.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        torus.geometry?.firstMaterial?.specular.contents = UIColor.white
        
        sceneView.scene.rootNode.addChildNode(torus)
    }
}

extension Int {
    
    func toRadians() -> CGFloat {
        return CGFloat(self) * .pi / 180
    }
}
