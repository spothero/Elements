// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import Lumberjack
import Yams

class YamlDeserializer {
    static let shared = YamlDeserializer()
    
    func deserialize<T>(_ text: String) -> T? where T: Decodable {
        do {
            return try YAMLDecoder().decode(T.self, from: text)
        } catch {
            Lumberjack.shared.report(error)
            return nil
        }
    }
}
