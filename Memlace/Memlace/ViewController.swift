//
//  ViewController.swift
//  Memlace
//
//  Created by ayubi on 23/03/15.
//  Copyright (c) 2015 Gazelle. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    var manager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        if activePlace == -1 {
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        }else{
            let latitude = NSString(string:places[activePlace]["lat"]!).doubleValue
            let longitude = NSString(string:places[activePlace]["long"]!).doubleValue
            
            
            var coordinate = CLLocationCoordinate2DMake(latitude, longitude)
            
            var latDelta:CLLocationDegrees = 0.01
            var longDelta:CLLocationDegrees = 0.01
            
            var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
            var region:MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
            
            self.map.setRegion(region, animated: true)
            
            
            var annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = places[activePlace]["name"]
            self.map.addAnnotation(annotation)
            
            
        }
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        uilpgr.minimumPressDuration = 2.0
        map.addGestureRecognizer(uilpgr)
    }
    
    func action(gestureRecognizer: UIGestureRecognizer){
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began{
            
            var touchPoint = gestureRecognizer.locationInView(self.map)
            var newCoordinate = self.map.convertPoint(touchPoint, toCoordinateFromView: self.map)
            
            var location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
            
            CLGeocoder().reverseGeocodeLocation(location, completionHandler:{ (placemarks, error)->Void in
                
                var title = ""
                if error == nil {
                    
                    if let p = CLPlacemark(placemark: placemarks?[0] as! CLPlacemark) {
                        var locality = ""
                        var country = ""
                        
                        if p.locality != nil {
                            locality = p.locality
                            //println(locality)
                        }
                        if p.country != nil {
                            country = p.country
                            //println(country)
                        }
                        
                        title = "\(locality), \(country)"
                        
                    }
                    
                }
                
                if ( title == ""){
                    title = "Added \(NSDate())"
                }
                
                places.append(["name":title,"lat":"\(newCoordinate.latitude)","long":"\(newCoordinate.longitude)"])
                
                var annotation = MKPointAnnotation()
                annotation.coordinate = newCoordinate
                annotation.title = title
                self.map.addAnnotation(annotation)
                
            })
            
         
            
        }
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        //println(locations)
        
        var userLocation:CLLocation = locations[0] as! CLLocation
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        
        var coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        
        var latDelta:CLLocationDegrees = 0.01
        var longDelta:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var region:MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
        
        self.map.setRegion(region, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

