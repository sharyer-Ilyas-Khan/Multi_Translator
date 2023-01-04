//
//  appWidgets.swift
//  appWidgets
//
//  Created by Funsol on 04/01/2023.
//

import WidgetKit
import SwiftUI

private let widgetGroupId = "group.appwudgets"

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> ExampleEntry {
        ExampleEntry(date: Date(), title: "Placeholder Title", message: "Placeholder Message")
    }
    
    func getSnapshot(in context: Context, completion: @escaping (ExampleEntry) -> ()) {
        let data = UserDefaults.init(suiteName:widgetGroupId)
        let entry = ExampleEntry(date: Date(), title: data?.string(forKey: "title") ?? "No Title Set", message: data?.string(forKey: "message") ?? "No Message Set")
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        getSnapshot(in: context) { (entry) in
            let timeline = Timeline(entries: [entry], policy: .atEnd)
            completion(timeline)
        }
    }
}

struct ExampleEntry: TimelineEntry {
    let date: Date
    let title: String
    let message: String
}

struct appWidgetsEntryView : View {
    var entry: Provider.Entry
    let data = UserDefaults.init(suiteName:widgetGroupId)
    
    var body: some View {
        VStack.init(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Text(entry.title).bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text(entry.message)
                .font(.body)
                .widgetURL(URL(string: "appWidgets://message?message=\(entry.message)&homeWidget"))
        }
        )
    }
}

struct appWidgets: Widget {
    let kind: String = "AppWidgets"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            appWidgetsEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct appWidgets_Previews: PreviewProvider {
    static var previews: some View {
        appWidgetsEntryView(entry: ExampleEntry(date: Date(), title: "Example Title", message: "Example Message"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}




//import WidgetKit
//import SwiftUI
//import Intents
//
//struct Provider: IntentTimelineProvider {
//    func placeholder(in context: Context) -> SimpleEntry {
//        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
//    }
//
//    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
//        let entry = SimpleEntry(date: Date(), configuration: configuration)
//        completion(entry)
//    }
//
//    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
//        var entries: [SimpleEntry] = []
//
//        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
//        let currentDate = Date()
//        for hourOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//            let entry = SimpleEntry(date: entryDate, configuration: configuration)
//            entries.append(entry)
//        }
//
//        let timeline = Timeline(entries: entries, policy: .atEnd)
//        completion(timeline)
//    }
//}
//
//struct SimpleEntry: TimelineEntry {
//    let date: Date
//    let configuration: ConfigurationIntent
//}
//
//struct appWidgetsEntryView : View {
//    var entry: Provider.Entry
//
//    var body: some View {
//        Text(entry.date, style: .time)
//    }
//}
//
//struct appWidgets: Widget {
//    let kind: String = "appWidgets"
//
//    var body: some WidgetConfiguration {
//        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
//            appWidgetsEntryView(entry: entry)
//        }
//        .configurationDisplayName("My Widget")
//        .description("This is an example widget.")
//    }
//}
//
//struct appWidgets_Previews: PreviewProvider {
//    static var previews: some View {
//        appWidgetsEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
//            .previewContext(WidgetPreviewContext(family: .systemSmall))
//    }
//}
