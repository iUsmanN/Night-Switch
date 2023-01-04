//
//  toggle_widget.swift
//  toggle-widget
//
//  Created by Usman Nazir on 04/01/2023.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        let date = Date()
        let entry = SimpleEntry(date: date, configuration: configuration)
        let nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 1, to: date)!
        let timeline = Timeline(
            entries:[entry],
            policy: .after(nextUpdateDate)
        )
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct toggle_widgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        toggle_clock_view(date: entry.date)
    }
}

struct toggle_widget: Widget {
    let kind: String = "toggle_widget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            toggle_widgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct toggle_widget_Previews: PreviewProvider {
    static var previews: some View {
        toggle_widgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
