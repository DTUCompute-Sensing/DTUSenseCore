//
//  DTUAccelerometer.swift
//  DTUSenseCore
//
//  Created by Trevon Fernando on 9/16/16.
//  Copyright © 2016 DTU. All rights reserved.
//

import Foundation
import CoreMotion

public class DTUAccelerometer : DTUSensor {
    
    var sharedMotionManager = DTUMotionManager.sharedMotionManager
    
    //MARK: - Initilization and Configuration
    
    func initWithConfiguration (with config: DTUAccelerometerConfiguration?) -> DTUAccelerometer{
        self.sensorType = SensorType.Accelerometer
        sharedMotionManager = DTUMotionManager.sharedMotionManager
        self.setConfiguration(with: config)
        return self
    }
    
    //MARK: - Availablity
    
    func isSensorAvailable() -> Bool {
        return DTUMotionManager.sharedMotionManager.isAccelerometerAvailable
    }
    
    //MARK: - Configuration
    
    func setConfiguration(with config:DTUSensorConfiguration?) {
        if config != nil {
            if config?.superclass != DTUAccelerometerConfiguration.superclass() {
                print("Wrong DTUSensorConfig class provided \(config?.superclass) for sensor Accelerometer.")
                abort()
            }
            super.sensorConfiguration = config
            let accelerometerConfiguration = config as! DTUAccelerometerConfiguration
            self.sharedMotionManager.accelerometerUpdateInterval = accelerometerConfiguration.sampleRate  // Convert Hz into interval
        }
    }
    
    //MARK: - Data Capturing
    
    override func startSensing() {
        super.startSensing()
        if sharedMotionManager.isAccelerometerAvailable {
            sharedMotionManager.startAccelerometerUpdates(to: (OperationQueue.current!), withHandler: { (data : CMAccelerometerData?, error : Error?) in
                if (error != nil) {
                    print("startAccelerometerUpdates error: \(error?.localizedDescription)")
                }else{
                    let data : DTUAccelerometerData = DTUAccelerometerData().initWithAccelerometerData(accelerometerData: data!)
                    self.submitSensorData(data: data)
                }
            })
        }else{
            print("ccelerometer Sensor is not available")
        }
    }
    
    override func stopSensing() {
        sharedMotionManager.stopAccelerometerUpdates()
        super.stopSensing()
    }
    
}
