//
//  WeatherRequest.swift
//  Week5_Training
//
//  Created by 준수김 on 2021/10/10.
//

import UIKit
import Alamofire

class WeatherRequest {
    
    func getWeatherData(_ viewController: ViewController) {
        
        let url = "https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=70712209ed38b3c9995cdcdd87bda250"
        //URL은 openweather에서 요구하는 타입으로 URL 선언
        
        let params: Parameters = [
            "q" : "seoul",
            "appid" : "70712209ed38b3c9995cdcdd87bda250"
        ]
        
        // HTTP Method: GET
        AF.request(url, //어떤 URL을 사용할 것인가?
                   method: .get, //어떤 메서드를 사용할 것인가?
                   parameters: params, //어떤 parameter를 사용할 것인가?
                   headers: nil)
            .responseDecodable(of: WeatherResponse.self) { response in //responseDecodable은 원하느 타입으로 Response받기 위해서 필요함.
                
                switch response.result { //성공, 실패여부에 따라 분기문 설정
                
                case .success(let response):
                    print("DEBUG>> OpenWeather Response \(response) ")
                    viewController.didSuccess(response)
                    
                case .failure(let error):
                    print("DEBUG>> OpenWeather Get Error : \(error.localizedDescription)")
                    
                }
            }
    }
    
}
