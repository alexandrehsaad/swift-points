// PlottableInTwoDimensions.swift
// Points
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import NumericProtocols

/// Representing values that can be plotted in two dimensions.
public protocol PlottableInTwoDimensions {
	/// The axis.
	associatedtype Axis
	where Axis: BinaryFloatingPoint
	
	// MARK: - Creating Instances
	
	/// Creates a new instance with the specified axes.
	///
	/// - parameter x: The X-axis.
	/// - parameter y: The Y-axis.
	init(x: Axis, y: Axis)
	
	// MARK: - Instance Properties
	
	/// The value for the X-axis.
	var x: Axis { get }
	
	/// The value for the Y-axis.
	var y: Axis { get }
}

extension PlottableInTwoDimensions
where Self: Addable, Axis: Addable {
	public static func + (_ lhs: Self, _ rhs: Self) -> Self {
		let x: Axis = lhs.x + rhs.x
		let y: Axis = lhs.y + rhs.y
		
		return .init(x: x, y: y)
	}
}

extension PlottableInTwoDimensions
where Self: Comparable {
	
	// MARK: - Inspecting Values
	
	/// Returns a boolean value indicating whether this value is leftest than the specified value.
	///
	/// - parameter rhs: Another value to compare.
	/// - returns: A boolean indicating whether this value is leftest than the specified value.
	public func isLeftest(than rhs: Self) -> Bool {
		return self.x < rhs.x
	}
	
	/// Returns a boolean value indicating whether this value is rightest than the specified value.
	///
	/// - parameter rhs: Another value to compare.
	/// - returns: A boolean indicating whether this value is rightest than the specified value.
	public func isRightest(than rhs: Self) -> Bool {
		return self.x > rhs.x
	}
	
	/// Returns a boolean value indicating whether this value is highest than the specified value.
	///
	/// - parameter rhs: Another value to compare.
	/// - returns: A boolean indicating whether this value is highest than the specified value.
	public func isHighest(than rhs: Self) -> Bool {
		return self.y > rhs.y
	}
	
	/// Returns a boolean value indicating whether this value is lowest than the specified value.
	///
	/// - parameter rhs: Another value to compare.
	/// - returns: A boolean indicating whether this value is lowest than the specified value.
	public func isLowest(than rhs: Self) -> Bool {
		return self.y < rhs.y
	}
}

extension PlottableInTwoDimensions
where Self: Decodable, Axis: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: PlottableCodingKeys.self)
		
		let x: Axis = try container.decode(Axis.self, forKey: .x)
		let y: Axis = try container.decode(Axis.self, forKey: .y)
		
		self.init(x: x, y: y)
	}
}

extension PlottableInTwoDimensions
where Self: Divisible, Axis: Divisible {
	public static func / (_ lhs: Self, _ rhs: Self) -> Self {
		let x: Axis = lhs.x / rhs.x
		let y: Axis = lhs.y / rhs.y
		
		return .init(x: x, y: y)
	}
	
	public static func % (_ lhs: Self, _ rhs: Self) -> Self {
		let x: Axis = lhs.x % rhs.x
		let y: Axis = lhs.y % rhs.y
		
		return .init(x: x, y: y)
	}
}

extension PlottableInTwoDimensions
where Self: Encodable, Axis: Encodable {
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: PlottableCodingKeys.self)
		
		try container.encode(self.x, forKey: .x)
		try container.encode(self.y, forKey: .y)
	}
}

extension PlottableInTwoDimensions
where Self: Equatable {
	public static func == (_ lhs: Self, _ rhs: Self) -> Bool {
		return lhs.x == rhs.x
			&& lhs.y == rhs.y
	}
}

extension PlottableInTwoDimensions
where Self: Multipliable, Axis: Multipliable {
	public static func * (_ lhs: Self, _ rhs: Self) -> Self {
		let x: Axis = lhs.x * rhs.x
		let y: Axis = lhs.y * rhs.y
		
		return .init(x: x, y: y)
	}
}

extension PlottableInTwoDimensions
where Self: Negateable, Axis: Negateable {
	public prefix static func - (_ operand: Self) -> Self {
		let x: Axis = operand.x.negating()
		let y: Axis = operand.y.negating()
		
		return .init(x: x, y: y)
	}
}

extension PlottableInTwoDimensions
where Self: RepresentableByZero, Axis: RepresentableByZero {
	public static var zero: Self {
		return .init(x: .zero, y: .zero)
	}
}

extension PlottableInTwoDimensions
where Self: Strideable {
	public typealias Stride = Axis
	
	public func advanced(by n: Axis) -> Self {
		let x: Axis = self.x + n
		let y: Axis = self.y + n
		
		return .init(x: x, y: y)
	}
	
	public func distance(to other: Self) -> Axis {
		let x: Axis = other.x - self.x
		let y: Axis = other.y - self.y
		
		return (x * x + y * y).squareRoot()
	}
}

extension PlottableInTwoDimensions
where Self: Subtractable, Axis: Subtractable {
	public static func - (_ lhs: Self, _ rhs: Self) -> Self {
		let x: Axis = lhs.x - rhs.x
		let y: Axis = lhs.y - rhs.y
		
		return .init(x: x, y: y)
	}
}
