//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Marat Fakhrizhanov on 28.09.2024.
//

import Foundation

//extension Bundle { // для большинства проектов
    
//    func decode<T: Codable>(_ file: String) -> T {
//        guard let url = url(forResource: file, withExtension: nil) else { fatalError("Failed to locate \(file) in bundle.")}
//        
//        guard let data = try? Data(contentsOf: url) else { fatalError("Failed to loud \(file) from bundle.")}
//        
//        let decoder = JSONDecoder()
//        
//        do {
//            return try decoder.decode(T.self, from: data)
//        } catch DecodingError.keyNotFound(let key, let context) {
//                fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue) - \(context.debugDescription)")
//        } catch DecodingError.typeMismatch(_, let context) {
//            fatalError("Failed to decode \(file) from bundle due to type mismatch - \(context.debugDescription)")
//        } catch DecodingError.valueNotFound(let type, let context) {
//            fatalError("Failed to decode \(file) from bundle due to missing \(type) value - \(context.debugDescription)")
//        } catch DecodingError.dataCorrupted(_) {
//            fatalError("Failed to decode \(file) from bundle becouse it appears to be invalid JSON!")
//        } catch {
//            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
//        }
//    }
//}


//для текущего проекта
extension Bundle {
    
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = url(forResource: file, withExtension: nil) else { fatalError("Failed to locate \(file) in bundle.")}
        
        guard let data = try? Data(contentsOf: url) else { fatalError("Failed to loud \(file) from bundle.")}
        
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else { fatalError("Failed to decode \(file) from bundle.")}
        
        return loaded
        
    }
}

