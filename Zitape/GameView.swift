import SwiftUI

struct GameView: View {
    let settings: GameSettings
    @State private var letterGrid: [[Character]]
    @State private var words: [String]
    @State private var placedWords: [String] = []
    let lazcaHarfler = "ABCÇÇ̌DEFGĞHXİJKǨQLMNOPP̌RSŞTŤUVYZŽƷǮ"
    
    @State private var selectedCells: [(Int, Int)] = []
    @State private var foundWords: [[(Int, Int)]] = []
    @State private var score: Int = 0
    @State private var lastFoundWord: String = ""
    @State private var isGameOver: Bool = false
    @State private var remainingWords: [String: Bool] = [:]
    @State private var timeRemaining: Int
    @State private var timer: Timer? = nil
    @StateObject private var audioPlayer = AudioPlayerManager()
    
    // Yeni eklenen ipucu harfleri için state
    @State private var clueCells: [(Int, Int)] = []
    @State private var showClue: Bool = false

    init(category: String) {
            let settings = GameSettings(
                gridSize: 10,
                timeLimit: 300,
                category: category,
                words: GameSettings.getWords(for: category),
                alternativeWords: GameSettings.getAlternativeWords(for: category)
            )
            self.settings = settings
            _words = State(initialValue: settings.words)
            _letterGrid = State(initialValue: Array(repeating: Array(repeating: "-", count: settings.gridSize), count: settings.gridSize))
            _timeRemaining = State(initialValue: settings.timeLimit)
        }

