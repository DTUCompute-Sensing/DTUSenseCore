//
//  DTUMotionManager.swift
//  DTUSenseCore
//
//  Created by Trevon Fernando on 9/16/16.
//  Copyright © 2016 DTU. All rights reserved.
//

import Foundation
import CoreMotion

public class DTUMotionManager : CMMotionManager {
    
    public static let sharedMotionManager : CMMotionManager  = DTUMotionManager()
    private override init() {}
    
    
}
