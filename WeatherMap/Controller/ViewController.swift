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
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addSubviews()
        addConstraints()
    }
    
    // MARK: - API
    // MARK: - Setups
    private func setupUI() {
        
    }
    
    private func addSubviews() {
        view.addSubview(map)
    }
    
    private func addConstraints() {
        map.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    // MARK: - Helpers



}

