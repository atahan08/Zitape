//
//  GameSettings.swift
//  Zitape
//
//  Created by Aleksandra Neumestova on 15.11.2024.
//


struct GameSettings {
    static let maxWordsLimit = 10
    

    let gridSize: Int
    let timeLimit: Int
    let category: String
    var words: [String]  // words burada var, çünkü resetGame'de güncellenecek
    var alternativeWords: [String]  // Alternatif kelimeler

    init(gridSize: Int, timeLimit: Int, category: String, words: [String], alternativeWords: [String]) {
        self.gridSize = gridSize
        self.timeLimit = timeLimit
        self.category = category
        self.words = Array(words.prefix(GameSettings.maxWordsLimit))
        self.alternativeWords = alternativeWords
    }

    static func getWords(for category: String) -> [String] {
        let allWords: [String]
        switch category {
        case "Mteli":
            allWords = mteliWords
        case "Pukurepe":
            allWords = pukurepeWords
        case "Coxo":
            allWords = coxoWords
        case "Meyvepe":
            allWords = meyvepeWords
        case "Kvincepe":
            allWords = kvincepeWords
        case "Skindinape":
            allWords = skindinapeWords
        case "Lazi Oputepe":
            allWords = laziOputepeWords
        case "Lilvepe":
            allWords = lilvepeWords
        case "Bobalape":
            allWords = bobalapeWords
        case "Çxomepe":
            allWords = cxomepeWords
        case "Xurape":
            allWords = xurapeWords
        case "Oçkomalepe":
            allWords = ockomalepeWords
        case "Tutape":
            allWords = tutapeWords
        default:
            allWords = []
        }

        // Kelimeleri karıştırıyoruz ve ilk 10'u alıyoruz
        return allWords.shuffled().prefix(maxWordsLimit).map { $0 }
    }
    
    // Alternatif kelimeleri almak için fonksiyon
    static func getAlternativeWords(for category: String) -> [String] {
        let allWords = getWords(for: category) // Ana kelimeleri alıyoruz
        return allWords.shuffled().prefix(maxWordsLimit).map { $0 }
    }
}
    
