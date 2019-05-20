//
//  AppDelegate.swift
//  Nav
//
//  Created by helen on 4/11/19.
//  Copyright © 2019 Helen. All rights reserved.
//


import UIKit
import GoogleMaps
import GooglePlaces



class MapViewController: UIViewController, GMSMapViewDelegate {
    /**
     * Called when an autocomplete request returns an error.
     * @param error the error that was received.
     */
    

    @IBOutlet weak var mapContainer: UIView!
    var mapView: GMSMapView!
    var userBlogPlaces: [String] = []
    //    var placesClient: GMSPlacesClient!
    //    var zoomLevel: Float = 15.0
    
    // The currently selected place.
    //    var selectedPlace: GMSPlace?
    
    
    //    // Update the map once the user has made their selection.
    //    @IBAction func unwindToBlog(segue: UIStoryboardSegue) {
    //        // Clear the map.
    //        mapView.clear()
    //
    //        // Add a marker to the map.
    //        if selectedPlace != nil {
    //            let marker = GMSMarker(position: (self.selectedPlace?.coordinate)!)
    //            marker.title = selectedPlace?.name
    //            marker.snippet = selectedPlace?.formattedAddress
    //            marker.map = mapView
    //        }
    //    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //        changeMarkerInfo("hello", marker: selectedPlace)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        mapView = GMSMapView(frame: self.mapContainer.frame)
        //        self.mapView.settings.myLocationButton = true
        //        self.mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.isUserInteractionEnabled = true
        //        self.mapView.isMyLocationEnabled = true
        self.view.addSubview(self.mapView)
        mapView.delegate = self
        
        setMarker(-33.86, 151.20, "Sydney, Australia", "great place!")
    }
    
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        print("You tapped at \(coordinate.latitude), \(coordinate.longitude)")
        
        var inputTextField: UITextField?
        let placeNamePrompt = UIAlertController(title: "Place Name", message: "What's the name of the place you want to save?", preferredStyle: UIAlertController.Style.alert)
        placeNamePrompt.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action) -> Void in
            return
        }))
        
        placeNamePrompt.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) -> Void in
            // Now do whatever you want with inputTextField (remember to unwrap the optional)
            
            self.userBlogPlaces.append(inputTextField?.text ?? "Unnamed")
            print(self.userBlogPlaces)
            self.setMarker(coordinate.latitude, coordinate.longitude, inputTextField!.text ?? "Unnamed", "")
        }))
        placeNamePrompt.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "City Name"
            inputTextField = textField
        })
        
        present(placeNamePrompt, animated: true, completion: nil)
        
    }
    
    
    
    func setMarker(_ lat: Double, _ lon: Double, _ name: String, _ info: String) {
        
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lon, zoom: 6)
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        marker.title = name
        marker.snippet = info
        marker.map = mapView
        mapView.camera = camera
        
    }
    
    func changeMarkerInfo(_ info : String, marker: GMSMarker){
        marker.snippet = info
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        
        performSegue(withIdentifier: "createPost", sender: marker)
        
        
    }
    


    @IBAction func newBlogPostButtonPushed(_ sender: Any) {
        performSegue(withIdentifier: "createPost", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
        let dest : newBlogPostViewController = segue.destination as! newBlogPostViewController
        guard let marker = sender as? GMSMarker else { return }
        dest.markerCityName = marker.title ?? ""
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
