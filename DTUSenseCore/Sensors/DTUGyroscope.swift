//
//  DTUGyroscope.swift
//  DTUSenseCore
//
//  Created by Trevon Fernando on 9/20/16.
//  Copyright © 2016 DTU. All rights reserved.
//

import UIKit

public class DTUGyroscope: DTUSensor {

    
    var sharedMotionManager = DTUMotionManager.sharedMotionManager

    func initWithConfiguration(with config:DTUGyroscopeConfiguration?) -> DTUGyroscope {
        self.sensorType = SensorType.Gyroscope
        sharedMotionManager = DTUMotionManager.sharedMotionManager
        self.setConfiguration(with: config)
        return self
    }
    
    
    //MARK: - Availablity
    
    func isSensorAvailable() -> Bool {
        return DTUMotionManager.sharedMotionManager.isGyroAvailable
    }
    
    
    //MARK: - Configuration
    
    func setConfiguration(with config:DTUSensorConfiguration?) {
        if config != nil {
            if config?.superclass != DTUGyroscopeConfiguration.superclass() {
                print("Wrong DTUSensorConfig class provided \(config?.superclass) for sensor Gyroscope.")
                abort()
            }
            super.sensorConfiguration = config
            let gyroscopeConfiguration = config as! DTUGyroscopeConfiguration
            self.sharedMotionManager.gyroUpdateInterval = gyroscopeConfiguration.sampleRate
            
            //TODO Convert Hz into interval
        }
    }
    
    //MARK: - Data Capturing
    
    override func startSensing() {
        super.startSensing()
        if sharedMotionManager.isGyroAvailable {
            sharedMotionManager.startGyroUpdates(to: OperationQueue.current!, withHandler: { (data, error) in
                if (error != nil) {
                    print("startGyroUpdates error: \(error?.localizedDescription)")
                }else{
                    let data : DTUGyroscopeData = DTUGyroscopeData().initWithGyrosopeData(gyroscopeData: data!)
                    self.submitSensorData(data: data)
                }
            })
        }
}

    override func stopSensing() {
        sharedMotionManager.stopGyroUpdates()
        super.stopSensing()
    }
}
