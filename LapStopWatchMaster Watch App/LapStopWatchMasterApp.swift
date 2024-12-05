//
//  LapStopWatchMasterApp.swift
//  LapStopWatchMaster Watch App
//
//  Created by Alun King on 29/11/2024.
//

import SwiftUI
import AppIntents

@main
struct LapStopWatchMaster_Watch_AppApp: App {
    @ObservedObject var timerModel:TimerModel
    
    init(){
        let timerModelVar = TimerModel()
        timerModel = timerModelVar
        AppDependencyManager.shared.add(dependency: timerModelVar)
    }
    var body: some Scene {
        WindowGroup {
            StopWatchView(timerModel:timerModel, timer:Timer())
        }
    }
}
    
