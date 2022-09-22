//
//  AttributedStringExperimentsTests.swift
//  AttributedStringExperimentsTests
//
//  Created by Morten Bek Ditlevsen on 18/09/2022.
//

import XCTest
import AttributedStringExperiments

final class AttributedStringExperimentsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        var str = AttributedStringExperiments.AttributedString("Hello, world!")
        str.setAttributes(AttributedStringExperiments.AttributeContainer([.link : URL(string: "https://hello.world")!, .strokeColor: UIColor.red]))
        print("Input", str)
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let data = try encoder.encode(str)
        let strData = String(data: data, encoding: .utf8)
        print("Encoded", strData!)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let str2 = try decoder.decode(AttributedStringExperiments.AttributedString.self, from: data)
        print("Decoded", str2)
    }
}