let mteliWords = [ "ĞORĞORCİ", "KOTUME", "ǨUŞǨUŞİ", "ABJA", "ABUǨAŤİ", "ACANLİ", "AĞANİ", "AĞNE", "AMERİǨA", "AP̌ŤEZİ", "P̌AŤA",
                              "ÇKVA", "UƷXU", "P̌RİǨE", "MŞǨORİNERİ", "GURİMEÇVALA", "MEREMŤİSUZİÇ̌VİNİ", "MŞKONERİ", "TOLİUZĞU", "MAPXA",
                              "MJURONİ", "TARONİ", "KÇE", "XÇE", "KÇEŞİ", "XİLAFİ", "FİRİDA", "UGYARALOBA", "MŞǨORİNİ", "OGİNEPE", "UGYARELİ",  "YOXO", "NCOXO", "ǨOÇİ", "ĞAĞALİDA", "XOXONÇ̌A", "OROPA", "TEĞİ", "ǨAǨALA", "ǨAǨALİ", "ǨOREƷXALA", "ADEŤİŤİ", "ÇKUNEBURİ", "ŞǨUNEBURİ", "MÇ̌ONİ", "COXONİ", "AFRİǨA", "BODA", "LESA", "XULEXİ", "XAYİ", "AĞA", "AǨİRLUĞİ", "MCA", "YAŤONİ", "KAP̌İ", "SOYA", "ǨOP̌A", "OMBOLİNA", "ǨANÇXA", "SǨAFİNDİ", "TAMLİ", "RAXNAMOSA", "LİMSA", "BAGENİ", "MONǨA", "MONǨANOBA", "MGARA", "NǨUNAǨİ", "BGARİNİ", "NOBGARE", "Ç̌URİNACE", "ǮǨUNİ", "ǮUNA", "NUǨU", "KORBALA", "AŤAŤURİ", "NUǨUĞUŤUŤA", "MANDRE", "BAǨİ", "EXAǨİ", "BANGA", "GANGARA", "REİǨA", "OŤRİǨE", "NOSİ", "KOTUME", "KAKABİ", "ZEMSKU", "ŞUŞANİ", "MACACĞA", "MSİRİDA", "MAÇ̌AP̌ULE", "ǮİP̌ǮİP̌İLİ", "KUDELUÇA", "UÇAǨOXǨOXİ", "KRAOLONİ", "ǨUDELİKÇE", "ƷANA", "ÇAİǨİNÇİ", "ǨİNÇİ", "MALİMBORİ",
                              "Ç̌URÇ̌ASİCA", "ĞVAMÇ̌İTA", "MŞKİRİ", "MÇ̌URÇ̌̆A", "TİASP̌URA", "Ç̌İÇ̌İRİ", "Ç̌İLLİZİ", "P̌URMOLİ", "MÇXUŞP̌URMOLİ", "ǨAXİ", "NGOLAǨAXİ", "SİMSİǨOǨARİ", "ǮİMǮİMİ", "TİPİǨİNÇİ", "CİCEĞENİ", "ŞİRA", "ŤOǨOǨORO", "ŞİLİDONİ", "DİXAŞİRA", "TİUÇA", "BAĞULYA", "MASP̌İNALE", "ǨİǨİLİBUNKŞİ", "ǨUDELİSARİ", "FİYO", "MALAĞUDE", "Ç̌İNǨAMAMJVABULE", "MAǮİǮİLE", "ǨUǨUDA", "ĞARĞA", "ǨUǨULİNA", "ZUĞAǨİNÇİ", "MŤǨORİKOTUME", "ǨİǨİLİGİNŽE",
                              "NAÇ̌İÇ̌ĞİNERİ", "ǮARİZEMSǨU", "NOĞAŤOROCİ", "ŞANAULİŤOROCİ", "MŤǨORİŤOROCİ", "ǨURŽULİ", "BİBİ", "UTKA",
                              "SKENCE", "MANGANA", "OMÇVELİNA", "ǨODA", "ÇELEPURİ", "NGOLAKOTUME", "NOSONİ", "NOSİDİXO", "ZURANİ", "AKİNTİ",
                              "MOŤALERİ", "LONǮA", "UGAMAǨASU", "MUZİKA", "ŤİŞİNERİ", "AKREBİ", "XAVİ", "LİMCİ", "ǨARMAXA", "ŤALAXA",
                              "DOGNEĞİ", "TAPALA", "ŤAKİMİ", "PALURİ", "GOGNA", "ǨOP̌A", "GEGAPA", "ADETİ", "İSP̌İRTO", "ĞORMOŤİ", "MARANİ",
                              "ÇİJİ", "TUDELE", "AŞİ", "OKRO", "TUDALEŞA", "MERÇALE", "TUDENDO", "MAAŞANİ", "TUDE", "ÇURİ", "MARA", "BAĞU",
                              "CUMADİ", "KORBAÇXALA", "MAKOSALE", "MONÇ̌E", "NANANENA", "MǨOLA", "DOXMELİǨANUNİ", "ANCAXİ", "OXOǮONALİKİ",
                              "XİLAFİ", "NANA", "NANDİDİ", "AMEŞVENE", "TENORA", "AMEŞVENE", "CENÇARERİ", "GAGNU", "DUNDULA", "ARMOZİ",
                              "ELAMǮUMERİ", "OŞǨENDA", "LEŤA", "ǨOMAŤİ", "Ç̌ALA", "ONA", "GENOŤALE", "MEYONA", "ANǨRA", "ARMONİ", "P̌UŤUCİ",
                              "MZİ", "XERǨİ", "ǨAP̌ULA", "MǮǨORA", "UǨAÇXE", "ǨATA", "JİLENDO", "ÇELEPURİ", "SǨENDE", "ǨODACELVOBAŞE",
                              "ÇKAR", "BİNEXİ", "ǮALE", "GEMTİ", "LEMŞİ", "TERMONİ", "P̌AP̌ULİ", "P̌AP̌UNENA", "DAÇXURİ", "FENALA", "MEBİRA",
                              "SİNDOMİ", "TUTA", "XAMP̌U", "ŤAǨŤAǨARA", "TİŞİNERİ", "TANURA", "Ç̌AǨALA", "YALİ", "ÇİSTİ", "AYİ", "BİYA",
                              "MǮİǨA", "BABA", "UBABELİ", "BAGİ", "XEŞİ", "DOXMELİ", "MĞORİNİ", "MOBALAŞE", "DOLAXERİ", "AVLA", "ŤİŞİ",
                              "AHA", "ǨONǨORAXİ", "UǮǨOMİLU", "ZEMCİ", "ǮǨOMİLİ", "TURÇANİ", "BAǨLAÇ̌İ", "TORPİ", "ǨVARİ", "MOZİNE",
                              "ŤOŤOƷİ", "MPOLO", "OXASURE", "ÇXOMİ", "ǮİPİ", "KAŤO", "XAATİ", "ARGUNİ", "VAYYOZİ", "ÇKİMDA", "MEKAÇALONİ",
                              "MANDRE", "BAGENİ", "MERZE", "PARXANA", "P̌A", "CEBAZGİNAŞE", "TAZİĞİ", "GOMBARERİ", "BİǨA", "Tİ", "TİDVERİ",
                              "MOXOLUN", "REİSİ", "TENİ", "MOÇ̌ǨA", "MANÇ̌URİ", "ZONİ", "GENŤONA", "XASİ", "YAMA", "KİMİ", "BERENA",
                              "LULUBERE", "ÇALİMİ", "XENAPA", "ǨRİMA", "MONDO", "MA", "Sİ", "ÇKİMDEN", "ÇERE", "P̌EŤLİ", "P̌AP̌AXİ", "MOLE",
                              "KÇE", "KUNİ", "XAMİ", "PONǮO", "ƷİƷA", "SAP̌ARİ", "XAŞARİ", "ĞOBER", "P̌OŤRA", "MONǨA", "ÇXALURİ", "GERMA",
                              "P̌ANDA", "ŤAŤİ", "SOLAĞANİ", "SİCA", "OXORİ", "OXİNİ", "HO", "DİDİ", "OKOMOJONİ", "İÇİLONİ", "USUMİ",
                              "NOĞASİMA", "ŞİLEP̌İ", "MORDALE", "MÇİRE", "GOMPANOBA", "ǮİMİNDE", "MTİNİ", "MTİLANA", "BADİ", "DADİ", "LACİ",
                              "LACONİ", "NOĞA", "Ç̌EXNİ", "GAYBANA", "ŞURİ", "EZMOCE", "İXİ", "KOMOLOBA", "Ç̌AÇ̌A", "ÇEPLA", "ÇERÇİ", "NAKU",
                              "ǨO", "OXORZA", "LAVONİ", "KAŤO", "ǨOP̌A", "ĞAÇ̌A", "ĞURA", "UMRİ", "ĞURERİ", "UPARELİ", "PALTOSİ", "NANİ",
                              "YAMÇ̌İ", "VALİ", "TANİ", "MİNCİ", "PİCOMA", "XİŞİRİ", "ÇARǨAŤURA", "KÇANA", "NÇ̌ELERİ", "KOMOLİ", "XVANİ",
                              "KOMOLOBA", "DULYA", "PAGARA", "MAMA", "Ç̌AǨLA", "LAǨİRDE", "ANDERİ", "LAZONA", "LEÇE", "LAZİ", "KANÇA",
                              "TADİ", "ELAXİ", "MAGANA", "XAMPA", "ĞERİ", "MZİ", "DOSKİDİNERİ", "TONA", "MİLİ", "FARA", "LUǨNA", "ǨURNA",
                              "ǨAYOBONİ", "MURADİ", "XELOBA", "ÇALİMİ", "DİŞǨA", "MAMCALA", "TOMA", "PİMBİLİ", "MİSA", "TAMO", "MPALO",
                              "USULİ", "MONTİNA", "NÇ̌ARA", "GOLA", "PUPULİ", "PARVİ", "GYULİ", "BURBU", "XAŞALİ", "GVERDİ", "OÇ̌UME",
                              "PAĞİ", "RAǨANİ", "DUDİ", "UPİ", "AǮİ", "ONDİ", "MACİDA", "İNİ", "KORİNERİ", "ǨANCUBALİ", "OZMONA", "NAİLA",
                              "KALATİ", "ǮANA", "ĞVARİ", "GOKTURU", "ZORİ", "GOMÇVERİ", "JİLE", "MURGİ", "ÇUÇKA", "TAVİ", "BULTİ", "KUMULİ",
                              "VERANE", "MURUNƷXİ", "OŞKOMONİ", "P̌OLİ", "LOYA", "MAÇXA", "FROXTİ", "NONǮORE", "P̌ATARA", "ŞALBA", "MGVANERİ",
                              "CEKTAPERİ", "SAĞANİ", "BURÇ̌ULİ", "PİƷARİ", "ŤAVLİ", "MANDOMA", "MǨORİDA", "MEÇANERİ", "ǨAǨALİ", "TANURİ",
                              "ÇKİNAPERİ", "ǮUPA", "ARǨELENDO", "SEMTİ", "LİVADİ", "ONŤULE", "MERAĞİ", "MERAǨLİ", "NAP̌İRİ", "KVA", "MJALVALİ", "MJALVA", "MESǨVANA", "KYUME", "PAPA", "OSXONE", "XVALA", "ŤEYARE", "ÇİÇKU", "ZAMELİ", "ǮARİ", "PURENGİ", "OMŞVELİNA", "MP̌ULA", "NCUMORİ", "ǨERǨELİ", "MURECİ", "MǮULİ", "UÇA", "ŤUƷA", "ŤUƷANOBA", "ŤARONİ", "PAVRİ", "ǨOROƷXA", "LİLVE", "ƷXUNA", "FARA", "ǨAP̌ETİ", "ZOİ", "BARDİ", "ÇEMİ", "CİNAZE", "XİŤİ", "LAǨAŤǨA",
                              "GOǨORONİ", "MSUCİ", "XARBİ", "XOMA", "UNENALE", "MİSA", "OROPERİ", "OROPONİ", "ORDO", "MPEJİ", "DOǨANAŞE",
                              "KUZİNA", "ŞVANCALA", "SİLİSONİ", "ÇODİNA", "UǨAÇXE", "BİGA", "NOÇ̌İTXE", "Ç̌İTXA", "DİDİCOXO", "ZİŤA",
                              "ǨEBİLE", "OKOSALE", "ŤRAǮİ", "ǨATA", "P̌̆RASǨA", "LERİ", "COĞORİLERİ", "NDAĞİǨROMİ", "P̌̆İP̌̆ERİ", "LUQU",
                              "LU", "LUİ", "LUĞİ", "ǨAXALA", "SOŤOLİA", "BULEǨİ", "REDİSİ", "BROKOLİ", "TARGAMİ", "LOBİA", "FRASULİ",
                              "SOYALOBYA", "XACİAVAǨALOBİA", "NUXUŤUİ", "İLONİFELİ", "ŞUǨA", "LANGAXİAŞUǨA", "ĞALAMSO", "BURĞİ", "PERSENGİ",
                              "LAP̌̆AZA", "ALİMP̌̆O", "DİÇ̌ǨİCİ", "NGOLANTXİRİ", "MARKVALA", "GUGULİOŽ̆E", "ǮİǮİLAKUDİ", "MǨYAPUKSİNİ", "ǨAVİ",
                              "MSUŤULYA", "PEP̌̆ERİ", "ǨROMİ", "XACİ", "ǨUMXİ", "FELİ", "ǨASŤANE", "ORE", "DİXAMAKVALİ", "KARTOFİ", "MEROCA",
                              "ĞRAMSO", "MERGYA", "TOMATİSİ", "MƷULǨUBURİ", "DİXAUŞKURİ", "İSPANAǨİ", "ŤURP̌̆İ", "MƷXULİ", "ŤANŤA", "UŞKİRİ",
                              "MŤǨURİUŞKİRİ", "BİA", "QOMURİ", "COĞORQOMURİ", "BULİ", "MBULİ", "MŤǨURİBULİ", "ǨOLOBULİ", "VİŞNE", "VİŞNA",
                              "ÇABEXURMA", "XURMA", "UVA", "ANŤAMA", "LUĞİ", "ƷXİMUNŤURİ", "MUŞMULA", "MJOLİ", "BERǮEULİ", "NEŤAİ",
                              "NTXİRİ", "MŤǨURİTXİRİ", "MǮǨO", "P̌̆OZİ", "BİNEXİ", "ǨİVİ", "ARANŽ̆İ", "LİMONİ", "MANDALİNA", "PORŤUǨALİ",
                              "ǨREPSİ", "DURĞUNİ", "KÇEDURĞUNİ", "DAŽİǨANDĞU", "ANSǨİLİ", "DİNANAŞQURŽENİ", "MŤURİMŞALİ", "ZURMEXİ",
                              "LAZUŤİ", "BARABURA", "BALDURCANİ", "ǨAǨA", "QURZENİ", "URZENİ", "COĞORƷANAǨO", "REBU", "QOQORE", "FELİ",
                              "ORE", "LAZURİFELİ", "JOSTABERRY", "ǨARP̌UZİ", "ǨAVUNİ", "KİVİ", "MJORATOLİ", "LİMONİ", "ǨANDĞU", "MŤURİǨANDĞU",
                              "SKİNDİ", "OMBRİ", "BERǮEULİ", "ANŤAMA", "NǮELA", "LİǨİBA", "ǨAƷXANǨA", "ANƷERA", "ƷKİMUTİ", "NƷXİLİMUŤRİ",
                              "NƷZİMUNŤİ", "MUŞİ", "DANDZİǨANDĞU", "URDZENİ", "NEDZİ", "MǮU", "MǮǨO", "ŞİNǨA", "ǨAPÇA", "GYARİ", "MEVAPERİ",
                              "MJA", "LUPRİNCONİ", "TERMONİ", "ĞOMU", "MİNCİ", "XURİNA", "ǨORǨOŤİ", "PAPA", "ǨAPÇONİGYARİ", "ǨAPÇAGEÇ̌VERİ",
                              "GEŤAĞANERİ", "MÇ̌ǨUDİ", "PUCİYAĞİ", "LUDUDERİ", "LUNCAXERİ", "XACİMEǨİDERİ", "ALİMORCİ", "MTUTİLAZUŤİ",
                              "BARABURA", "LEŤAORE", "ǨARTOFİ", "ǨUǨURİĞİ", "ǨARŤOP̌İLİ", "DİXAQOQORE", "DİXAMAKVALİ", "BALDURCANİ",
                              "PAŤLİCANİ", "İASMİNE", "ǨAǨA", "BALUCAĞİ", "BALURŽAĞİ", "BALAŽAĞU", "TOMATİSİ", "ŞANAULİPATULCANİ",
                              "COĞOREANAǨO", "LAǨİURŽENİ", "KORMEURZENİ", "TUTUNİ", "TUTUMİ", "P̌İP̌ERİ", "P̌EP̌ERİ", "MTURİP̌İP̌ERİ",
                              "LUQU", "LU", "LUU", "LUİ", "Ç̌AXALA", "SOŤOLİA", "SUŤULYA", "MSUŤULYA", "MSUŤOLYA", "SOŤELİA", "BULEǨİ",
                              "BULEÇ̌İ", "REDİSİ", "REBU", "ƷELTİ", "ŞOROÇ̌İ", "KORTURAMULA", "NGOLAMULA", "NGOLADUİXU", "MTUTİMXULİ",
                              "MŞKERİ", "KÇEMŞǨERİ", "YELİ", "MŞǨERİNKOLO", "LEŤAOŞǨURİ", "ƷANAQO", "ǨANİXANAQO", "MAǮǨVİNŤİA", "LUǨUMXA",
                              "ǮİǨARİ", "ǮİǨAİ", "ǨAŤUMCA", "NOǨUMXA", "LUǨUMXA", "LEǨUPXA", "LEǨUXA", "ÇXARAZİ", "XAALİ", "TXAǨAǨALİ",
                              "MŤǨURİǨAǨALİ", "ǨORǮOXULİ", "SǨİFİRİ", "SǨİFİNDİ", "SFİNDRİ", "MĞOǮO", "ALAFİ", "ĞOǮO", "BAŽGARİ",
                              "CAYǨANDĞU", "COĞORİMǮǨO", "ǮİǮLAMǮǨO", "ÇAİ", "NÇAİ", "ǨAMP̌ARA", "İNÇ̌İRİ", "SǨİPİNDRİ", "PİNÇ̌O",
                              "MZANA", "DADALİ", "ǨİCİRİ", "LEŤABİNEXİ", "BARDİ", "MSUCİ", "MŞANǨO", "MŞARDİ", "ÇABU", "DİǨA", "KERİ",
                              "PAŤİ", "PENCGİRE", "KURUMİ", "BRİNCİ", "ULAFİ", "NÇ̌VAVİ", "TİPİKÇE", "Ç̌ANGA", "DURǮA", "İSİRİ", "İSŤRİ",
                              "ǨARYANESİ", "MÇ̌İPEǨARYANESİ", "ǨAZAĞİTİPİ", "NOSULE", "LAYÇ̌İTİPİ", "BAǮARİ", "KÇETİPİ", "PAŤİTİPİ",
                              "AVİNÇAİRİ", "LAǨAŞİ", "ǮU", "ǨURİA", "MŤǨURİLERİ", "LEŤAURŽ̆ENİ", "NƷXENİÇ̌İBRİ", "ALİMORCİ", "MTUTİLAZUŤİ",
                              "TUTUNİ", "MTURİP̌İP̌̆ERİ", "MŤǨURİFARSULİ", "KİNŽİ", "ƷRİNCİ", "AĞULİMŤA", "MİNTA", "MŤURİMİNTA",
                              "ƷXUǨUBURİ", "PŞİŤUİLİ", "ƷİƷİLAURZENİ", "ANÇXOLİ", "ÇAXAÇ̌İ", "MǨYAPUBUĞİ", "ƷARMAXİ", "BUZİMCA", "ĞVALO",
                              "LORESİMA", "MOĞİ", "DANDAGERİ", "ORUBAǨİNA", "ŤUǨŞİ", "MŤURİŤUKŞİ", "ELASVONİ", "ǨVARŞİLİ", "MJORAŞOSULE",
                              "ÇXEŞÇ̌AMİ", "PURÇUMA", "PSARDAǨİ", "NGOLALU", "ƷXENİŞİǨUDELİ", "KÇEMCUMENİ", "MCUMENİ", "DUDUKA", "ĞARDUVALİ",
                              "BRUZİNA", "TATİ", "Ç̌ANDİDİ", "MŤǨURİZURMEXİ", "ƷALAXVARİ", "MOLOKİ", "ǨEPRİ", "SU", "PORDİǨİ", "MŤǨURİǨEPRİ",
                              "ƷKİP̌İLİ", "LOMP̌ERA", "LAÇ̌̆İǨUDELİ", "AP̌UŤRAǨİ", "BAMBAǨİ", "PAPAXİ", "PERO", "MƷİGURA", "ŤOPURİ",
                              "SŤİP̌OP̌̆İ", "MÇXAǨU", "ǨAPÇANÇXAǨU", "NGOLAÇAİ", "ŞAǨAİLE", "CAĞULECİ", "MACĞVİDİA", "KAŤUNENA",
                              "ǨAŤUŞİNENA", "JAYLA", "MJAYLA", "MAMJVALE", "COĞORİMJA", "MABJALİA", "LEŤAǨROMİ", "AŞURA", "LİMBOƷA",
                              "LİMROSA", "BİLONƷA", "TOMALYARİLİMBOƷA", "LİMXONA", "LİMXANA", "VİMXANA", "OŽELİǨİ", "MŤURİLİMBOƷA",
                              "LEŤAÇAÇALA", "OÇARÇALONİ", "PUCİNENA", "ǮİǮİLAOƷXECİ", "SAŤU", "LEŤASAP̌U", "MAKVALA", "XALADİDAǨUNDİ",
                              "ǮEFA", "OBREDONİ", "ǨENİA", "SOXORGYA", "MŤǨURİSKİNDİ", "ǨAŤU", "COĞORİ", "LAÇ̌İ", "ƷXENİ", "GİRİNİ",
                              "GURUNİ", "SİFŤERİ", "DADULİǮİ", "KORME", "KOTUME", "MAMULİ", "PUCİ", "PİTİNA", "MÇXURİ", "ŤİǨANİ",
                              "ŞORONİ", "TXA", "XOCİ", "GENİ", "MOZARİ", "Ç̌UÇ̌ULİ", "ǮİP̌İLİ", "ǨİNÇİ", "KVİNÇİ", "MTUİ", "MTUGİ",
                              "ǨVARİ", "ORŤİÇ̌İ", "OŤRİǨE", "LOMİ", "ǮİǮİLA", "ĞECİ", "KURİ", "MÇXOMİ", "ÇXOMBİ", "DELPİNA", "DUNÇU",
                              "DUMÇ̌ǨU", "BOBOLA", "BOBOMÇVA", "BOMBULA", "ǮİǮİ", "MALAĞURE", "KURDZULİ", "MŤǨAŞKOTUME", "GOLAMAMULİ",
                              "ŤRİǨİMAMJVABULE", "ǨARǨALAMŤAXU", "MZESKU", "ǮANAğANİ", "ǨUNDURA", "MARŤİ", "AP̌RİLİ", "MAİSİ", "BULVA",
                              "KƷALA", "MARİAŞİNA", "ÇXALVA", "ŤAXVA", "ǮİLVA", "XRİSŤANA", "BURƷXA", "KURİ", "OFİDİ", "ǨAMǮAMİ", "UCİ",
                              "QUCİ", "NENA", "ÇARBİ", "LEŞǨİ", "ALİ", "QALİ", "NUǨU", "ÇİMÇİRİ", "ÇİǨO", "NUǨU", "ǨİBİRİ", "XURŤULİ",
                              "XARAYİ", "ĞVA", "ÇXİNDİ", "TOLİ", "ǨVA", "ǨOP̌A", "TOMA", "Tİ", "DUDİ", "ÇONÇXİ", "DİRǨU", "PANǮALA",
                              "PALANǮA", "MÇU", "GURİ", "ŞKEMBE", "PURPU", "JERĞVİ", "ŤEBİ", "ŤKEBİ", "MUNDİ", "XORƷİ", "KAPÇA", "AZMARİDA",
                              "SŤAVRİŤİ", "BARBONİ", "ǨRAÇ̌A", "GİLARE", "SİPARİ", "LELEMA", "LAXO", "LEVREKİ", "LUFERİ", "ǨOFONA", "Ç̌İNAǨOPİ",
                              "KYOTEĞİ", "TRİǮA", "P̌LAŤOZİ", "SPARO", "MAVROŞKİNİ", "İŞKİNA", "TRAǨONLİ", "ǨOVİDİ", "DELPİNA", "ZUĞAĞECİ",
                              "MUTİǨA", "MUTUİ", "MUNTURİ", "VEŞAP̌İ", "LAÇ̌İÇXOMİ", "COĞORCÇXOMİ", "OKONOZİ", "P̌ALAMUTİ", "MURUNA",
                              "ZUTXİ", "FANUSA", "ĞOÇ̌ǨO", "SNAǨİ", "Ç̌İPURA", "SARGANA", "ĞVATO", "LOKO", "İNEXİ", "NEXİ", "ĞVANÇKİ",
                              "ǨALMAXA", "MALEBE", "KASNA", "PANǮO", "ĞORŽGO", "ŤABALAYÇXOMİ", "ƷXAP̌ALA", "Ç̌AĞANA", "MAXANƷA",
                              "ǨOXLİDİ", "MİDYA", "RAPANA", "ĞVANÇ̌İ", "ZUĞAÇURİ", "KÇEPARPALİ", "CAVURİPARPALİ", "ǨUDELONİPARPALİ",
                              "CAZİPARPALİ", "HENİPARPALİ", "MEŤAKSİŞİMUNŤURİ", "ǨUŤUMZUMU", "ǨUXİ", "BUÇ̌İMUNŤURİ", "ǨARǨALAŤAXU",
                              "ǮARİBOBOLA", "ĞOǨO", "Ç̌İǨAME", "ŞİVRİ", "ǨİÇ̌AÇ̌İ", "ÇİÇİ", "MAKSİNALE", "KSİNACE", "ÇİÇXİLİ", "ƷAXOCİ",
                              "TXİRǮİǮİ", "BOBONÇ̌VA", "DUMÇ̌ǨU", "MAP̌AZULE", "XAVANA", "ǨARTOFİBOBOLA", "MǮǨİRİNANA", "BOBOLİA", "BUŤǨUCİ",
                              "MAǮOPXE", "MJUJU", "BADOMEİ", "MÇ̌ACİ", "LAYÇ̌İMÇ̌ACİ", "BADİǨAMǨULİ", "MP̌URİ", "ǨOĞONO", "MŤİ", "ÇURİMŤİ",
                              "MǮǨİRİ", "ĞAÇ̌ǨA", "MǨORİDA", "BUDİ", "BADARA", "İSİNAMǨOLİ", "ǨOLİ", "ǮİĞVELİ", "ǮİǮİ", "MƷANOMÇ̌EPİ",
                              "OYRENCİ", "ĞVAP̌A", "PENǮE"
    ]
    
