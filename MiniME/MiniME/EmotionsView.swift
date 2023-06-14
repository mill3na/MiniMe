//
//  FeelingSheet.swift
//  SheetEmocoes
//
//  Created by Ana Caroline Sampaio Nogueira on 13/06/23.
//

import Foundation
import SwiftUI

struct FeelingSheet: View {
    @State var shouldPresentSheet = false
    var body: some View {
        VStack {
            Image("feeling")
                .scaledToFit()
                .frame(width: 300, height: 300)
                .padding(.bottom, 100)
                .padding(.top, 100)
            HStack {
                Button {
                    //                activity()
                } label: {
                    Image(systemName: "face.smiling")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .background {
                            Rectangle()
                                .frame(width: 80, height: 60)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3) // << shadow to all composition
                        }
                }
                .padding(.leading, 60)
                Spacer()

                Button {
                    //                activity()
                } label: {
                    Image(systemName: "face.smiling")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .background {
                            Rectangle()
                                .frame(width: 80, height: 60)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3) // << shadow to all composition
                        }
                }
                Spacer()

                Button {
                    //                activity()
                } label: {
                    Image(systemName: "face.smiling")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .background {
                            Rectangle()
                                .frame(width: 80, height: 60)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3) // << shadow to all composition
                        }
                }
                Spacer()

                Button {
                    //                activity()
                } label: {
                    Image(systemName: "face.smiling")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .background {
                            Rectangle()
                                .frame(width: 80, height: 60)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3) // << shadow to all composition
                        }
                }
                .padding(.trailing, 60)
            }

            Button {
                //                activity()
            } label: {
                Text("Continuar")

                    .foregroundColor(.black)
                    .background {
                        Rectangle()
                            .frame(width: 150, height: 60)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3) // << shadow to all composition
                    }

            }
            .padding(.top, 100)

        }
    }

}

struct FeelingSheet_Previews: PreviewProvider {
    static var previews: some View {
        FeelingSheet()
    }
}
