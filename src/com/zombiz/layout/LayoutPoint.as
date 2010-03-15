/*
 * ZOMBIZ ActionScript 3 Framework
 * 
 *                     _     _     
 *  _______  _ __ ___ | |__ (_)____
 * |_  / _ \| '_ ` _ \| '_ \| |_  /
 *  / / (_) | | | | | | |_) | |/ / 
 * /___\___/|_| |_| |_|_.__/|_/___|
 * 
 *
 * Licensed under the MIT License
 * 	
 * Copyright (c) 2010 La Haute Société
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

package com.zombiz.layout
{
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author Pascal Achard
	 */
	
	public class LayoutPoint 
	{
		
		// PROPERTIES
		// ----------------------------------------
		private var _displayItem:DisplayObject;
		private var _col:int;
		private var _row:int;
		private var _x:int;
		private var _y:int;
		
		// GETTERS - SETTERS
		// ----------------------------------------
		public function get displayItem():DisplayObject { return _displayItem; }
		
		public function set displayItem(value:DisplayObject):void 
		{
			_displayItem = value;
		}
		
		public function get col():int { return _col; }
		
		public function set col(value:int):void 
		{
			_col = value;
		}
		
		public function get row():int { return _row; }
		
		public function set row(value:int):void 
		{
			_row = value;
		}
		
		public function get x():int { return _x; }
		
		public function set x(value:int):void 
		{
			_x = value;
		}
		
		public function get y():int { return _y; }
		
		public function set y(value:int):void 
		{
			_y = value;
		}
		
		
			
		// CONSTRUCTOR
		// ----------------------------------------
		public function LayoutPoint(pItem:DisplayObject = null, pCol:int = -1, pRow:int = -1, pX:int = 0, pY:int = 0 ) 
		{
			_displayItem 	= pItem;
			_col 			= pRow;
			_row 			= pRow;
			_x 				= pX;
			_y 				= pY;
		}
		
	}
	
}