    var body: some View {
        ZStack {
            // Arka plan resmini ekliyoruz
            Image("backgroundWallpaper")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                // Başlık ve Zamanlayıcı
                VStack(spacing: 10) {
                    Text("Puani: \(score)")
                        .font(.title)
                        .padding(.top, 10)

                    Text("Ora: \(timeRemaining) saniye")
                        .font(.headline)
                        .foregroundColor(timeRemaining > 10 ? .black : .red)

                    if !lastFoundWord.isEmpty {
                        Text("Çodina isa zita: \(lastFoundWord)")
                            .font(.subheadline)
                            .foregroundColor(.green)
                    }

                    VStack(spacing: 2) {
                        // Oyun Tablosu
                        ForEach(0..<settings.gridSize, id: \.self) { row in
                            HStack(spacing: 2) {
                                ForEach(0..<settings.gridSize, id: \.self) { col in
                                    let isSelected = selectedCells.contains(where: { $0 == (row, col) })
                                    let isFound = foundWords.contains(where: { $0.contains(where: { $0 == (row, col) }) })
                                    let isClue = clueCells.contains(where: { $0 == (row, col) })
                                    
                                    Text(String(letterGrid[row][col]))
                                        .font(.system(size: 18, weight: .bold))
                                        .frame(width: 30, height: 30)
                                        .background(isFound ? Color.green : (isSelected ? Color.yellow : (isClue && showClue ? Color.yellow : Color.gray.opacity(0.8)))) // İpucu sarı renkte
                                        .cornerRadius(4)
                                        .onTapGesture {
                                            selectCell(row: row, col: col)
                                        }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20) // Grid'i yanlardan biraz mesafe bırakıyoruz
                    .padding(.vertical, 5) // Yüksekliği biraz ayarlıyoruz

                    // Seçimi Temizle ve Kelimeyi Kontrol Et Butonları
                    HStack(spacing: 20) {
                        Button(action: {
                            selectedCells.removeAll()
                        }) {
                            Text("Opağu")
                                .padding()
                                .background(Color.red.opacity(0.9))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }

                        Button(action: {
                            checkSelectedWord()
                        }) {
                            Text("Kobdziri")
                                .padding()
                                .background(Color.blue.opacity(0.9))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding(.top, 10)

                    // Bulunması Gereken Kelimeler
                    VStack {
                        Text("Zitape Odziru:")
                            .font(.headline)
                            .padding(.bottom, 10)

                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
                            ForEach(Array(words.enumerated()), id: \.offset) { index, word in
                                Text(word)
                                    .font(.body)
                                                    .padding(9)
                                                    .foregroundColor(remainingWords[word] == true ? Color.gray : Color.black)
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .background(remainingWords[word] == true ? Color.green.opacity(0.5) : Color.yellow.opacity(0.7)) // Arka plan rengi eklenir
                                                    .cornerRadius(5)
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 5)
                                                            .stroke(Color.black, lineWidth: 1)
                                    )
                                    .onTapGesture {
                                        showWordClue(for: word) // Kelimeler üzerine tıklayınca ipucu göster
                                    }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 10)

                    // Ekranın alt kısmını doldurmak için Spacer
                    Spacer()
                }
                .padding(.top, 20)
            }
        }
        // Oyun başladığında kategoriye göre kelimeleri güncelleyip 'remainingWords' listesine ekliyoruz
        .onAppear {
            resetGame() // Oyun başladığında kelimeleri sıfırlıyoruz ve yeni kelimeler alıyoruz
            placeWordsInGrid() // Kelimeleri grid'e yerleştiriyoruz
            startTimer() // Zamanlayıcıyı başlatıyoruz
        }
        .onAppear {
            resetGame() // Oyun başladığında reset atıyoruz
        }
        .onDisappear {
            resetGame() // Kategoriler ekranına dönüldüğünde sıfırlama işlemi yapılır
        }
        .alert(isPresented: $isGameOver) {
            let message = timeRemaining > 0 ? "Mteli zitape kudziru" : "Var ora!"
            return Alert(
                title: Text("Osterobaşi Opağu!"),
                message: Text("\(message) Tkvani Puani: \(score)"),
                dismissButton: .default(Text("Xolo ağani osteroba"), action: resetGame)
            )
        }
    }
    private func getGameSettings(for category: String) -> GameSettings {
        let words = GameSettings.getWords(for: category)
        let alternativeWords = GameSettings.getAlternativeWords(for: category)
        
        return GameSettings(gridSize: 10, timeLimit: 120, category: category, words: words, alternativeWords: alternativeWords)
    }
    func selectCell(row: Int, col: Int) {
        if !selectedCells.contains(where: { $0 == (row, col) }) {
            selectedCells.append((row, col))
        }
    }

    func placeWordsInGrid() {
        let shuffledWords = words.shuffled()  // Kelimeleri karıştırıyoruz
        var usedWords = Set<String>() // Daha önce yerleştirilen kelimeleri takip et
        var attempts = 0 // Deneme sayısını tutar
        var placedWords = [String]() // Yerleştirilen kelimeler

        // Tüm kelimeleri yerleştirmek için döngü
        for word in shuffledWords {
            var placed = false
            attempts = 0

            // Kelime yerleştirilememişse, denemeye devam ediyoruz
            while !placed && attempts < 100 { // 100 deneme sınırı
                let direction = Int.random(in: 0...2)
                let row = Int.random(in: 0..<settings.gridSize)
                let col = Int.random(in: 0..<settings.gridSize)

                // Eğer kelime daha önce yerleştirilmemişse ve yerleştirilebiliyorsa
                if canPlaceWord(word, at: (row, col), direction: direction) && !usedWords.contains(word) {
                    placeWord(word, at: (row, col), direction: direction)
                    usedWords.insert(word) // Kelimeyi usedWords set'ine ekliyoruz
                    placedWords.append(word) // Kelimeyi yerleştirilenler listesine ekliyoruz
                    placed = true
                } else {
                    // Alternatif kelime ekleme işlemi
                    let alternativeWord = getAlternativeWord(for: word, usedWords: usedWords) // `allWords` parametresini kaldırdık
                    if canPlaceWord(alternativeWord, at: (row, col), direction: direction) && !usedWords.contains(alternativeWord) {
                        placeWord(alternativeWord, at: (row, col), direction: direction)
                        usedWords.insert(alternativeWord) // Alternatif kelimeyi usedWords set'ine ekliyoruz
                        placed = true
                    }
                }
                attempts += 1
            }

            if !placed {
                print("Kelime yerleştirilemedi: \(word)") // Hata mesajı
            }
        }

        fillEmptySpaces()
    }

    func getAlternativeWord(for word: String, usedWords: Set<String>) -> String {
        // Alternatif kelime olarak mevcut kelimenin uzunluğunda ve kullanılmayan kelimeleri alıyoruz
        let availableWords = words.filter { $0.count == word.count && !usedWords.contains($0) }
        print("Alternatif Kelimeler: \(availableWords)") // Alternatif kelimeleri kontrol et
        return availableWords.randomElement() ?? word // Eğer alternatif bulunmazsa, orijinal kelimeyi döndür
    }

    func canPlaceWord(_ word: String, at position: (Int, Int), direction: Int) -> Bool {
        let (row, col) = position
        let wordLength = word.count
        
        switch direction {
        case 0:
            if col + wordLength > settings.gridSize { return false }
            for i in 0..<wordLength {
                if letterGrid[row][col + i] != "-" { return false }
            }
        case 1:
            if row + wordLength > settings.gridSize { return false }
            for i in 0..<wordLength {
                if letterGrid[row + i][col] != "-" { return false }
            }
        case 2:
            if row + wordLength > settings.gridSize || col + wordLength > settings.gridSize { return false }
            for i in 0..<wordLength {
                if letterGrid[row + i][col + i] != "-" { return false }
            }
        default:
            return false
        }
        
        return true
    }

    func placeWord(_ word: String, at position: (Int, Int), direction: Int) {
        let (row, col) = position
        
        for (i, letter) in word.enumerated() {
            switch direction {
            case 0:
                letterGrid[row][col + i] = letter
            case 1:
                letterGrid[row + i][col] = letter
            case 2:
                letterGrid[row + i][col + i] = letter
            default:
                break
            }
        }
    }

    func fillEmptySpaces() {
        for row in 0..<settings.gridSize {
            for col in 0..<settings.gridSize {
                if letterGrid[row][col] == "-" {
                    letterGrid[row][col] = lazcaHarfler.randomElement()!
                }
            }
        }
    }

    func checkSelectedWord() {
        let selectedWord = String(selectedCells.map { (row, col) in
            return letterGrid[row][col]
        })
        
        if words.contains(selectedWord) {
            foundWords.append(selectedCells)
            score += 10
            lastFoundWord = selectedWord
            remainingWords[selectedWord] = true
            audioPlayer.playSound(named: "dogru")
            selectedCells.removeAll()
            
            if remainingWords.values.allSatisfy({ $0 }) {
                isGameOver = true
            }
        } else {
            audioPlayer.playSound(named: "yanlis")
            selectedCells.removeAll()
        }
    }

    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.timer?.invalidate()
                self.isGameOver = true
            }
        }
    }

