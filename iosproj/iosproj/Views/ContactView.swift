//
//  ContactView.swift
//  iosproj
//
//  Created by Riyad Achour  on 17/12/2020.
//

import SwiftUI

struct ContactView: View {
    var body: some View {
        VStack {
            Text("Contactez nous")
                .font(.title)
            Text("poke@gmail.com")
        }.background(
            Image("Contactscreen-1")
        )
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()

    }
}
