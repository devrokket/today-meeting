import SwiftUI

struct DetailEditView: View {
    @Binding var data: DailyScrum.Data // @state -> @Binding으로 convert
    @State private var newAttendeeName = "" // hold the attendee name that the user enters.
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $data.title)
            HStack {
                Slider(value: $data.lengthInMinutes, in: 5...30, step: 1) { Text("Length") }
                }
                .accessibilityValue("\(Int(data.lengthInMinutes)) minutes") //Set accessibility value for Slider.
                Spacer()
                Text("\(Int(data.lengthInMinutes)) minutes")
                .accessibilityHidden(true)
            }
            ThemePicker(selection: $data.theme)
        }
            
            Section(header: Text("Attendees")) {
                ForEach(data.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                                    data.attendees.remove(atOffsets: indices)
                                }
                HStack {
                    TextField("New Attendee", text: $newAttendeeName) // pass a binding to the newAttendeeName property.
                    Button(action: {
                        withAnimation { //Add an animation block that creates a new attendee and appends the new attendee to the attendees array
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            data.attendees.append(attendee)
                            newAttendeeName = "" //initialize newAttendeeName empty.
                        }
                        
                    }) {
                            Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                        }
                    .disabled(newAttendeeName.isEmpty)
                    
                }
                
            }
        }
}


struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(DailyScrum.sampleData[0].data))    }
}
