//
//  ViewController.swift
//  FirstApp
//
//  Created by JY Jang on 2024/09/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slide: UISlider!
    
    var second = 0
    
    var timer: Timer?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainUI()
        
    }
    
    func mainUI() {
        mainLabel.text = "초를 입력하세요"
    }
    
    @IBAction func sliderMove(_ sender: UISlider) {
        second = Int(slide.value * 60)
        mainLabel.text = "\(second)초"
        
        
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)

    }
    
    @objc func runTimedCode() {
        second -= 1
        slide.value = Float(second) / Float(60)
        mainLabel.text = "\(second)초"
        
        if second < 1 {
            slide.value = 0.5
            mainLabel.text = "초를 입력하세요"
            timer?.invalidate()
        }
    }

    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        slide.value = 0.5
        mainLabel.text = "초를 입력하세요"
        timer?.invalidate()
    }
    
    
    


}