let pukurepeWords = [
        "ALİMORCİ", "MTUTİLAZUŤİ", "BARABURA", "LEŤAORE", "ǨARTOFİ", "ǨUǨURİĞİ",
        "ǨARŤOP̌İLİ", "DİXAQOQORE", "DİXAMAKVALİ", "BALDURCANİ", "PAŤLİCANİ",
        "İASMİNE", "ǨAǨA", "BALUCAĞİ", "BALURŽAĞİ", "BALAŽAĞU", "TOMATİSİ",
        "ŞANAULİPATULCANİ", "COĞOREANAǨO", "LAǨİURŽENİ", "KORMEURZENİ", "TUTUNİ",
        "TUTUMİ", "P̌İP̌ERİ", "P̌EP̌ERİ", "MTURİP̌İP̌ERİ", "LUQU", "LU", "LUU",
        "LUİ", "Ç̌AXALA", "SOŤOLİA", "SUŤULYA", "MSUŤULYA", "MSUŤOLYA", "SOŤELİA",
        "BULEǨİ", "BULEÇ̌İ", "REDİSİ", "REBU", "ƷELTİ", "ŞOROÇ̌İ", "KORTURAMULA",
        "NGOLAMULA", "NGOLADUİXU", "MTUTİMXULİ", "MŞKERİ", "KÇEMŞǨERİ", "YELİ",
        "MŞǨERİNKOLO", "LEŤAOŞǨURİ", "ƷANAQO", "ǨANİXANAQO", "MAǮǨVİNŤİA", "LUǨUMXA",
        "ǮİǨARİ", "ǮİǨAİ", "ǨAŤUMCA", "NOǨUMXA", "LUǨUMXA", "LEǨUPXA", "LEǨUXA",
        "ÇXARAZİ", "XAALİ", "TXAǨAǨALİ", "MŤǨURİǨAǨALİ", "ǨORǮOXULİ", "SǨİFİRİ",
        "SǨİFİNDİ", "SFİNDRİ", "MĞOǮO", "ALAFİ", "ĞOǮO", "BAŽGARİ", "CAYǨANDĞU",
        "COĞORİMǮǨO", "ǮİǮLAMǮǨO", "ÇAİ", "NÇAİ", "ǨAMP̌ARA", "İNÇ̌İRİ", "SǨİPİNDRİ",
        "PİNÇ̌O", "MZANA", "DADALİ", "ǨİCİRİ", "LEŤABİNEXİ", "BARDİ", "MSUCİ",
        "MŞANǨO", "MŞARDİ", "ÇABU", "DİǨA", "KERİ", "PAŤİ", "PENCGİRE", "KURUMİ",
        "BRİNCİ", "ULAFİ", "NÇ̌VAVİ", "TİPİKÇE", "Ç̌ANGA", "DURǮA", "İSİRİ", "İSŤRİ",
        "ǨARYANESİ", "MÇ̌İPEǨARYANESİ", "ǨAZAĞİTİPİ", "NOSULE", "LAYÇ̌İTİPİ", "BAǮARİ",
        "KÇETİPİ", "PAŤİTİPİ", "AVİNÇAİRİ", "LAǨAŞİ", "ǮU", "ǨURİA", "MŤǨURİLERİ",
        "LEŤAURŽ̆ENİ", "NƷXENİÇ̌İBRİ", "ALİMORCİ", "MTUTİLAZUŤİ", "TUTUNİ",
        "MTURİP̌İP̌̆ERİ", "MŤǨURİFARSULİ", "KİNŽİ", "ƷRİNCİ", "AĞULİMŤA", "MİNTA",
        "MŤURİMİNTA", "ƷXUǨUBURİ", "PŞİŤUİLİ", "ƷİƷİLAURZENİ", "ANÇXOLİ", "ÇAXAÇ̌İ",
        "MǨYAPUBUĞİ", "ƷARMAXİ", "BUZİMCA", "ĞVALO", "LORESİMA", "MOĞİ", "DANDAGERİ",
        "ORUBAǨİNA", "ŤUǨŞİ", "MŤURİŤUKŞİ", "ELASVONİ", "ǨVARŞİLİ", "MJORAŞOSULE",
        "ÇXEŞÇ̌AMİ", "PURÇUMA", "PSARDAǨİ", "NGOLALU", "ƷXENİŞİǨUDELİ", "KÇEMCUMENİ",
        "MCUMENİ", "DUDUKA", "ĞARDUVALİ", "BRUZİNA", "TATİ", "Ç̌ANDİDİ", "MŤǨURİZURMEXİ",
        "ƷALAXVARİ", "MOLOKİ", "ǨEPRİ", "SU", "PORDİǨİ", "MŤǨURİǨEPRİ", "ƷKİP̌İLİ",
        "LOMP̌ERA", "LAÇ̌̆İǨUDELİ", "AP̌UŤRAǨİ", "BAMBAǨİ", "PAPAXİ", "PERO", "MƷİGURA",
        "ŤOPURİ", "SŤİP̌OP̌̆İ", "MÇXAǨU", "ǨAPÇANÇXAǨU", "NGOLAÇAİ", "ŞAǨAİLE",
        "CAĞULECİ", "MACĞVİDİA", "KAŤUNENA", "ǨAŤUŞİNENA", "JAYLA", "MJAYLA", "MAMJVALE",
        "COĞORİMJA", "MABJALİA", "LEŤAǨROMİ", "AŞURA", "LİMBOƷA", "LİMROSA", "BİLONƷA",
        "TOMALYARİLİMBOƷA", "LİMXONA", "LİMXANA", "VİMXANA", "OŽELİǨİ", "MŤURİLİMBOƷA",
        "LEŤAÇAÇALA", "OÇARÇALONİ", "PUCİNENA", "ǮİǮİLAOƷXECİ", "SAŤU", "LEŤASAP̌U",
        "MAKVALA", "XALADİDAǨUNDİ", "ǮEFA", "OBREDONİ", "ǨENİA", "SOXORGYA", "MŤǨURİSKİNDİ",
        "ǨAŤU", "COĞORİ", "LAÇ̌İ", "ƷXENİ", "GİRİNİ", "GURUNİ", "SİFŤERİ", "DADULİǮİ",
        "KORME", "KOTUME", "MAMULİ", "PUCİ", "PİTİNA", "MÇXURİ", "ŤİǨANİ", "ŞORONİ", "TXA",
        "XOCİ", "GENİ", "MOZARİ", "Ç̌UÇ̌ULİ", "ǮİP̌İLİ", "ǨİNÇİ", "KVİNÇİ", "MTUİ", "MTUGİ",
        "ǨVARİ", "ORŤİÇ̌İ", "OŤRİǨE", "LOMİ", "ǮİǮİLA", "ĞECİ", "KURİ", "MÇXOMİ", "ÇXOMBİ",
        "DELPİNA", "DUNÇU", "DUMÇ̌ǨU", "BOBOLA", "BOBOMÇVA", "BOMBULA", "ǮİǮİ", "MALAĞURE",
        "KURDZULİ", "MŤǨAŞKOTUME", "GOLAMAMULİ", "ŤRİǨİMAMJVABULE", "ǨARǨALAMŤAXU",
        "MZESKU", "ǮANAğANİ", "ǨUNDURA", "MARŤİ", "AP̌RİLİ", "MAİSİ", "BULVA", "KƷALA", "MARİAŞİNA",
        "ÇXALVA", "ŤAXVA", "ǮİLVA", "XRİSŤANA", "BURƷXA", "KURİ", "OFİDİ", "ǨAMǮAMİ", "UCİ",
        "QUCİ", "NENA", "ÇARBİ", "LEŞǨİ", "ALİ", "QALİ", "NUǨU", "ÇİMÇİRİ", "ÇİǨO", "NUǨU",
        "ǨİBİRİ", "XURŤULİ", "XARAYİ", "ĞVA", "ÇXİNDİ", "TOLİ", "ǨVA", "ǨOP̌A", "TOMA", "Tİ",
        "DUDİ", "ÇONÇXİ", "DİRǨU", "PANǮALA", "PALANǮA", "MÇU", "GURİ", "ŞKEMBE", "PURPU", "JERĞVİ",
        "ŤEBİ", "ŤKEBİ", "MUNDİ", "XORƷİ", "KAPÇA", "AZMARİDA", "SŤAVRİŤİ", "BARBONİ", "ǨRAÇ̌A"
    ]
    
