//
//  ViewController.swift
//  GoogleMapSwift
//
//  Created by Ziyang Tan on 2/10/15.
//  Copyright (c) 2015 Ziyang Tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GMSMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var camera = GMSCameraPosition.cameraWithLatitude(-33.86,
            longitude: 151.20, zoom: 6)
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        mapView.delegate = self
        self.view = mapView
        
        var marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: GMSMapView!, markerInfoWindow marker: GMSMarker!) -> UIView! {
        var infoWindow = NSBundle.mainBundle().loadNibNamed("CustomInfoWindow", owner: self, options: nil).first! as CustomInfoWindow
        infoWindow.label.text = "\(marker.position.latitude) \(marker.position.longitude)"
        return infoWindow
    }
    
    func getDistanceMetresBetweenLocationCoordinates(coord1: CLLocationCoordinate2D, coord2: CLLocationCoordinate2D) -> Double {
        var location1 = CLLocation(latitude: coord1.latitude, longitude: coord1.longitude)
        var location2 = CLLocation(latitude: coord2.latitude, longitude: coord2.longitude)
        return location1.distanceFromLocation(location2)
    }
}

