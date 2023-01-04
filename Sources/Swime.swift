import Foundation

public struct Swime {
    /// File data
    let data: Data

    ///  A static method to get the `MimeType` that matches the given file data
    ///
    ///  - returns: Optional<MimeType>
    static public func mimeType(data: Data) -> MimeType? {
        return mimeType(swime: Swime(data: data))
    }

    ///  A static method to get the `MimeType` that matches the given bytes
    ///
    ///  - returns: Optional<MimeType>
    static public func mimeType(bytes: [UInt8]) -> MimeType? {
        return mimeType(swime: Swime(bytes: bytes))
    }

    ///  A static method to get the `MimeType` that matches the given url
    ///
    ///  - returns: Optional<MimeType>
    static public func mimeType(url: URL) throws -> MimeType? {
        return mimeType(swime: try Swime(url: url))
    }

    ///  Get the `MimeType` that matches the given `Swime` instance
    ///
    ///  - returns: Optional<MimeType>
    static public func mimeType(swime: Swime) -> MimeType? {
        let bytes = swime.readBytes(count: min(swime.data.count, 262))

        for mime in MimeType.all {
            if mime.matches(bytes: bytes, swime: swime) {
                return mime
            }
        }

        return nil
    }

    public init(url: URL) throws {
        guard let srcStream = InputStream(url: url) else {
            throw SwimeInvalidURLError(url: url)
        }
        srcStream.open()
        defer { srcStream.close() }
        guard srcStream.hasBytesAvailable else {
            throw SwimeInvalidURLError(url: url)
        }
        let maxBytes = 1256
        guard let buffer = malloc(maxBytes) else {
            throw SwimeInvalidURLError(url: url)
        }
        defer { free(buffer) }
        let readBytes = srcStream.read(buffer, maxLength: maxBytes - 1)
        if readBytes < 0 {
            throw SwimeInvalidURLError(url: url)
        }
        let data = Data(bytes: buffer, count: min(readBytes, 1255))
        self.data = data
    }

    public init(data: Data) {
        self.data = data
    }

    public init(bytes: [UInt8]) {
        self.init(data: Data(bytes))
    }

    ///  Read bytes from file data
    ///
    ///  - parameter count: Number of bytes to be read
    ///
    ///  - returns: Bytes represented with `[UInt8]`
    internal func readBytes(count: Int) -> [UInt8] {
        var bytes = [UInt8](repeating: 0, count: count)

        data.copyBytes(to: &bytes, count: count)

        return bytes
    }
}
