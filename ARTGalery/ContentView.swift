//
//  ContentView.swift
//  ARTGalery
//
//  Created by gio khukhia on 12/23/23.
//
import SwiftUI

struct ContentView: View {
    @State private var lobiani1Offset: CGSize = .zero
    @State private var lobiani2Offset: CGSize = .zero
    @State private var lobiani3Angle: Angle = .degrees(0)
    @State private var lobiani4Scale: CGFloat = 1.0

    var body: some View {
        VStack {
            Image("lobiani")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    print("lobiani tapped")
                }

            Image("lobiani1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onLongPressGesture {
                    print("lobiani1 long pressed")
                }

            Image("lobiani2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(lobiani2Offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            lobiani2Offset = value.translation
                            print("lobiani2 dragged")
                        }
                        .onEnded { _ in
                            lobiani2Offset = .zero
                        }
                )

            Image("lobiani3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(lobiani3Angle)
                .gesture(
                    RotationGesture()
                        .onChanged { value in
                            lobiani3Angle += value
                            print("lobiani3 rotated")
                        }
                )

            Image("lobiani4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(lobiani4Scale)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            lobiani4Scale = value
                            print("lobiani4 magnified")
                        }
                )
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
