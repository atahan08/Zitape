import SwiftUI

struct StartView: View {
    @State private var isCategoryViewActive = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Siyah arka plan
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                // Arka plan resmi
                Image("backgroundImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()

                // Başla Butonu
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isCategoryViewActive = true
                    }
                }) {
                    Text("GEÇ̌ǨU")
                        .font(.system(size: geometry.size.width * 0.1, weight: .bold))
                        .foregroundColor(.white)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.black.opacity(0.1))
                                .shadow(radius: 10)
                        )
                }
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.86)
            }
            .edgesIgnoringSafeArea(.all)
            .fullScreenCover(isPresented: $isCategoryViewActive) {
                CategoryView()
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
