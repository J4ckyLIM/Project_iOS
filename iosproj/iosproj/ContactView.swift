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
                .foregroundColor(Color.white)
            Text("poke@gmail.com")
                .foregroundColor(Color.white)
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
