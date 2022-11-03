import SwiftUI

struct HistoryView: View {
    let history: History

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding()
                Text("참석자")
                    .font(.headline)
                Text(history.attendeeString)
                if let transcript = history.transcript {
                    Text("기록")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

extension History {
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map { $0.name })
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var history: History {
        History(attendees: [DailyScrum.Attendee(name: "김효수"), DailyScrum.Attendee(name: "손봉수"), DailyScrum.Attendee(name: "김형태")], lengthInMinutes: 10, transcript: "오늘 회의 주제: 어떻게 열심히 살 수 있을까?에 관하여...")
    }
    
    static var previews: some View {
        HistoryView(history: history)
    }
}


