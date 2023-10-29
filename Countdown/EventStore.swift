//
//  EventStore.swift
//  Countdown
//
//  Created by Krusna Balar on 2023-10-29.
//

import Foundation
import SwiftUI

struct Event : Identifiable {
    var id = String()
    var eventName = String()
    var date = String()
}

class EventDataStore: ObservableObject {
    @Published var events = [Event]()
}
