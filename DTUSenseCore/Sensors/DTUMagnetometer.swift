//
//  DTUMagnetometer.swift
//  DTUSenseCore
//
//  Created by Trevon Fernando on 10/4/16.
//  Copyright © 2016 DTU. All rights reserved.
//

import UIKit
import CoreMotion


public class DTUMagnetometer: DTUSensor {
    
    var sharedMotionManager = DTUMotionManager.sharedMotionManager

    //MARK: - Initilization and Configuration
    
    func initWithConfiguration (with config: DTUMagnetometerConfiguration?) -> DTUMagnetometer{
        self.sensorType = SensorType.Magnetometer
        sharedMotionManager = DTUMotionManager.sharedMotionManager
        self.setConfiguration(with: config)
        return self
    }

    //MARK: - Availablity
    
    func isSensorAvailable() -> Bool {
        return DTUMotionManager.sharedMotionManager.isMagnetometerAvailable
    }
    
    
    //MARK: - Configuration
    
    func setConfiguration(with config:DTUSensorConfiguration?) {
        if config != nil {
            if config?.superclass != DTUMagnetometerConfiguration.superclass() {
                print("Wrong DTUSensorConfig class provided \(config?.superclass) for sensor Magnetometer.")
                abort()
            }
            super.sensorConfiguration = config
            let magnetometerConfiguration = config as! DTUMagnetometerConfiguration
            self.sharedMotionManager.magnetometerUpdateInterval = magnetometerConfiguration.sampleRate  // Convert Hz into interval
        }
    }
    
    //MARK: - Data Capturing
    override func startSensing() {
        super.startSensing()
        if sharedMotionManager.isMagnetometerAvailable {
            sharedMotionManager.startMagnetometerUpdates(to: (OperationQueue.current!), withHandler: { (magnData, error) in
                    if (error != nil) {
                        print("startMagnetometerUpdates error: \(error?.localizedDescription)")
                    }else{
                        let data : DTUMagnetometerData = DTUMagnetometerData().initWithMagnetometerData(magentometerData: magnData!)
                        data.timeStamp = Date(timeIntervalSinceNow: magnData!.timestamp) as NSDate!
                        self.submitSensorData(data: data)
                    }
                })
        }else{
            print("Magnetometer Sensor is not available")
        }
    }
    
    override func stopSensing() {
        sharedMotionManager.stopMagnetometerUpdates()
        super.stopSensing()
    }
    
    
}