    func resetGame() {
        score = 0
        lastFoundWord = ""
        selectedCells.removeAll()
        foundWords.removeAll()
        remainingWords = [:] // Kelimeleri sıfırlıyoruz
        
        // Kategoriden gelen tüm kelimeleri alıp, karıştırıyoruz ve 10 tane kelime seçiyoruz
        let uniqueWords = Array(Set(GameSettings.getWords(for: settings.category)))
        let shuffledWords = uniqueWords.shuffled()
        
        // Daha önceki oyunlardan seçilmemiş kelimeleri alıyoruz
        remainingWords = Dictionary(uniqueKeysWithValues: shuffledWords.prefix(10).map { ($0, false) })
        
        isGameOver = false
        timeRemaining = settings.timeLimit
        placedWords.removeAll()
        
        // Kelimeleri sıfırlıyoruz ve yeni kelimeleri alıyoruz
        placeWordsInGrid()  // Kelimeleri tekrar yerleştiriyoruz
        startTimer()  // Zamanlayıcıyı başlatıyoruz
    }

    func showWordClue(for word: String) {
        // İpucu olarak kelimenin harflerini işaretle
        clueCells = []
        var tempCells: [(Int, Int)] = []
        for row in 0..<settings.gridSize {
            for col in 0..<settings.gridSize {
                if letterGrid[row][col] == word.first! { // İlk harfe eşit olanları buluyoruz
                    tempCells.append((row, col)) // Burada bu harflerin koordinatlarını topluyoruz
                }
            }
        }
        clueCells = tempCells // Ipucu hücreleri set ediliyor
        showClue = true // İpucu gösteriliyor
    }
}
