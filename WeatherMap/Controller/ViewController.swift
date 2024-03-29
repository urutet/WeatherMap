//
//  ViewController.swift
//  WeatherMap
//
//  Created by Yushkevich Ilya on 20.02.22.
//

import UIKit
import SnapKit
import MapKit

final class ViewController: UIViewController {

    // MARK: - Properties
    // MARK: Public
    // MARK: Private
    private let map = MKMapView()
    private let locationManager = CLLocationManager()
    private let region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 53.893220, longitude: 27.556033),
        latitudinalMeters: 10000,
        longitudinalMeters: 10000
    )
    private let arrowImage = UIImage(systemName: "arrow.up.left")
    private let arrowImageView = UIImageView()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Моя локация", style: .plain, target: self, action: #selector(goToDefaultLocation))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cloud"), style: .plain, target: self, action: #selector(getWeather))
        locationManager.requestWhenInUseAuthorization()
        setupUI()
        addSubviews()
        addConstraints()
    }
    
    // MARK: - API
    // MARK: - Setups
    private func setupUI() {
        arrowImageView.image = arrowImage
        map.setRegion(region, animated: true)
        
        let point = MKPointAnnotation()
        point.coordinate = CLLocationCoordinate2D(latitude: 53.8920185, longitude: 27.5551602)
        point.title = "Belarusian State Technological University"
        map.addAnnotation(point)
        
    }
    
    private func addSubviews() {
        view.addSubview(map)
        map.addSubview(arrowImageView)
    }
    
    private func addConstraints() {
        map.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        arrowImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    // MARK: - Helpers
    @objc private func goToDefaultLocation() {
        if let coordinate = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(
                center: coordinate,
                latitudinalMeters: 10000,
                longitudinalMeters: 10000
            )
            map.setRegion(region, animated: true)
        }
    }

    @objc private func getWeather() {
            NetworkManager.getWeather(coordinates: map.centerCoordinate) { weather in
                let alert = UIAlertController(title: "Weather", message: "Temp: \(weather.main?.temp ?? 0) F \nHumidity: \(weather.main?.humidity ?? 0) \nPressure: \(weather.main?.pressure ?? 0)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        //get selected annotation title???
    }
}

