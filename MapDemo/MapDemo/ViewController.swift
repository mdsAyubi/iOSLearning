//
//  ViewController.swift
//  MapDemo
//
//  Created by ayubi on 17/03/15.
//  Copyright (c) 2015 Gazelle. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var latitude:CLLocationDegrees = 40.7
        var longitude:CLLocationDegrees = -73.9
        
        var latDelta:CLLocationDegrees = 0.01 //for latitudinal zoom
        var longDelta:CLLocationDegrees = 0.01 //for longitudinal zoom
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated:true)
        
        //Adding annotation
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "Blaah"
        annotation.subtitle = "Blah blah blah.."
        
        map.addAnnotation(annotation)
        
        //Enabling user to pin a place...using long press gesture recognizer
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")//Adding a colon ensures that the arguments are sent when the function action gets called
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
        
        
    }
    
    func action(gestureRecognizer: UIGestureRecognizer){
        println("gesture recongnized... ")
        
        var touchPoint = gestureRecognizer.locationInView(self.map)
        var newCoordinate:CLLocationCoordinate2D = map.convertPoint(touchPoint,toCoordinateFromView:self.map)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = newCoordinate
        annotation.title = "new place"
        annotation.subtitle = "Blah blah blah.."
        
        map.addAnnotation(annotation)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

