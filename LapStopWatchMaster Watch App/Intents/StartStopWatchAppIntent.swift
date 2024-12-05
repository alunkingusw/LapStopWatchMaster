//
//  StartStopwatch.swift
//  LapStopWatchMaster
//
//  Created by Alun King on 03/12/2024.
//
import AppIntents
import Foundation

struct StartStopWatchAppIntent: AppIntent {
    
    static let title: LocalizedStringResource = "Start Stopwatch"
    static let description = IntentDescription("Starts the stopwatch and subsequently triggers a lap.")
    
    static let openAppWhenRun: Bool = true
    
    @MainActor
    func perform() async throws -> some IntentResult {
            // Implement your app logic here
            return .result(value: "Started stopwatch.")
    }
    
    //@Dependency
    //private var timerModel: TimerModel
}
