//
//  ViewController.swift
//  NaverMapAPITest
//
//  Created by 이주혁 on 2020/12/12.
//

import UIKit
import NMapsMap

class ViewController: UIViewController {

    @IBOutlet weak var naverMapView: NMFNaverMapView!
    var mapView: NMFMapView {
        return naverMapView.mapView
    }
    var camera: NMFCameraUpdate!
    let coord = NMGLatLng(lat: 37.48101907116926, lng: 126.89632142650325)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        mapView.touchDelegate = self
        setLocationOverlay()
//        setCamera()
//        setMarker()
    }
    
    func setLocationOverlay() {
        naverMapView.showLocationButton = true
        mapView.positionMode = .compass
        
        let locationOverlay = mapView.locationOverlay
        locationOverlay.hidden = false
//        locationOverlay.icon = NMFOverlayImage(image: UIImage(systemName: "pencil")!)
    }
    
    func setCamera() {
//        let co = NM
        camera = NMFCameraUpdate(scrollTo: coord)
        camera.animation = .linear
        mapView.moveCamera(camera)
    }
    
    func setMarker() {
        let marker = NMFMarker()
        marker.position = coord
        marker.iconImage = NMapsMap.NMF_MARKER_IMAGE_PINK
        marker.mapView = mapView
    }
}

extension ViewController: NMFMapViewTouchDelegate {
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        print("\(latlng)")
    }
    
    func mapView(_ mapView: NMFMapView, didTap symbol: NMFSymbol) -> Bool {
        print(symbol)
 
        return true
    }
}




















//class ViewController: UIViewController {
//
//    @IBOutlet var mapView: NMFMapView!
//
//
//    var camera: NMFCameraUpdate!
//
//    let coord = NMGLatLng(lat: 37.48101907116926, lng: 126.89632142650325)
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        camera = NMFCameraUpdate(scrollTo: coord)
//        camera.animation = .linear
//        mapView.moveCamera(camera)
//
//        let marker = NMFMarker()
//        marker.position = coord
//        marker.iconImage = NMapsMap.NMF_MARKER_IMAGE_PINK
//        marker.mapView = mapView
//    }
//}
