import SwiftUI

struct BotaoSheetView: View {
    @State var shouldPresentSheet = false
    var body: some View {
        VStack {
               Button("Emoções") {
                   shouldPresentSheet.toggle()
               }
                   /// Present a sheet once `shouldPresentSheet` becomes `true`.
                   .sheet(isPresented: $shouldPresentSheet) {
                       print("Sheet dismissed!")
                   } content: {
                       FeelingSheet()
                   }

           }
               .padding()
               .frame(width: 400, height: 300)
       }
    }

struct BotaoSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BotaoSheetView()
    }
}
