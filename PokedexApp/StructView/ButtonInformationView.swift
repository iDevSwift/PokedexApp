//
//  ExtractedView.swift
//  PokedexApp
//
//  Created by Diego Maseda on 27/1/25.
//
import SwiftUI
struct ButtonInformationView: View {
    @State private var showInspector = false
    var body: some View {
            Button {
                showInspector.toggle()
            } label: {
                Image(systemName: "bubble.left.and.exclamationmark.bubble.right.fill")
            }
            .foregroundColor(.black)
            .inspector(isPresented: $showInspector) {
                Text("¡Bienvenido de nuevo!")
                    .font(.largeTitle)
                    .padding()
                Text("Esta es una ventana de ayuda.")
            }
    }
}

#Preview {
    ButtonInformationView()
}
