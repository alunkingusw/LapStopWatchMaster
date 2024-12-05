//
//  StopWatchLapView.swift
//  LapStopWatchMaster Watch App
//
//  Created by Alun King on 03/12/2024.
//

import SwiftUI

struct StopWatchLapView: View {
    @ObservedObject var timerModel:TimerModel
    var body: some View {
        ScrollView{
            Text(format(time:timerModel.timeElapsed)).monospaced()
            ForEach(timerModel.laps.indices, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Text("Lap \(index + 1): \(format(time: timerModel.laps[index]))")
                                    .font(.body)
                                    .padding(.vertical, 5).monospaced()
                            }
                    }

        }
    }
}

#Preview {
    StopWatchLapView(timerModel:TimerModel())
}
