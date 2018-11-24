//
//  MapViewController.swift
//  FoodPin
//
//  Created by Arpik Sargsyan on 11/24/18.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      // Convert address to coordinate and annotate it on map
        
        let geoCoder = CLGeocoder()
        
        print(restaurant.location)
        
        geoCoder.geocodeAddressString(restaurant.location, completionHandler: { placemarks, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let placemarks = placemarks {
                
                // Get the first placemark
                let placemark = placemarks[0]
                
                // Add annotation
                
                let annotation = MKPointAnnotation()
                
                if let location = placemark.location {
                    
                    // Display the annotation
                    
                    annotation.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotation)
                    
                    //Set the zoom level
                    
                    let region = MKCoordinateRegion (center: annotation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
                    self.mapView.setRegion(region, animated: false)
                }
            }
        })
    }
}
