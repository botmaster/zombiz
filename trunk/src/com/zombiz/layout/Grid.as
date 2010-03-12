/*
  Copyright (c) 2009, La Haute Société (http://www.lahautesociete.com).
  All rights reserved.
*/

package com.zombiz.layout 
{
	
	import com.zombiz.layout.ALayout;
	import flash.geom.Point;
	


	/**
	 * Layout Grid.
	 * @author Pascal Achard
	 */
	
	public class Grid extends ALayout
	{
		
		// PROPERTIES
		// ----------------------------------------
		
		private var _x:Number;							// La position en x du layout.
		private var _y:Number;							// La position en y du layout.
		private var _xSpacer:Number;					// L'espacement en x.
		private var _ySpacer:Number;					// L'espacement en y.
		private var _snapToPixel:Boolean;				// On calle au pixel ?
		private var _nbColomns:int;						// Le nombre de colonnes, ou de lignes si vertical.
		private var _isVertical:Boolean;				// Si true, on empile des colonnes, si false on empile des lignes.
		private var _index:int;							// On index les points.
		
		// GETTERS - SETTERS
		// ----------------------------------------
			
		// CONSTRUCTOR
		// ----------------------------------------
		public function Grid(pX:Number, pY:Number, pXSpacer:Number, pYSpacer:Number, pColumns:uint, pIsVertical:Boolean = false, pSnapToPixel:Boolean = true) 
		{
			super();
			_x = pX;
			_y = pY;
			_xSpacer = pXSpacer;
			_ySpacer = pYSpacer;
			_nbColomns = pColumns;
			_snapToPixel = pSnapToPixel;
			_isVertical = pIsVertical;
			_index = 0;
			
		}
		
		// METHODS
		// ----------------------------------------
		override public function getNextPoint():Point 
		{
			var point:Point = new Point();
			var row:int;
			var col:int;
			if (_isVertical)
			{
				
			}else
			{
				row = Math.floor(_index / _nbColomns);
				col = _index % _nbColomns;
				point.x = _x + (col * _xSpacer);
				point.y = _y + (row * _ySpacer);
				
				++ _index;				
			}
			
			return point;
		}
		
		// EVENTS HANDLERS
		// ----------------------------------------
		
	}

}