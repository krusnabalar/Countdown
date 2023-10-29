//
//  ContentView.swift
//  Countdown
//
//  Created by Krusna Balar on 2023-10-25.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var eventStore = EventDataStore()
    @State var newEventName : String = ""
    @State var newEventDate : String = ""

    var addEventBar : some View {
        HStack {
            TextField("Event Name: ", text: self.$newEventName)
            TextField("Event Date: ", text: self.$newEventDate)
            Button(action: self.addEvent, label: {
                Text("Add Event")
            })
        }
    }
    
    func addEvent() {
        if (!newEventName.isEmpty && !newEventDate.isEmpty) {
            eventStore.events.append(Event(
                id: String(eventStore.events.count + 1),
                eventName: newEventName,
                date: newEventDate
            ))
        }
        self.newEventName = ""
        self.newEventDate = ""
    }
    
    var body: some View {
        NavigationView {
            VStack {
                addEventBar.padding()
                List {
                    ForEach(self.eventStore.events) { event in
                        HStack{
                            Text(event.eventName)
                            Spacer()
                            Text("|")
                            Spacer()
                            Text(event.date)
                        }
                    }.onDelete(perform: self.deleteEvent)
                }.navigationBarTitle("Events").navigationBarItems(trailing: EditButton())
            }
        }
    }
    
    func deleteEvent(at offsets: IndexSet) {
        eventStore.events.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
