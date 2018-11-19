//
//  JSONRepresentationBuilder.swift
//  RepresentationKit
//
//  Created by Georges Boumis on 20/6/2016.
//
//  Licensed to the Apache Software Foundation (ASF) under one
//  or more contributor license agreements.  See the NOTICE file
//  distributed with this work for additional information
//  regarding copyright ownership.  The ASF licenses this file
//  to you under the Apache License, Version 2.0 (the
//  "License"); you may not use this file except in compliance
//  with the License.  You may obtain a copy of the License at
//  
//    http://www.apache.org/licenses/LICENSE-2.0
//  
//  Unless required by applicable law or agreed to in writing,
//  software distributed under the License is distributed on an
//  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
//  KIND, either express or implied.  See the License for the
//  specific language governing permissions and limitations
//  under the License.
//

import Foundation

/// The conforming class can be represented as a JSON string
final public class JSONRepresentationBuilder: JSONRepresentation {
	final private let builder: DictionaryRepresentationBuilder
    final public var string: String {
        return self.json
    }

	final public var dictionary: [String : Any] {
		return self.builder.dictionary
	}

	public convenience init() {
		self.init(dictionary: [:])
	}

	public init(dictionary: [String : Any]) {
		self.builder = DictionaryRepresentationBuilder(dictionary:  dictionary)
	}

	private init(builder: DictionaryRepresentationBuilder) {
		self.builder = builder
	}

	final public func with<Key,Value>(key: Key, value: Value) -> Representation where Key: LosslessStringConvertible & Hashable {
        let dictRep: DictionaryRepresentationBuilder = self.builder.with(key: key, value: value)
        return JSONRepresentationBuilder(builder: dictRep)
	}
}
