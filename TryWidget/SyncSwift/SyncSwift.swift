//
//  SyncSwift.swift
//  SyncSwift
//
//  Created by 겸 on 2022/11/12.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    
    // it's not always
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for dayOffset in 0 ..< 7 {
            let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
            // Start of Date (entry)
            let startOfDate = Calendar.current.startOfDay(for: entryDate)
            let entry = SimpleEntry(date: startOfDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

// need to learn SwiftUI
struct SyncSwiftEntryView : View {
    var entry: Provider.Entry
    
    var colorScheme = ColorScheme(.light)

    var body: some View {
        ZStack{
            Color.yellow.ignoresSafeArea()
            VStack{
                Text( colorScheme == .dark ? "저녁입니다" : "아침입니다")
                    .font(.title)
                Image(systemName: colorScheme == .dark ? "moon" : "sun.max")
            }
        }
    }
}

@main
struct SyncSwift: Widget {
    let kind: String = "SyncSwift"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            SyncSwiftEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct SyncSwift_Previews: PreviewProvider {
    static var previews: some View {
        SyncSwiftEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
