/*
  Copyright (c) 2009, La Haute Société (http://www.lahautesociete.com).
  All rights reserved.
*/

package com.zombiz.layout.layoutpoints
{
	
	import com.zombiz.layout.layoutpoints.BasicLayoutPoint;
	import flash.display.DisplayObject;
	


	/**
	 * ...
	 * @author Pascal Achard
	 */
	
	public class GridLayoutPoint extends BasicLayoutPoint
	{
		
		// PROPERTIES
		// ----------------------------------------
		private var _row:int;
		private var _col:int;
		
		// GETTERS - SETTERS
		// ----------------------------------------
		public function get row():int { return _row; }
		
		public function get col():int { return _col; }
		
		public function set row(value:int):void 
		{
			_row = value;
		}
		
		public function set col(value:int):void 
		{
			_col = value;
		}
			
		// CONSTRUCTOR
		// ----------------------------------------
		public function GridLayoutPoint(pDisplayObject:DisplayObject = null, pX:Number = 0, pY:Number = 0, pRotation:Number = 0, pRow:int = -1, pCol:int = -1) 
		{
			super(pDisplayObject, pX, pY, pRotation);
			
			_row = pRow;
			_col = pCol;
		}
		
		// METHODS
		// ----------------------------------------
		
		// EVENTS HANDLERS
		// ----------------------------------------
		
	}

}