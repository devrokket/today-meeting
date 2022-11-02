// Drawing - Drawing the Timer view

import SwiftUI

struct MeetingTimerView: View {
    let speakers : [ScrumTimer.Speaker]
    let theme : Theme
    
    private var currentSpeaker: String {
        speakers.first(where: { !$0.isCompleted })?.name ?? "Someone"
    }

    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack{
                    Text(currentSpeaker)
                        .font(.title)
                    Text("(이)가 발표중..")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    static var speakers: [ScrumTimer.Speaker] {
        [ScrumTimer.Speaker(name: "민병록", isCompleted: true), ScrumTimer.Speaker(name: "손현수", isCompleted: false)]
    }
    
    static var previews: some View{
        MeetingTimerView(speakers: speakers, theme: .yellow)
    }
}
