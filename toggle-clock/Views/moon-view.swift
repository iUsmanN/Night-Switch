//
//  moon-view.swift
//  toggle-clock
//
//  Created by Usman Nazir on 04/01/2023.
//

import SwiftUI

struct moon_view: View {
    
    var body: some View {
        Image("moon")
            .resizable()
            .padding(7)
    }
}

struct moon_view_Previews: PreviewProvider {
    static var previews: some View {
        moon_view()
    }
}