let coxoWords = [
        "ABJA", "ABUǨAŤİ", "ACANLİ", "AĞANİ", "AĞNE", "AMERİǨA", "AP̌ŤEZİ", "P̌AŤA",
        "ÇKVA", "UƷXU", "P̌RİǨE", "MŞǨORİNERİ", "GURİMEÇVALA", "MEREMŤİSUZİÇ̌VİNİ",
        "MŞKONERİ", "TOLİUZĞU", "MAPXA", "MJURONİ", "TARONİ", "KÇE", "XÇE", "KÇEŞİ",
        "FİRİDA", "UGYARALOBA", "MŞǨORİNİ", "OGİNEPE", "UGYARELİ", "YOXO", "NCOXO", "ǨOÇİ",
        "ĞAĞALİDA", "XOXONÇ̌A", "OROPA", "TEĞİ", "ǨAǨALA", "ǨAǨALİ", "ǨOREƷXALA", "ADEŤİŤİ",
        "ÇKUNEBURİ", "ŞǨUNEBURİ", "MÇ̌ONİ", "COXONİ", "AFRİǨA", "BODA", "LESA", "XULEXİ",
        "XAYİ", "AĞA", "AǨİRLUĞİ", "MCA", "YAŤONİ", "KAP̌İ", "SOYA", "ǨOP̌A", "OMBOLİNA",
        "ǨANÇXA", "SǨAFİNDİ", "TAMLİ", "RAXNAMOSA", "LİMSA", "BAGENİ", "MONǨA", "MONǨANOBA",
        "MGARA", "NǨUNAǨİ", "BGARİNİ", "NOBGARE", "Ç̌URİNACE", "ǮǨUNİ", "ǮUNA", "NUǨU",
        "KORBALA", "AŤAŤURİ", "NUǨUĞUŤUŤA", "MANDRE", "BAǨİ", "EXAǨİ", "BANGA", "GANGARA",
        "REİǨA", "SKENCE", "MANGANA", "OMÇVELİNA", "ǨODA", "ÇELEPURİ", "NOSİ", "NOSONİ",
        "NOSİDİXO", "ZURANİ", "AKİNTİ", "MOŤALERİ", "LONǮA", "UGAMAǨASU", "MUZİKA", "ŤİŞİNERİ",
        "AKREBİ", "XAVİ", "LİMCİ", "ǨARMAXA", "ŤALAXA", "DOGNEĞİ", "TAPALA", "ŤAKİMİ",
        "PALURİ", "GOGNA", "ǨOP̌A", "GEGAPA", "ADETİ", "İSP̌İRTO", "ĞORMOŤİ", "MARANİ",
        "ÇİJİ", "TUDELE", "AŞİ", "OKRO", "TUDALEŞA", "MERÇALE", "TUDENDO", "MAAŞANİ", "TUDE",
        "ÇURİ", "MARA", "BAĞU", "CUMADİ", "KORBAÇXALA", "MAKOSALE", "MONÇ̌E", "NANANENA",
        "MǨOLA", "DOXMELİǨANUNİ", "ANCAXİ", "OXOǮONALİKİ", "XİLAFİ", "NANA", "NANDİDİ",
        "AMEŞVENE", "TENORA", "AMEŞVENE", "CENÇARERİ", "GAGNU", "DUNDULA", "ARMOZİ",
        "ELAMǮUMERİ", "OŞǨENDA", "LEŤA", "ǨOMAŤİ", "Ç̌ALA", "ONA", "GENOŤALE", "MEYONA",
        "ANǨRA", "ARMONİ", "P̌UŤUCİ", "MZİ", "XERǨİ", "ǨAP̌ULA", "MǮǨORA", "UǨAÇXE",
        "ǨATA", "JİLENDO", "ÇELEPURİ", "SǨENDE", "ǨODACELVOBAŞE", "ÇKAR", "BİNEXİ",
        "ǮALE", "GEMTİ", "LEMŞİ", "TERMONİ", "P̌AP̌ULİ", "P̌AP̌UNENA", "DAÇXURİ", "FENALA",
        "MEBİRA", "SİNDOMİ", "TUTA", "XAMP̌U", "ŤAǨŤAǨARA", "TİŞİNERİ", "TANURA",
        "Ç̌AǨALA", "YALİ", "ÇİSTİ", "AYİ", "BİYA", "MǮİǨA", "BABA", "UBABELİ", "BAGİ",
        "XEŞİ", "DOXMELİ", "MĞORİNİ", "MOBALAŞE", "DOLAXERİ", "AVLA", "ŤİŞİ", "AHA",
        "ǨONǨORAXİ", "UǮǨOMİLU", "ZEMCİ", "ǮǨOMİLİ", "TURÇANİ", "BAǨLAÇ̌İ", "TORPİ",
        "ǨVARİ", "MOZİNE", "ŤOŤOƷİ", "MPOLO", "OXASURE", "ÇXOMİ", "ǮİPİ", "KAŤO",
        "XAATİ", "ARGUNİ", "VAYYOZİ", "ÇKİMDA", "MEKAÇALONİ", "MANDRE", "BAGENİ",
        "MERZE", "PARXANA", "P̌A", "CEBAZGİNAŞE", "TAZİĞİ", "GOMBARERİ", "BİǨA", "Tİ",
        "TİDVERİ", "MOXOLUN", "REİSİ", "TENİ", "MOÇ̌ǨA", "MANÇ̌URİ", "ZONİ", "GENŤONA",
        "XASİ", "YAMA", "KİMİ", "BERENA", "LULUBERE", "ÇALİMİ", "XENAPA", "ǨRİMA",
        "MONDO", "MA", "Sİ", "ÇKİMDEN", "ÇERE", "P̌EŤLİ", "P̌AP̌AXİ", "MOLE", "KÇE",
        "KUNİ", "XAMİ", "PONǮO", "ƷİƷA", "SAP̌ARİ", "XAŞARİ", "ĞOBER", "P̌OŤRA",
        "MONǨA", "ÇXALURİ", "GERMA", "P̌ANDA", "ŤAŤİ", "SOLAĞANİ", "SİCA", "OXORİ",
        "OXİNİ", "HO", "DİDİ", "OKOMOJONİ", "İÇİLONİ", "USUMİ", "NOĞASİMA", "ŞİLEP̌İ",
        "MORDALE", "MÇİRE", "GOMPANOBA", "ǮİMİNDE", "MTİNİ", "MTİLANA", "BADİ", "DADİ",
        "LACİ", "LACONİ", "NOĞA", "Ç̌EXNİ", "GAYBANA", "ŞURİ", "EZMOCE", "İXİ",
        "KOMOLOBA", "Ç̌AÇ̌A", "ÇEPLA", "ÇERÇİ", "NAKU", "ǨO", "OXORZA", "LAVONİ", "KAŤO",
        "ǨOP̌A", "ĞAÇ̌A", "ĞURA", "UMRİ", "ĞURERİ", "UPARELİ", "PALTOSİ", "NANİ",
        "YAMÇ̌İ", "VALİ", "TANİ", "MİNCİ", "PİCOMA", "XİŞİRİ", "ÇARǨAŤURA", "KÇANA",
        "NÇ̌ELERİ", "KOMOLİ", "XVANİ", "KOMOLOBA", "DULYA", "PAGARA", "MAMA", "Ç̌AǨLA",
        "LAǨİRDE", "ANDERİ", "LAZONA", "LEÇE", "LAZİ", "KANÇA", "TADİ", "ELAXİ",
        "MAGANA", "XAMPA", "ĞERİ", "MZİ", "DOSKİDİNERİ", "TONA", "MİLİ", "FARA",
        "LUǨNA", "ǨURNA", "ǨAYOBONİ", "MURADİ", "XELOBA", "ÇALİMİ", "DİŞǨA", "MAMCALA",
        "TOMA", "PİMBİLİ", "MİSA", "TAMO", "MPALO", "USULİ", "MONTİNA", "NÇ̌ARA",
        "GOLA", "PUPULİ", "PARVİ", "GYULİ", "BURBU", "XAŞALİ", "GVERDİ", "OÇ̌UME",
        "PAĞİ", "RAǨANİ", "DUDİ", "UPİ", "AǮİ", "ONDİ", "MACİDA", "İNİ", "KORİNERİ",
        "ǨANCUBALİ", "OZMONA", "NAİLA", "KALATİ", "ǮANA", "ĞVARİ", "GOKTURU", "ZORİ",
        "GOMÇVERİ", "JİLE", "MURGİ", "ÇUÇKA", "TAVİ", "BULTİ", "KUMULİ", "VERANE",
        "MURUNƷXİ", "OŞKOMONİ", "P̌OLİ", "LOYA", "MAÇXA", "FROXTİ", "NONǮORE",
        "P̌ATARA", "ŞALBA", "MGVANERİ", "CEKTAPERİ", "SAĞANİ", "BURÇ̌ULİ", "PİƷARİ",
        "ŤAVLİ", "MANDOMA", "MǨORİDA", "MEÇANERİ", "ǨAǨALİ", "TANURİ", "ÇKİNAPERİ",
        "ǮUPA", "ARǨELENDO", "SEMTİ", "LİVADİ", "ONŤULE", "MERAĞİ", "MERAǨLİ",
        "NAP̌İRİ", "KVA", "MJALVALİ", "MJALVA", "MESǨVANA", "KYUME", "PAPA", "OSXONE",
        "XVALA", "ŤEYARE", "ÇİÇKU", "ZAMELİ", "ǮARİ", "PURENGİ", "OMŞVELİNA", "MP̌ULA",
        "NCUMORİ", "ǨERǨELİ", "MURECİ", "MǮULİ", "UÇA", "ŤUƷA", "ŤUƷANOBA", "ŤARONİ",
        "PAVRİ", "ǨOROƷXA", "LİLVE", "ƷXUNA", "FARA", "ǨAP̌ETİ", "ZOİ", "BARDİ", "ÇEMİ",
        "CİNAZE", "XİŤİ", "LAǨAŤǨA", "GOǨORONİ", "MSUCİ", "XARBİ", "XOMA", "UNENALE",
        "MİSA", "OROPERİ", "OROPONİ", "ORDO", "MPEJİ", "DOǨANAŞE", "KUZİNA", "ŞVANCALA",
        "SİLİSONİ", "ÇODİNA", "UǨAÇXE", "BİGA", "NOÇ̌İTXE", "Ç̌İTXA", "DİDİCOXO", "ZİŤA",
    ]
    
