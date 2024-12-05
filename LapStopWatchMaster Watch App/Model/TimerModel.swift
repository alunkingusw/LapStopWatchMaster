//
//  TimerModel.swift
//  LapStopWatchMaster Watch App
//
//  Created by Alun King on 29/11/2024.
//

import Foundation

class TimerModel: ObservableObject{
    
    @Published var timeElapsed: TimeInterval = 0
    @Published var laps: [TimeInterval] = []
    //save on processing time by keeping track of total
    @Published var totalLaps:TimeInterval = 0
    @Published var isRunning:Bool = false
    
    var timer:Timer?
    
    
    func start(){
        if !isRunning{
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) {_ in
                self.timeElapsed += 0.01
            }
            isRunning = true
        }else{
            recordLap()
            totalLaps += laps.last ?? 0
        }
    }
    
    func stop(){
        if isRunning{
            if let unwrappedTimer = timer{
                unwrappedTimer.invalidate()
            }
        }
        isRunning = false;
    }
    
    func recordLap(){
        laps.append(timeElapsed-totalLaps)
    }
    
    
    
}
