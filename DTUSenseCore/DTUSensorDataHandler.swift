//
//  DTUSensorDataHandler.swift
//  DTUSenseCore
//
//  Created by Trevon Fernando on 9/19/16.
//  Copyright © 2016 DTU. All rights reserved.
//

import UIKit

public class DTUSensorDataHandler: NSObject {
    
    public typealias CompletionBlock = (_ sensorType: SensorType?, _ sensorData: DTUSensorData?) -> Void

    public var handler : CompletionBlock? = nil
}
