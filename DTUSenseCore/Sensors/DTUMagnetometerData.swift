//
//  DTUMagnetometerData.swift
//  DTUSenseCore
//
//  Created by Trevon Fernando on 10/4/16.
//  Copyright © 2016 DTU. All rights reserved.
//

import UIKit
import CoreMotion


public class DTUMagnetometerData: DTUSensorData {
    
    public var magneticField : CMMagneticField? = nil
    
    public func initWithMagnetometerData(magentometerData : CMMagnetometerData) -> DTUMagnetometerData {
        self.magneticField = magentometerData.magneticField
        return self
    }

}
