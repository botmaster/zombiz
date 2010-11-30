/*
  Copyright (c) 2009, La Haute Société (http://www.lahautesociete.com).
  All rights reserved.
*/

package com.zombiz.layout.layouts 
{
	
	import com.zombiz.layout.layoutpoints.GridLayoutPoint;
	import com.zombiz.layout.layoutpoints.ILayoutPoint;
	import com.zombiz.layout.layouts.ALayout;
	import flash.display.DisplayObject;
	


	/**
	 * ...
	 * @author Pascal Achard
	 */
	
	public class Grid extends ALayout
	{
		
		// PROPERTIES
		// ----------------------------------------
		private var _x:Number;							// La position en x du layout.
		private var _y:Number;							// La position en y du layout.
		private var _colWidth:Number;					// L'espacement en x.
		private var _rowHeigh:Number;					// L'espacement en y.
		private var _snapToPixel:Boolean;				// On calle au pixel ?
		private var _nbColomns:int;						// Le nombre de colonnes.
		private var _nbRow:int;							// Le nombre de ligne.
		private var _isVertical:Boolean;				// Si true, on empile des colonnes, si false on empile des lignes.
		private var _index:int;
		private var _maxPoints:int;
		
		// GETTERS - SETTERS
		// ----------------------------------------
			
		// CONSTRUCTOR
		// ----------------------------------------
		public function Grid(pX:Number, pY:Number, pColWidth:Number, pRowHeigh:Number, pNbColumns:uint, pNbRows:uint, pIsVertical:Boolean = false, pSnapToPixel:Boolean = true) 
		{
			super();
			_x = pX;
			_y = pY;
			_colWidth = pColWidth;
			_rowHeigh = pRowHeigh;
			_nbColomns = pNbColumns;
			_nbRow = pNbRows;
			_snapToPixel = pSnapToPixel;
			_isVertical = pIsVertical;
			_index = 0;
			
			_maxPoints = pNbColumns * pNbRows;
			
			buildGrid();
		}
		
		// METHODS
		// ----------------------------------------
		
		protected function buildGrid():void
		{
			
			var layoutPoint:GridLayoutPoint = new GridLayoutPoint();
			var row:int;
			var col:int;
			
			for (var i:int = 0; i < _maxPoints; i++) 
			{
				layoutPoint = new GridLayoutPoint();
				row = Math.floor(i / _nbColomns);
				col = i % _nbColomns;
				
				layoutPoint.col = col;
				layoutPoint.x = _x + (col * _colWidth);
				layoutPoint.y = _y + (row * _rowHeigh);
				layoutPoint.row = row;
				
				_addLayoutPoint(layoutPoint);
			}
		}
		
		override public function addToLayout(pDisplayItem:DisplayObject):void 
		{
			var point:GridLayoutPoint = _layoutPointsList[_index];
			
			if (point)
			{
				point.displayObject = pDisplayItem;
				_moveToCoord();
			}
			
			
			_index ++;
		}
		
		// EVENTS HANDLERS
		// ----------------------------------------
		
	}

}