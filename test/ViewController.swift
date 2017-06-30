//
//  ViewController.swift
//  test
//
//  Created by 林志遠 on 2017/4/20.
//  Copyright © 2017年 林志遠. All rights reserved.
//

import UIKit
import AudioUnit

class ViewController: UIViewController {

    @IBOutlet weak var rockerButton: UIImageView!
    @IBOutlet weak var rockerView: UIImageView!
    
    var buttonX:CGFloat = 0.0
    var buttonY:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rockerPan = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        
        rockerButton.isUserInteractionEnabled = true
        
        rockerButton.addGestureRecognizer(rockerPan)
        
        buttonX = rockerButton.center.x
        buttonY = rockerButton.center.y
        
    }

    @objc func handlePan(sender:UIPanGestureRecognizer){

        let translation = sender.translation(in: self.view)
        
        let x = abs(buttonX-((sender.view?.center.x)! + translation.x))
        let y = abs(buttonY-((sender.view?.center.y)! + translation.y))
        if(sqrt(x * x + y * y)<20){
            sender.view?.center = CGPoint(x: (sender.view?.center.x)! + translation.x, y: (sender.view?.center.y)! + translation.y)
            sender.setTranslation(CGPoint.zero, in: self.view)
            
            print("x:\(translation.x)   y:\(translation.y)")
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(event!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

