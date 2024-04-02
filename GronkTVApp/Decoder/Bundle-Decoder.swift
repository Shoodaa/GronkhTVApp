//
//  Bundle-Decoder.swift
//  GronkTVApp
//
//  Created by Steven Hübner on 21.03.24.
//

import Foundation

//extension Bundle {
//    func decode<T: Decodable>(_ url: String) -> T {
//        guard let data = try? Data(from: url) else {
//            
//        }
//        guard let data = try? Data(contentsOf: url) else {
//            fatalError("failed to load \(file) from bundle.")
//        }
//        
//        let decoder = JSONDecoder()
////        let formatter = DateFormatter()
////        formatter.dateFormat = "y-MM-dd"
////        decoder.dateDecodingStrategy = .formatted(formatter)
//        
//        guard let loaded = try? decoder.decode(T.self, from: data) else {
//            fatalError("failed to decode \(file) from bundle.")
//        }
//        
//        return loaded
//    }
//}

extension Bundle {
    func asyncFetchAndDecode<T: Decodable>(_ urlString: String) async -> T {
        
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(T.self, from: data) {
                return decodedResponse
            }
            
        } catch {
            fatalError("Invalid data")
        }
        fatalError("Something went wrong")
    }
}
