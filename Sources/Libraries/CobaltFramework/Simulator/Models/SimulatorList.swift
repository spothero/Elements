// Copyright © 2020 SpotHero, Inc. All rights reserved.

struct SimulatorList: Codable {
    public enum CodingKeys: String, CodingKey {
        case devices
        case devicePairs = "pairs"
        case deviceTypes = "devicetypes"
        case runtimes
    }
    
    let devices: [String: [SimulatorDevice]]
    let deviceTypes: [SimulatorDeviceType]
    let devicePairs: [String: SimulatorDevicePair]
    let runtimes: [SimulatorRuntime]
}
