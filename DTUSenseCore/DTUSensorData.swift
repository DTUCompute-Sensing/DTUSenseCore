//
//  DTUSensorData.swift
//  DTUSenseCore
//
//  Created by Trevon Fernando on 9/16/16.
//  Copyright © 2016 DTU. All rights reserved.
//

import UIKit

public class DTUSensorData: NSObject {

    
    var sensorType : SensorType! = nil
    
    
    func initWithSensorType(sensorType : SensorType) -> DTUSensorData {
        self.sensorType = sensorType
        
        return self
    }
}
