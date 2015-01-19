//
//  ViewController.swift
//  Weatherman
//
//  Created by ayubi on 19/01/15.
//  Copyright (c) 2015 Gazelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userCity: UITextField!
    @IBOutlet weak var result: UILabel!
    
    
    @IBAction func findWeather(sender: AnyObject) {
        
        var city = userCity.text.stringByReplacingOccurrencesOfString(" ", withString: "-")
        
        var url = NSURL(string: "http://www.weather-forecast.com/locations/"+city+"/forecasts/latest")
        var weather = ""
        
        println(url)
        
        if url != nil{
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
                
                var urlError = false
                if error == nil{
                    
                    var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding) as NSString!
                    //println(urlContent)
                    
                    var urlContentArray = urlContent.componentsSeparatedByString("<span class=\"phrase\">")
                    if urlContentArray.count > 0{
                        
                        var weatherArray = urlContentArray[1].componentsSeparatedByString("</span>")
                        weather = weatherArray[0] as String
                        weather = weather.stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                        println(weather)
                        
                    }
                    else{
                        urlError = true
                    }
                    
                }
                    
                else{
                    urlError = true
                    
                }
                
                dispatch_async(dispatch_get_main_queue()){
                    
                    if ( urlError == true){
                        self.showError()
                    }else{
                        self.result.text = weather
                        
                    }
                    
                }
                
            })
            
            task.resume()
            
            
            
        }
        else{
            showError()
            
        }

        
    }
    
    func showError(){
        result.text = "Couldn't find weather for "+userCity.text+". Please try again"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

