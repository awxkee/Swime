//
//  File.swift
//  
//
//  Created by Radzivon Bartoshyk on 01/09/2023.
//

import Foundation

/// List of type shorthands
/// with this enum we can check mime type with addition of swift type checker
/// ```
/// let swime = Swime(data: data)
/// swime.type
/// ```
public enum FileType {
    case aac
    case amr
    case ar
    case avi
    case avif
    case azw3
    case bmp
    case bz2
    case cab
    case cr2
    case crx
    case deb
    case docx
    case dmg
    case eot
    case epub
    case exe
    case flac
    case flif
    case flv
    case gif
    case gz
    case ico
    case jpg
    case jxl
    case djvu
    case fb2
    case xml
    case mobi
    case jxr
    case lz
    case m4a
    case m4v
    case mid
    case mkv
    case mov
    case mp3
    case mp4
    case mpg
    case msi
    case mxf
    case nes
    case ogg
    case opus
    case otf
    case pdf
    case png
    case pptx
    case ps
    case psd
    case rar
    case rpm
    case rtf
    case sevenZ // 7z, Swift does not let us define enum that starts with a digit
    case sqlite
    case swf
    case tar
    case tif
    case ttf
    case wav
    case webm
    case webp
    case wmv
    case woff
    case woff2
    case xpi
    case xz
    case z
    case zip
    case applicationHeic
    case heic
    case heif
    case zst
    case svg
    case xlsx
}
