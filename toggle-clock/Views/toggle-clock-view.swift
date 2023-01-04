//
//  toggle-clock-view.swift
//  toggle-clock
//
//  Created by Usman Nazir on 04/01/2023.
//

import SwiftUI

struct toggle_clock_view: View {
    
    @State var date: Date
    
    var body: some View {
        ZStack {
            Color.black
            GeometryReader { gp in
                ZStack {
                    Text("\(dateInRange(current:date))")
                    RoundedRectangle(cornerRadius: gp.size.height)
                        .stroke(.gray, lineWidth: 1)
                        .padding(3)
                    HStack {
                        moon_view()
                            .frame(width: gp.size.height, height: gp.size.height)
                            .opacity(min(1.0, 0.4 + dateInRange(current: date)*2))
                            .offset(CGSize(width: 0 + ((gp.size.width - gp.size.height)*dateInRange(current: date)), height: 0))
                        Spacer()
                    }
                }
            }
        }
    }
    
    func dateInRange(current: Date) -> Double {
        let calendar = Calendar(identifier: .gregorian)
        let hour = calendar.component(.hour, from: current)
        let minute = calendar.component(.minute, from: current)
        
        let nightStartMinutes: Double = 420 //6pm
        let nightEndMinutes: Double = 450 //7pm
        
        let currentNightMinutes: Double = Double(((hour*60)+minute))
        let floatPercentage = (currentNightMinutes-nightStartMinutes)/(nightEndMinutes-nightStartMinutes)
        
        return floatPercentage
    }
}

struct toggle_clock_view_Previews: PreviewProvider {
    static var previews: some View {
        toggle_clock_view(date: Date())
    }
}