let meyvepeWords = [
        "MƷXULİ", "ŤANŤA", "UŞKİRİ", "MŤǨURİUŞKİRİ", "BİA", "QOMURİ", "COĞORQOMURİ",
        "BULİ", "MBULİ", "MŤǨURİBULİ", "ǨOLOBULİ", "VİŞNE", "VİŞNA", "ÇABEXURMA",
        "XURMA", "UVA", "ANŤAMA", "LUĞİ", "ƷXİMUNŤURİ", "MUŞMULA", "MJOLİ", "BERǮEULİ",
        "NEŤAİ", "NTXİRİ", "MŤǨURİTXİRİ", "MǮǨO", "P̌̆OZİ", "BİNEXİ", "ǨİVİ", "ARANŽ̆İ",
        "LİMONİ", "MANDALİNA", "PORŤUǨALİ", "ǨREPSİ", "DURĞUNİ", "KÇEDURĞUNİ", "DAŽİǨANDĞU",
        "ANSǨİLİ", "DİNANAŞQURŽENİ", "MŤURİMŞALİ", "ZURMEXİ", "LAZUŤİ", "BARABURA", "BALDURCANİ",
        "ǨAǨA", "QURZENİ", "URZENİ", "COĞORƷANAǨO", "REBU", "QOQORE", "FELİ", "ORE", "LAZURİFELİ",
        "JOSTABERRY", "ǨARP̌UZİ", "ǨAVUNİ", "KİVİ", "MJORATOLİ", "LİMONİ", "ǨANDĞU", "MŤURİǨANDĞU",
        "SKİNDİ", "OMBRİ", "BERǮEULİ", "ANŤAMA", "NǮELA", "LİǨİBA", "ǨAƷXANǨA", "ANƷERA",
        "ƷKİMUTİ", "NƷXİLİMUŤRİ", "NƷZİMUNŤİ", "MUŞİ", "DANDZİǨANDĞU", "URDZENİ", "NEDZİ",
        "MǮU", "MǮǨO", "ŞİNǨA"
    ]
    
