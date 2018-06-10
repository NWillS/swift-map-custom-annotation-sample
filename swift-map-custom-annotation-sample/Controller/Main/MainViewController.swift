//
//  MainViewController.swift
//  swift-map-custom-annotation-sample
//
//  Created by devWill on 2018/06/10.
//  Copyright © 2018年 devWill. All rights reserved.
//

import UIKit
import MapKit

class MainViewController: UIViewController {
    @IBOutlet weak var sampleMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sampleMapView.delegate = self
        
        //中心座標
        let center = CLLocationCoordinate2DMake(35.658581, 139.745433)
        
        //表示範囲
        let span = MKCoordinateSpanMake(0.005, 0.005)
        
         //中心座標と表示範囲をマップに登録する
        let region = MKCoordinateRegionMake(center, span)
        sampleMapView.setRegion(region, animated: true)
        
        let tokyoTowerAnnotation = MKPointAnnotation()
        tokyoTowerAnnotation.coordinate = CLLocationCoordinate2DMake(35.658581, 139.745433)
        tokyoTowerAnnotation.title = "東京タワー"
        sampleMapView.addAnnotation(tokyoTowerAnnotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MainViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        let annotationIdentifier = "AnnotationIdentifier"
        
        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
        }
        
        if let annotationView = annotationView {
            
            annotationView.canShowCallout = true
            annotationView.image = #imageLiteral(resourceName: "TokyoTower")
        }
        
        return annotationView
    }
}
