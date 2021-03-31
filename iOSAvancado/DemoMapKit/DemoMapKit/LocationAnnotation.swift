//
//  LocationAnnotation.swift
//  DemoMapKit
//
//  Created by Ian Manor on 31/03/21.
//

import MapKit
import Contacts

class LocationAnnotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String?
    let coordinate: CLLocationCoordinate2D

    init(
        title: String?,
        locationName: String?,
        coordinate: CLLocationCoordinate2D
    ) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate

        super.init()
    }

    var subtitle: String? {
        return locationName
    }
}

extension LocationAnnotation {
    var mapItem: MKMapItem? {
        guard let location = locationName else {
            return nil
        }

        let addressDict = [CNPostalAddressStreetKey: location]
        let placemark = MKPlacemark(
            coordinate: coordinate,
            addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
}
