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
        case .Gyroscope:
            return DTUGyroscope().isSensorAvailable()
        default:
            print("Unknow Sensor. Sensor Type = \(sensor) ")
            return false
        }
    }
    
    
    //MARK: - Sensor Registration
    
    func registerSensor(sensor : SensorType, withConfig config:DTUSensorConfiguration?)  {
        print("Register Sensor : \(sensor)" )
        sensors[sensor.rawValue] = creatSensor(sensor: sensor, with: config)
    }
    
    
    //MARK: Sensor Creation
    
    func creatSensor(sensor type : SensorType, with config: DTUSensorConfiguration?) -> DTUSensor {
        switch type {
        case .Accelerometer:
            return DTUAccelerometer().initWithConfiguration(with: config as? DTUAccelerometerConfiguration)
        case .Gyroscope:
            return DTUGyroscope().initWithConfiguration(with: config as? DTUGyroscopeConfiguration)
        case .Battery:
            return DTUBattery().initwithConfiguration()
        default:
            print("Unknown Sensor Type : \(type.rawValue)")

        }
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
    
    
    //MARK: Sensor Configuration
    
    public func setConfiguration(set config : DTUSensorConfiguration , to sensor : SensorType)  {
        //TODO : If configuration was not provided, get the Default
        getSensor(sensorType: sensor).sensorConfiguration = config
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
    
    
    func stopContinuousSensingWithSensor(sensor : SensorType) {
        print("Stop sensing with -: \(sensor.rawValue)")
        
        if isSensorSensing(sensorType: sensor) == false {
            print("Sensor is already NOT sensing data. \(sensor.rawValue)")
            abort()
        }
        
        getSensor(sensorType: sensor).stopSensing()

    }
    
}
