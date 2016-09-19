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
    func initWithConfiguration () -> DTUAccelerometer{
        self.sensorType = SensorType.Accelerometer
        sharedMotionManager = DTUMotionManager.sharedMotionManager
        sharedMotionManager.accelerometerUpdateInterval = 0.01
        
        return self
    }
    
    
    //MARK: - Availablity
    func isSensorAvailable() -> Bool {
        return DTUMotionManager.sharedMotionManager.isAccelerometerAvailable
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
    
}
