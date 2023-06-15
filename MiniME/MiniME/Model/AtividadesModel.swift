//
//  ActivityModel.swift
//  Collection MP
//
//  Created by Ana Caroline Sampaio Nogueira on 13/06/23.
//

import Foundation
import SwiftUI

struct ActivityModel: Hashable {
    var titulo: String = ""
    var imagem: String = ""
    var hora: String = ""
    var inicio:String = ""

    init(titulo: String, imagem: String, hora: String, inicio: String) {
        self.titulo = titulo
        self.imagem = imagem
        self.hora = hora
        self.inicio = inicio
    }
}
