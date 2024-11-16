import SwiftUI

struct CategoryView: View {
    @State private var selectedCategory: String?
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Arka plan resmi
                Image("backgroundWallpaper")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all) // Ekranın tamamını kaplayacak şekilde ayarlar
                
                VStack {
                    Text("Kategori Seçin")
                        .font(.largeTitle)
                        .foregroundColor(.white) // Metin rengini beyaz yapıyoruz
                        .padding()
                    
                    List {
                        Button("Mteli") { selectedCategory = "Mteli" }
                        Button("Pukurepe") { selectedCategory = "Pukurepe" }
                        Button("Coxo") { selectedCategory = "Coxo" }
                        Button("Meyvepe") { selectedCategory = "Meyvepe" }
                        Button("Kvincepe") { selectedCategory = "Kvincepe" }
                        Button("Skindinape") { selectedCategory = "Skindinape" }
                        Button("Lazi Oputepe") { selectedCategory = "Lazi Oputepe" }
                        Button("Lilvepe") { selectedCategory = "Lilvepe" }
                        Button("Bobalape") { selectedCategory = "Bobalape" }
                        Button("Çxomepe") { selectedCategory = "Çxomepe" }
                        Button("Xurape") { selectedCategory = "Xurape" }
                        Button("Oçkomalepe") { selectedCategory = "Oçkomalepe" }
                        Button("Tutape") { selectedCategory = "Tutape" }
                    }
                    .scrollContentBackground(.hidden) // Listenin arka planını gizler
                    .background(Color.white.opacity(0.8)) // Liste arka planını hafif şeffaf yapar
                    .cornerRadius(10)
                    .padding(.horizontal, 20) // Kenarlardan biraz boşluk bırakır
                    .navigationDestination(isPresented: .constant(selectedCategory != nil)) {
                        if let category = selectedCategory {
                            GameView(category: category)
                                .onDisappear {
                                    selectedCategory = nil // Geri dönüldüğünde kategoriyi sıfırlıyoruz
                                }
                        }
                    }
                }
            }
        }
    }
}