let kvincepeWords = [
        "SİFŤ̆ERİ", "ZAĞANOZİ", "MEKOTONİ", "KURİ", "ANǨEşAİNİ", "MAVRAMAŤE", "UÇAŞANǨE",
        "ANǨE", "MCACİ", "MĞU", "OLOLİ", "KYORǨUŞİ", "ǨUǨU", "QURİ", "QVARİ", "QVAROCİ",
        "MÇİKİ", "VASİLİ", "MALUĞE", "OPAMPE", "MǨUDİ", "UÇAMǨUDİ", "OŤRİǨE", "NGOLAKOTUME",
        "KOTUME", "KAKABİ", "ZEMSKU", "ŞUŞANİ", "MACACĞA", "MSİRİDA", "MAÇ̌AP̌ULE", "ǮİP̌ǮİP̌İLİ",
        "KUDELUÇA", "UÇAǨOXǨOXİ", "KRAOLONİ", "ǨUDELİKÇE", "ƷANA", "ÇAİǨİNÇİ", "ǨİNÇİ",
        "MALİMBORİ", "Ç̌URÇ̌ASİCA", "ĞVAMÇ̌İTA", "MŞKİRİ", "MÇ̌URÇ̌̆A", "TİASP̌URA",
        "Ç̌İÇ̌İRİ", "Ç̌İLLİZİ", "P̌URMOLİ", "MÇXUŞP̌URMOLİ", "ǨAXİ", "NGOLAǨAXİ",
        "SİMSİǨOǨARİ", "ǮİMǮİMİ", "TİPİǨİNÇİ", "CİCEĞENİ", "ŞİRA", "ŤOǨOǨORO",
        "ŞİLİDONİ", "DİXAŞİRA", "TİUÇA", "BAĞULYA", "MASP̌İNALE", "ǨİǨİLİBUNKŞİ",
        "ǨUDELİSARİ", "FİYO", "MALAĞUDE", "Ç̌İNǨAMAMJVABULE", "MAǮİǮİLE", "ǨUǨUDA",
        "ĞARĞA", "ǨUǨULİNA", "ZUĞAǨİNÇİ", "MŤǨORİKOTUME", "ǨİǨİLİGİNŽE",
        "NAÇ̌İÇ̌ĞİNERİ", "ǮARİZEMSǨU", "NOĞAŤOROCİ", "ŞANAULİŤOROCİ", "MŤǨORİŤOROCİ",
        "ǨURŽULİ", "BİBİ", "UTKA", "ĞORĞORCİ", "KOTUME", "ǨUŞǨUŞİ"
    ]
    
