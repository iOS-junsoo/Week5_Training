//
//  ViewController.swift
//  Week5_Training
//
//  Created by 준수김 on 2021/10/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weatherLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBtn(_ sender: UIButton) {
        WeatherRequest().getWeatherData(self)
        //WeatherReques인스턴스 생성후 그 안에 있는 getWeatherData를 호출
    }
    
}

extension ViewController {
    
    func didSuccess(_ response: WeatherResponse) {
        
        let weatherMain = response.weather[0].main
        //받은 response에서 첫번째 weather의 main response
        
        self.weatherLabel.text = weatherMain
        
    }
    
}
