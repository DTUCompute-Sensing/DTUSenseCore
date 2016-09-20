//
//  DTUBattery.swift
//  DTUSenseCore
//
//  Created by Trevon Fernando on 9/16/16.
//  Copyright © 2016 DTU. All rights reserved.
//

import Foundation


public class DTUBattery : DTUSensor {
    
    public func initwithConfiguration () -> DTUBattery {
    
        return self
    }
    
    
    func isSensorAvailable() -> Bool {
        //No battery no life !
        return true
    }
    
    
}
