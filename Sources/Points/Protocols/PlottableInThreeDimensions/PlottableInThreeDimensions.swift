// PlottableInThreeDimensions.swift
// Points
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import NumericProtocols

/// Representing values that can be plotted in three dimensions.
public protocol PlottableInThreeDimensions: PlottableInTwoDimensions {
	
	// MARK: - Creating Instances
	
	/// Creates a new instance with the specified axes.
	///
	/// - parameter x: The X-axis.
	/// - parameter y: The Y-axis.
	/// - parameter z: The Z-axis.
	init(x: Axis, y: Axis, z: Axis)
	
	// MARK: - Instance Properties
	
	/// The value for the Z-axis.
	var z: Axis { get }
}

extension PlottableInThreeDimensions
where Self: Addable, Axis: Addable {
	public static func + (_ lhs: Self, _ rhs: Self) -> Self {
		let x: Axis = lhs.x + rhs.x
		let y: Axis = lhs.y + rhs.y
		let z: Axis = lhs.z + rhs.z
		
		return .init(x: x, y: y, z: z)
	}
}

extension PlottableInThreeDimensions
where Self: Comparable {
	
	// MARK: - Creating Instances
	
	/// Creates a new instance with the specified axes.
	///
	/// - parameter x: The X-axis.
	/// - parameter y: The Y-axis.
	public init(x: Axis, y: Axis) {
		self.init(x: x, y: y, z: 0)
	}
	
	// MARK: - Inspecting Values
	
	/// Returns a boolean value indicating whether this value is farthest than the specified value.
	///
	/// - parameter rhs: Another value to compare.
	/// - returns: A boolean indicating whether this value is farthest than the specified value.
	public func isFarthest(than rhs: Self) -> Bool {
		return self.z > rhs.z
	}
	
	/// Returns a boolean value indicating whether this value is nearest than the specified value.
	///
	/// - parameter rhs: Another value to compare.
	/// - returns: A boolean indicating whether this value is nearest than the specified value.
	public func isNearest(than rhs: Self) -> Bool {
		return self.z < rhs.z
	}
}

extension PlottableInThreeDimensions
where Self: Decodable, Axis: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: PlottableCodingKeys.self)
		
		let x: Axis = try container.decode(Axis.self, forKey: .x)
		let y: Axis = try container.decode(Axis.self, forKey: .y)
		let z: Axis = try container.decode(Axis.self, forKey: .z)
		
		self.init(x: x, y: y, z: z)
	}
}

extension PlottableInThreeDimensions
where Self: Divisible, Axis: Divisible {
	public static func / (_ lhs: Self, _ rhs: Self) -> Self {
		let x: Axis = lhs.x / rhs.x
		let y: Axis = lhs.y / rhs.y
		let z: Axis = lhs.z / rhs.z
		
		return .init(x: x, y: y, z: z)
	}
	
	public static func % (_ lhs: Self, _ rhs: Self) -> Self {
		let x: Axis = lhs.x % rhs.x
		let y: Axis = lhs.y % rhs.y
		let z: Axis = lhs.z % rhs.z
		
		return .init(x: x, y: y, z: z)
	}
}

extension PlottableInThreeDimensions
where Self: Encodable, Axis: Encodable {
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: PlottableCodingKeys.self)
		
		try container.encode(self.x, forKey: .x)
		try container.encode(self.y, forKey: .y)
		try container.encode(self.z, forKey: .z)
	}
}

extension PlottableInThreeDimensions
where Self: Equatable {
	public static func == (_ lhs: Self, _ rhs: Self) -> Bool {
		return lhs.x == rhs.x
			&& lhs.y == rhs.y
			&& lhs.z == rhs.z
	}
}

extension PlottableInThreeDimensions
where Self: Multipliable, Axis: Multipliable {
	public static func * (_ lhs: Self, _ rhs: Self) -> Self {
		let x: Axis = lhs.x * rhs.x
		let y: Axis = lhs.y * rhs.y
		let z: Axis = lhs.z * rhs.z
		
		return .init(x: x, y: y, z: z)
	}
}

extension PlottableInThreeDimensions
where Self: Negateable, Axis: Negateable {
	public prefix static func - (_ operand: Self) -> Self {
		let x: Axis = operand.x.negating()
		let y: Axis = operand.y.negating()
		let z: Axis = operand.z.negating()
		
		return .init(x: x, y: y, z: z)
	}
}

extension PlottableInThreeDimensions
where Self: RepresentableByZero, Axis: RepresentableByZero {
	public static var zero: Self {
		return .init(x: .zero, y: .zero, z: .zero)
	}
}

extension PlottableInThreeDimensions
where Self: Strideable {
	public typealias Stride = Axis
	
	public func advanced(by n: Axis) -> Self {
		let x: Axis = self.x + n
		let y: Axis = self.y + n
		let z: Axis = self.z + n
		
		return .init(x: x, y: y, z: z)
	}
	
	public func distance(to other: Self) -> Axis {
		let x: Axis = other.x - self.x
		let y: Axis = other.y - self.y
		let z: Axis = other.z - self.z
		
		return (x * x + y * y + z * z).squareRoot()
	}
}

extension PlottableInThreeDimensions
where Self: Subtractable, Axis: Subtractable {
	public static func - (_ lhs: Self, _ rhs: Self) -> Self {
		let x: Axis = lhs.x - rhs.x
		let y: Axis = lhs.y - rhs.y
		let z: Axis = lhs.z - rhs.z
		
		return .init(x: x, y: y, z: z)
	}
}
