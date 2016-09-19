//
//  DTUSenceKit.swift
//  DTUSenseCore
//
//  Created by Trevon Fernando on 9/16/16.
//  Copyright © 2016 DTU. All rights reserved.
//

import Foundation


public enum SensorType:String {
    case Battery
    case Accelerometer
}

public class DTUSenceKit {
    
    public static let sharedInstance = DTUSenceKit()
    private init() {}
    
    let sensorManager = DTUSensorManager()
    
    //MARK: - Sensor Availability 
    
    public func isSensorAvailable(sensor : SensorType) -> Bool {
        return sensorManager.isSensorAvailable(sensor: sensor)
    }
    
    
    public func registerSensor(sensor : SensorType) {
        sensorManager.registerSensor(sensor: sensor)
    }
    
    
    public func subscribeToSensor(sensorType : SensorType , handler : @escaping DTUSensorDataHandler.CompletionBlock) {
        sensorManager.subscribeToSensor(sensorType: sensorType, handeler: handler)
    }
    
    
    public func startContinuousSensingWithSensor(sensorType : SensorType) {
        self.sensorManager.startContinuousSensingWithSensor(sensorType: sensorType)
    }
    
}

