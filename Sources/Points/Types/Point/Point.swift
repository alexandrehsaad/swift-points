// Point.swift
// Points
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// A structure representing a point in 3-dimension.
public struct Point {
	
	// MARK: - Creating Instances
	
	public init(x: Double, y: Double, z: Double) {
		self.x = x
		self.y = y
		self.z = z
	}
	
	// MARK: - Instance Properties
	
	public let x: Double
	
	public let y: Double
	
	public let z: Double
}
