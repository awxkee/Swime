//
//  File.swift
//  
//
//  Created by Radzivon Bartoshyk on 01/09/2023.
//

import Foundation

struct ZIPHeader {
    let entries: [String]
}

class ZIPHeaderParser {
    func parseZIPHeader(data: Data) -> ZIPHeader? {
        // Check for the ZIP file signature
        let zipSignature: [UInt8] = [0x50, 0x4B, 0x03, 0x04]
        guard data.count >= 4, data[0..<4] == Data(zipSignature) else {
            return nil
        }

        // Read the central directory header offset (12 bytes after the signature)
        let centralDirOffset = data.subdata(in: 16..<20).withUnsafeBytes {
            $0.load(as: UInt32.self)
        }

        // Read the number of entries in the central directory (18 bytes after the signature)
        let numEntries = data.subdata(in: 10..<12).withUnsafeBytes {
            $0.load(as: UInt16.self)
        }

        // Parse central directory entries
        var entriesNames: [String] = []
        var offset = Int(centralDirOffset)
        for _ in 0..<numEntries {
            // Check for the central directory header signature
            let centralDirHeaderSignature: [UInt8] = [0x50, 0x4B, 0x01, 0x02]
            guard data.count >= offset + 4, data[offset..<offset+4] == Data(centralDirHeaderSignature) else {
                return nil
            }

            // Read filename length (28 bytes after the central directory header signature)
            let filenameLength = Int(data.subdata(in: offset + 28..<offset + 30).withUnsafeBytes {
                $0.load(as: UInt16.self)
            })

            // Read filename (46 bytes after the central directory header signature)
            let filenameData = data.subdata(in: offset + 46..<offset + 46 + filenameLength)
            if let filename = String(data: filenameData, encoding: .utf8) {
                entriesNames.append(filename)
            }

            // Move to the next central directory entry
            offset += 46 + filenameLength + 20
        }

        return ZIPHeader(entries: entriesNames)
    }
}
