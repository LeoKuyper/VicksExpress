//
//  ViewController.swift
//  VicksExpress
//
//  Created by Leo Kuyper on 2020/05/24.
//  Copyright © 2020 Leo Kuyper. All rights reserved.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    @IBOutlet var TextBox: UIVisualEffectView!
    @IBOutlet var TitleLabel: UILabel!
    @IBOutlet var BodyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        //Custom Behaviour
        boxAnchor.actions.pain.onAction = handlePain(_:)
        boxAnchor.actions.ear.onAction = handleEar(_:)
        boxAnchor.actions.chest.onAction = handleChest(_:)
        boxAnchor.actions.back.onAction = handleBack(_:)
    }
    
        var old = "data";
    
        func handlePain(_ entity: Entity?){
            guard entity != nil else {return}
            
            print("Pain Tapped")
            textBoxToggle(type: "pain")
            textBoxData(text: "pain")
        }
    
        func handleEar(_ entity: Entity?){
            guard entity != nil else {return}
            
            print("Ear Tapped")
            textBoxToggle(type: "ear")
            textBoxData(text: "ear")
        }
    
        func handleChest(_ entity: Entity?){
            guard entity != nil else {return}
            
            print("Chest Tapped")
            textBoxToggle(type: "chest")
            textBoxData(text: "chest")
        }
    
        func handleBack(_ entity: Entity?){
            guard entity != nil else {return}
            
            print("Back Tapped")
            textBoxToggle(type: "back")
            textBoxData(text: "back")
        }
    
    func textBoxToggle(type :String) {
        
        if (type == old){
            if (TextBox.isHidden == false){
                TextBox.isHidden = true
            }
            else{
                TextBox.isHidden = false
            }
        }
            old = type
        }
    
    func textBoxData(text: String){
        if (text == "pain"){
            TitleLabel.text = "How to use Vicks with a cut or painful area?"
            BodyLabel.text = "Apply to the painful area"
        }
        if (text == "ear"){
            TitleLabel.text = "How to use Vicks to stop ear pain"
            BodyLabel.text = "Take a cotton swob and and apply Vicks"
        }
        if (text == "back"){
            TitleLabel.text = "How to use Vicks on your back?"
            BodyLabel.text = "Apply"
        }
        if (text == "chest"){
            TitleLabel.text = "How to use Vicks on you chest"
            BodyLabel.text = "Apply"
        }
       
    }
    
}
