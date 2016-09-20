//
//  DTUAccelerometerData.swift
//  DTUSenseCore
//
//  Created by Trevon Fernando on 9/16/16.
//  Copyright © 2016 DTU. All rights reserved.
//

import UIKit
import CoreMotion

public class DTUAccelerometerData: DTUSensorData {

    public var acceleration : CMAcceleration? = nil
    
    public func initWithAccelerometerData(accelerometerData : CMAccelerometerData) -> DTUAccelerometerData {
            self.acceleration = accelerometerData.acceleration
            return self
        }
}
