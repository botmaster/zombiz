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
	
	public class FlowLayoutPoint extends BasicLayoutPoint
	{
		
		// PROPERTIES
		// ----------------------------------------
		protected static var _maxWidth:Number = 0 ;
		protected static var _maxHeight:Number = 0 ;
		
		// GETTERS - SETTERS
		// ----------------------------------------
		static public function get maxWidth():Number { return _maxWidth; }
		
		static public function get maxHeight():Number { return _maxHeight; }
			
		// CONSTRUCTOR
		// ----------------------------------------
		public function FlowLayoutPoint(pDisplayObject:DisplayObject, pX:Number = 0, pY:Number = 0, pRotation:Number = 0) 
		{
			super(pDisplayObject, pX, pY, pRotation);
			_maxWidth = (_maxWidth < pDisplayObject.width) ? pDisplayObject.width : _maxWidth ;
			_maxHeight = (_maxHeight < pDisplayObject.height) ? pDisplayObject.height : _maxHeight ;
		}
		
		
		
		// METHODS
		// ----------------------------------------
		
		// EVENTS HANDLERS
		// ----------------------------------------
		
	}

}