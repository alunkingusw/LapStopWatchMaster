import SwiftUI
import Combine

struct StopWatchView: View {
    @ObservedObject var timerModel:TimerModel
    @State private var cancellables = Set<AnyCancellable>()
    @State var selectedPage:Int = 0
    @Namespace private var timeElapsedText
    @Namespace private var timeTabAnimation
    var timer:Timer
    var body: some View {
        TabView(selection:$selectedPage){
            
            VStack {
                Text(format(time:timerModel.timeElapsed)).monospaced().font(Font.title2).matchedGeometryEffect(id: timeElapsedText, in: timeTabAnimation, isSource: selectedPage==0)
                Text("Lap \(timerModel.laps.count): \( format(time:timerModel.timeElapsed-timerModel.totalLaps))").monospaced()
                HStack {
                    Button(!timerModel.isRunning ? "Start" : "Lap") {
                        timerModel.start()
                    }
                    
                    Button("Stop") {
                        timerModel.stop()
                    }
                    .disabled(!timerModel.isRunning)
                }
            }
            .padding()
            VStack{
                StopWatchLapView(timerModel:timerModel)
            }
        }.toolbar{
            ToolbarItem(placement: .topBarLeading){
                Button("Hi"){}
            }
        }.tabViewStyle(.verticalPage)
    }
}
func format(time:Double) ->String{
    
    let hours:Int = Int(time/3600)
    let minutes:Int = Int(time.truncatingRemainder(dividingBy:3600)/60)
    let seconds:Int = Int(time.truncatingRemainder(dividingBy:60))
    
    if(hours == 0){
        let milliseconds:Int = Int((time.truncatingRemainder(dividingBy:1)*100))
        return String(format:"%02d:%02d:%02d", minutes, seconds,milliseconds);
    }else{
        return String(format:"%02d:%02d:%02d", hours, minutes, seconds);
    }
}
#Preview {
    StopWatchView(timerModel: TimerModel(), timer: Timer())
}
