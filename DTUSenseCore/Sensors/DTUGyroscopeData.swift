//
//  DTUGyroscopeData.swift
//  DTUSenseCore
//
//  Created by Trevon Fernando on 9/20/16.
//  Copyright © 2016 DTU. All rights reserved.
//

import UIKit
import CoreMotion

public class DTUGyroscopeData: DTUSensorData {

    public var rotationRate : CMRotationRate? = nil
    
    public func initWithGyrosopeData(gyroscopeData : CMGyroData) -> DTUGyroscopeData {
        self.rotationRate = gyroscopeData.rotationRate
        return self
    }
}
