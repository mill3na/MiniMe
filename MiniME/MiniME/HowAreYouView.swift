//
//  HowAreYouView.swift
//  PocCircleProgressView
//
//  Created by Milena Maia Araújo on 12/06/23.
//

import SwiftUI

struct HowAreYouView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle")
                        .frame(width: 20, height: 20)
                        .padding(20)
                }
            }
    }
        
}

struct HowAreYouView_Previews: PreviewProvider {
    static var previews: some View {
        HowAreYouView()
    }
}
