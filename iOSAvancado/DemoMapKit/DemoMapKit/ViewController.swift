//
//  ViewController.swift
//  DemoMapKit
//
//  Created by Ian Manor on 31/03/21.
//

import UIKit
import MapKit
import CoreLocation
import Contacts

class ViewController: UIViewController {
    let manager = CLLocationManager()
    private(set) var updating = false

    private var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()

//        let cesarSchoolLocation = CLLocation(latitude: -8.0582375, longitude: -34.8719943)
//        mapView.centerToLocation(cesarSchoolLocation)

//        let recifeCenter = CLLocation(latitude: -8.05389, longitude: -34.88111)
//        let region = MKCoordinateRegion(
//            center: recifeCenter.coordinate,
//            latitudinalMeters: 10000,
//            longitudinalMeters: 10000)
//        mapView.setCameraBoundary(
//            MKMapView.CameraBoundary(coordinateRegion: region),
//            animated: false)
//
//        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 40000)
//        mapView.setCameraZoomRange(zoomRange, animated: false)

        let cesarSchoolCoordinate = CLLocationCoordinate2D(latitude: -8.0582375, longitude: -34.8719943)
        let locationAnnotation = LocationAnnotation(title: "CESAR School", locationName: "Rua Bione, 220", coordinate: cesarSchoolCoordinate)
        mapView.addAnnotation(locationAnnotation)

        mapView.delegate = self
        mapView.showsCompass = true
        mapView.showsUserLocation = true

        manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        manager.distanceFilter = 1
        manager.requestWhenInUseAuthorization()
        manager.delegate = self

        let posto1 = CLLocationCoordinate2D(latitude: -8.059, longitude: -34.8719)
        let posto2 = CLLocationCoordinate2D(latitude: -8.053, longitude: -34.8719)
        let posto3 = CLLocationCoordinate2D(latitude: -8.051, longitude: -34.879)
        let coords = [posto1, posto2, posto3]
        let myPolyline = MKPolyline(coordinates: coords, count: coords.count)

        mapView.addOverlay(myPolyline)
    }

    func configureLayout() {
        view.addSubview(mapView)

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: mapView.topAnchor),
            view.bottomAnchor.constraint(equalTo: mapView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: mapView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: mapView.trailingAnchor),
        ])
    }

    func start() {
        manager.startUpdatingLocation()
        updating = true
        manager.allowsBackgroundLocationUpdates = true
    }

    func stop() {
        manager.stopUpdatingLocation()
        updating = false
        manager.allowsBackgroundLocationUpdates = false
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status:
                            CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            print("successo")
            start()
        case .denied:
            print("autorização negada")
            let settingsURL = URL(string: UIApplication.openSettingsURLString)!
            UIApplication.shared.open(settingsURL)
        default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        // usar location
        print(location)
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let lineView = MKPolylineRenderer(overlay: overlay)
            lineView.strokeColor = .green
            return lineView
        } else if overlay is MKPolygon {
            let polygonView = MKPolygonRenderer(overlay: overlay)
            polygonView.strokeColor = .magenta
            return polygonView
        } else if overlay is MKCircle {
            let circleView = MKCircleRenderer(overlay: overlay)
            circleView.strokeColor = .blue
            return circleView
        }

        return MKOverlayRenderer()
    }

    func mapView(
        _ mapView: MKMapView,
        viewFor annotation: MKAnnotation
    ) -> MKAnnotationView? {
        guard let annotation = annotation as? LocationAnnotation else {
            return nil
        }

        let identifier = "location"

        let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        view.canShowCallout = true
        view.calloutOffset = CGPoint(x: -5, y: 5)
        view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        return view
    }

    func mapView(
        _ mapView: MKMapView,
        annotationView view: MKAnnotationView,
        calloutAccessoryControlTapped control: UIControl
    ) {
        guard let model = view.annotation as? LocationAnnotation else {
            return
        }

        let launchOptions = [
            MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking
        ]
        model.mapItem?.openInMaps(launchOptions: launchOptions)
    }
}

extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 1000
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
