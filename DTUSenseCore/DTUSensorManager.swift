//
//  DTUSensorManager.swift
//  DTUSenseCore
//
//  Created by Trevon Fernando on 9/16/16.
//  Copyright © 2016 DTU. All rights reserved.
//

import Foundation


public class DTUSensorManager {
    
    
    
    var sensors :  [String: DTUSensor] = [:]
    
    //MARK: - Sensor Availability
    
    func isSensorAvailable(sensor : SensorType) -> Bool {
        switch sensor {
        case .Accelerometer:
            return DTUAccelerometer().isSensorAvailable()
        case .Battery:
            return DTUBattery().isSensorAvailable()
        default:
            print("Unknow Sensor. Sensor Type = \(sensor) ")
        }
    }
    
    
    //MARK: - Sensor Registration
    
    func registerSensor(sensor : SensorType)  {
        print("Register Sensor : \(sensor)" )
        sensors[sensor.rawValue] = createAcelerometerSensor()
    }
    
    
    //MARK: Sensor Creation
    
    //TDOD : Create a common sensor class and the use one method for sensor creation
    
    
    func createAcelerometerSensor() -> DTUAccelerometer {
        return DTUAccelerometer().initWithConfiguration()
    }
    
    
    public func subscribeToSensor(sensorType : SensorType, handeler : @escaping DTUSensorDataHandler.CompletionBlock) {
        print("Subscribe to sensor : \(sensorType.rawValue)")
        getSensor(sensorType: sensorType).subscribeHandler(handler: handeler)
    }
    
    
    public func getSensor(sensorType : SensorType) ->  DTUSensor {
        return self.sensors[sensorType.rawValue]!
    }
    
    
    func isSensorSensing(sensorType : SensorType) -> Bool {
        return getSensor(sensorType: sensorType).sensing
    }
    
    
    //MARK: Continious Sensing
    
    func startContinuousSensingWithSensor(sensorType : SensorType) {
        print("Start sensing with sensor- \(sensorType.rawValue)")
        if isSensorSensing(sensorType: sensorType) == true {
            print("Sensor is already sensing data. \(sensorType.rawValue)")
            abort()
        }
        
        getSensor(sensorType: sensorType).startSensing()
    }
    
}
