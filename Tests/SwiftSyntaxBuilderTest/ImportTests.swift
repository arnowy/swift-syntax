import XCTest
import SwiftSyntax

import SwiftSyntaxBuilder

final class ImportTests: XCTestCase {
  func testImport() {
    let leadingTrivia = Trivia.garbageText("␣")
    let identifier = SyntaxFactory.makeIdentifier("SwiftSyntax")

    let importDecl = ImportDecl(attributes: nil,
                                modifiers: nil,
                                importTok: Tokens.import,
                                importKind: nil,
                                path: AccessPath([AccessPathComponent(name: identifier, trailingDot: nil)]))

    let syntax = importDecl.buildDecl(format: Format(), leadingTrivia: leadingTrivia)

    var text = ""
    syntax.write(to: &text)

    XCTAssertEqual(text, "␣import SwiftSyntax")
  }
}
