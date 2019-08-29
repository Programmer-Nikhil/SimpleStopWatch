//
//  ViewController.swift
//  StopWatch
//
//  Created by Nikhil Devgire on 29/08/19.
//  Copyright © 2019 Nikhil Devgire. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var stopWatchLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    //MARK: - Variables
    var counter : Float = 0.0 {
        didSet {
            stopWatchLabel.text = String(format: "%.1f", counter);
        }
    }
    
    var timer : Timer? = Timer();
    var isPlaying = false;
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counter = 0;
    }
    
    //MARK: - Actions
    @IBAction func resetButtonClicked(_ sender: Any) {
        startButton.isEnabled = true
        stopButton.isEnabled = true
        
        if let activeTimer = timer {
            activeTimer.invalidate()
        }
        
        timer = nil
        isPlaying = false
        counter = 0
    }
    
    @IBAction func startButtonClicked(_ sender: Any) {
        
        startButton.isEnabled = false
        stopButton.isEnabled = true
        
        
        if let activeTimer = timer {
            activeTimer.invalidate()
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func stopButtonClicked(_ sender: Any) {
        stopButton.isEnabled = false
        startButton.isEnabled = true
        
        if let activeTimer = timer {
            activeTimer.invalidate()
        }
        
        timer = nil
        isPlaying = false
    }
    
    //MARK: - Private Methods
    @objc func updateTimer() {
        counter = counter + 0.1
    }
}

