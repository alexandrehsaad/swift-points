// Point.swift
// Points
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// A structure representing a point in 3-dimension.
public struct Point {
	
	public typealias Axis = Double
	
	// MARK: - Creating Instances
	
	public init(x: Axis, y: Axis, z: Axis) {
		self.x = x
		self.y = y
		self.z = z
	}
	
	// MARK: - Instance Properties
	
	public let x: Axis
	
	public let y: Axis
	
	public let z: Axis
}
