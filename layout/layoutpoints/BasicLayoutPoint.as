/*
  Copyright (c) 2009, La Haute Société (http://www.lahautesociete.com).
  All rights reserved.
*/

package com.zombiz.layout.layoutpoints
{
	
	import flash.display.DisplayObject;
	


	/**
	 * ...
	 * @author Pascal Achard
	 */
	
	public class BasicLayoutPoint implements ILayoutPoint
	{
		
		
		// PROPERTIES
		// ----------------------------------------
		private var _displayObject:DisplayObject;
		private var _x:Number;
		private var _y:Number;
		private var _rotation:Number;
		
		// GETTERS - SETTERS
		// ----------------------------------------
		public function get x():Number
		{
			return _x;
		}
		
		public function get y():Number
		{
			return _y;
		}
		
		public function get rotation():Number
		{
			return _rotation;
		}
		
		public function get displayObject():DisplayObject
		{
			return _displayObject;
		}
		
		public function set displayObject(value:DisplayObject):void 
		{
			_displayObject = value;
		}
		
		public function set x(value:Number):void 
		{
			_x = value;
		}
		
		public function set y(value:Number):void 
		{
			_y = value;
		}
		
		public function set rotation(value:Number):void 
		{
			_rotation = value;
		}
		
		
		// CONSTRUCTOR
		// ----------------------------------------
		public function BasicLayoutPoint(pDisplayObject:DisplayObject, pX:Number = 0, pY:Number = 0, pRotation:Number = 0) 
		{
			super();
			
			_displayObject	= pDisplayObject;
			_x 				= pX;
			_y 				= pY;
			_rotation 		= pRotation;
		}
		
		// METHODS DE L'INTERFACE
		// ----------------------------------------		
		
		
		// METHODS
		// ----------------------------------------
		
		// EVENTS HANDLERS
		// ----------------------------------------
		
	}

}