let skindinapeWords = [
        "ǨAŤU", "COĞORİ", "LAÇ̌İ", "ƷXENİ", "GİRİNİ", "GURUNİ", "SİFŤ̆ERİ", "DADULİǮİ",
        "KORME", "KOTUME", "MAMULİ", "PUCİ", "PİTİNA", "MÇXURİ", "ŤİǨANİ", "ŞORONİ",
        "TXA", "XOCİ", "GENİ", "MOZARİ", "Ç̌UÇ̌ULİ", "ǮİP̌İLİ", "ǨİNÇİ", "KVİNÇİ",
        "MTUİ", "MTUGİ", "ǨVARİ", "ORŤİÇ̌İ", "OŤRİǨE", "LOMİ", "ǮİǮİLA", "ĞECİ",
        "KURİ", "MÇXOMİ", "ÇXOMBİ", "DELPİNA", "DUNÇU", "DUMÇ̌ǨU", "BOBOLA", "BOBOMÇVA",
        "BOMBULA", "ǮİǮİ", "MALAĞURE", "KURDZULİ", "MŤǨAŞKOTUME", "GOLAMAMULİ",
        "ŤRİǨİMAMJVABULE", "ǨARǨALAMŤAXU", "MZESKU"
    ]
    
let laziOputepeWords = [
        "ATİNA", "VİTZE", "ARKABİ", "BATUMİ", "XOPA", "BORÇXA", "RİZE", "ARTVİNİ",
        "PERONTİ", "BUÇA", "ÇXALA", "MAKRETİ", "SUNDURA", "GVARCİ", "SARPİ", "SKİBULİ",
        "KORDELİT", "ǨOPŤ̆ONE", "JGİRYAZENİ", "ǨUŤ̆UNİTİ", "PİLARGET", "MİĞETİ",
        "XARA", "KONTİVA", "Ç̌URÇ̌UVA", "ANDRAVATi", "ÇANETİ", "MZUĞU", "SUMLA",
        "ÇUKULİTİ", "TOROTSİ", "KVANCARİ", "PUTRA", "METİSTİ", "ZURXA", "ZUGDİDİ",
        "ABAŞA", "MARTVİLİ", "MESTİA", "SENAKİ", "ÇHOROTSKU", "TSALENCİHA", "HOBİ",
        "OZURGETİ", "LANÇHUTİ", "ÇOHATAURİ", "KOLHİS", "LAZİKA", "KOLXA", "FASİS",
        "AİA", "LAZİKA", "LAZONA"
    ]
    
