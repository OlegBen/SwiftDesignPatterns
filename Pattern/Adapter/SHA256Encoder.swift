//
//  SHA256Encoder.swift
//  Pattern
//
//  Created by Олег on 12.09.2021.
//  Copyright © 2021 Oleg Ben. All rights reserved.
//

import Foundation
import CommonCrypto

// MARK: SHA256Encoder
/// Создаем вид библиотеки, которая принимает данные только в виде Data
class SHA256Encoder {
    func encode(data: Data) -> String {
        /// #define CC_SHA256_DIGEST_LENGTH     32
        /// Creates an array of unsigned 8 bit integers that contains 32 zeros
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))

        /// CC_SHA256 performs digest calculation and places the result in the caller-supplied buffer for digest (md)
        /// Takes the strData referenced value (const unsigned char *d) and hashes it into a reference to the digest parameter.
        _ = data.withUnsafeBytes {
            CC_SHA256($0.baseAddress, UInt32(data.count), &digest)
        }

        var sha256String = ""
        /// Unpack each byte in the digest array and add them to the sha256String
        for byte in digest {
            sha256String += String(format:"%02x", UInt8(byte))
        }
        print("sha256: \(sha256String)")
        return sha256String
    }
}