let lilvepeWords = [
        "P̌̆RASǨA", "LERİ", "COĞORİLERİ", "NDAĞİǨROMİ", "P̌̆İP̌̆ERİ", "LUQU", "LU",
        "LUİ", "LUĞİ", "ǨAXALA", "SOŤOLİA", "BULEǨİ", "REDİSİ", "BROKOLİ", "TARGAMİ",
        "LOBİA", "FRASULİ", "SOYALOBYA", "XACİAVAǨALOBİA", "NUXUŤ̆Uİ", "İLONİFELİ",
        "ŞUǨA", "LANGAXİAŞUǨA", "ĞALAMSO", "BURĞİ", "PERSENGİ", "LAP̌̆AZA", "ALİMP̌̆O",
        "DİÇ̌ǨİCİ", "NGOLANTXİRİ", "MARKVALA", "GUGULİOŽ̆E", "ǮİǮİLAKUDİ", "MǨYAPUKSİNİ",
        "ǨAVİ", "MSUŤ̆ULYA", "PEP̌̆ERİ", "ǨROMİ", "XACİ", "ǨUMXİ", "FELİ", "ǨASŤ̆ANE",
        "ORE", "DİXAMAKVALİ", "KARTOFİ", "MEROCA", "ĞRAMSO", "MERGYA", "TOMATİSİ",
        "MƷULǨUBURİ", "DİXAUŞKURİ", "İSPANAǨİ", "Ť̆URP̌̆İ"
    ]
    
let bobalapeWords = [
        "KÇEPARPALİ", "CAVURİPARPALİ", "ǨUDELONİPARPALİ", "CAZİPARPALİ", "HENİPARPALİ",
        "MEŤAKSİŞİMUNŤURİ", "ǨUŤUMZUMU", "ǨUXİ", "BUÇ̌İMUNŤURİ", "ǨARǨALAŤAXU",
        "ǮARİBOBOLA", "ĞOǨO", "Ç̌İǨAME", "ŞİVRİ", "ǨİÇ̌AÇ̌İ", "ÇİÇİ", "MAKSİNALE",
        "KSİNACE", "ÇİÇXİLİ", "ƷAXOCİ", "TXİRǮİǮİ", "BOBONÇ̌VA", "DUMÇ̌ǨU", "MAP̌AZULE",
        "XAVANA", "ǨARTOFİBOBOLA", "MǮǨİRİNANA", "BOBOLİA", "BUŤǨUCİ", "MAǮOPXE",
        "MJUJU", "BADOMEİ", "MÇ̌ACİ", "LAYÇ̌İMÇ̌ACİ", "BADİǨAMǨULİ", "MP̌URİ",
        "ǨOĞONO", "MŤİ", "ÇURİMŤİ", "MǮǨİRİ", "ĞAÇ̌ǨA", "MǨORİDA", "BUDİ", "BADARA",
        "İSİNAMǨOLİ", "ǨOLİ", "ǮİĞVELİ", "ǮİǮİ", "MƷANOMÇ̌EPİ", "OYRENCİ", "ĞVAP̌A", "PENǮE"
    ]
    
let cxomepeWords = [
        "KAPÇA", "AZMARİDA", "SŤAVRİŤİ", "BARBONİ", "ǨRAÇ̌A", "GİLARE", "SİPARİ", "LELEMA",
        "LAXO", "LEVREKİ", "LUFERİ", "ǨOFONA", "Ç̌İNAǨOPİ", "KYOTEĞİ", "TRİǮA", "P̌LAŤOZİ",
        "SPARO", "MAVROŞKİNİ", "İŞKİNA", "TRAǨONLİ", "ǨOVİDİ", "DELPİNA", "ZUĞAĞECİ",
        "MUTİǨA", "MUTUİ", "MUNTURİ", "VEŞAP̌İ", "LAÇ̌İÇXOMİ", "COĞORCÇXOMİ", "OKONOZİ",
        "P̌ALAMUTİ", "MURUNA", "ZUTXİ", "FANUSA", "ĞOÇ̌ǨO", "SNAǨİ", "Ç̌İPURA", "SARGANA",
        "ĞVATO", "LOKO", "İNEXİ", "NEXİ", "ĞVANÇKİ", "ǨALMAXA", "MALEBE", "KASNA", "PANǮO",
        "ĞORŽGO", "ŤABALAYÇXOMİ", "ƷXAP̌ALA", "Ç̌AĞANA", "MAXANƷA", "ǨOXLİDİ", "MİDYA",
        "RAPANA", "ĞVANÇ̌İ", "ZUĞAÇURİ"
    ]
    
let xurapeWords = [
        "BURƷXA", "KURİ", "OFİDİ", "ǨAMǮAMİ", "UCİ", "QUCİ", "NENA", "ÇARBİ", "LEŞǨİ",
        "ALİ", "QALİ", "NUǨU", "ÇİMÇİRİ", "ÇİǨO", "NUǨU", "ǨİBİRİ", "XURŤULİ", "XARAYİ",
        "ĞVA", "ÇXİNDİ", "TOLİ", "ǨVA", "ǨOP̌A", "TOMA", "Tİ", "DUDİ", "ÇONÇXİ", "DİRǨU",
        "PANǮALA", "PALANǮA", "MÇU", "GURİ", "ŞKEMBE", "PURPU", "JERĞVİ", "Ť̆EBİ", "Ť̆KEBİ",
        "MUNDİ", "XORƷİ"
    ]
    
let ockomalepeWords = [
        "ǨAPÇA", "GYARİ", "MEVAPERİ", "MJA", "LUPRİNCONİ", "TERMONİ", "ĞOMU", "MİNCİ",
        "XURİNA", "ǨORǨOŤİ", "PAPA", "ǨAPÇONİGYARİ", "ǨAPÇAGEÇ̌VERİ", "GEŤAĞANERİ",
        "MÇ̌ǨUDİ", "PUCİYAĞİ", "LUDUDERİ", "LUNCAXERİ", "XACİMEǨİDERİ"
    ]
    
let tutapeWords = [ "ǮANAğANİ", "ǨUNDURA", "MARŤİ", "AP̌RİLİ", "MAİSİ", "BULVA", "KƷALA", "MARİAŞİNA", "ÇXALVA", "ŤAXVA", "ǮİLVA", "XRİSŤANA" ]





