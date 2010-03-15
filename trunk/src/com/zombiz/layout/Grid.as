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
	
	import com.zombiz.layout.ALayout;
	import flash.geom.Point;
	


	/**
	 * Layout Grid.
	 * @author Pascal Achard
	 */
	
	 //TODO: Mettre en place le snapToPixel.
	 
	public class Grid extends ALayout
	{
		
		// PROPERTIES
		// ----------------------------------------
		
		private var _x:Number;							// La position en x du layout.
		private var _y:Number;							// La position en y du layout.
		private var _colWidth:Number;					// L'espacement en x.
		private var _rowHeigh:Number;					// L'espacement en y.
		private var _snapToPixel:Boolean;				// On calle au pixel ?
		private var _nbColomns:int;						// Le nombre de colonnes, ou de lignes si vertical.
		private var _isVertical:Boolean;				// Si true, on empile des colonnes, si false on empile des lignes.
		private var _index:int;							// On index les points.
		
		// GETTERS - SETTERS
		// ----------------------------------------
			
		// CONSTRUCTOR
		// ----------------------------------------
		public function Grid(pX:Number, pY:Number, pColWidth:Number, pRowHeigh:Number, pNbColumns:uint, pIsVertical:Boolean = false, pSnapToPixel:Boolean = true) 
		{
			super();
			_x = pX;
			_y = pY;
			_colWidth = pColWidth;
			_rowHeigh = pRowHeigh;
			_nbColomns = pNbColumns;
			_snapToPixel = pSnapToPixel;
			_isVertical = pIsVertical;
			_index = 0;
			
		}
		
		// METHODS
		// ----------------------------------------
		override public function getNextPoint():LayoutPoint 
		{
			var layoutPoint:LayoutPoint = new LayoutPoint();
			var row:int;
			var col:int;
			if (_isVertical)
			{
				col = Math.floor(_index / _nbColomns);
				row = _index % _nbColomns;
				layoutPoint.x = _x + (col * _colWidth);
				layoutPoint.y = _y + (row * _rowHeigh);
				
			}else
			{
				row = Math.floor(_index / _nbColomns);
				col = _index % _nbColomns;
				layoutPoint.x = _x + (col * _colWidth);
				layoutPoint.y = _y + (row * _rowHeigh);
			}
			
			layoutPoint.col = col;
			layoutPoint.row = row;
			
			++ _index;	
			return layoutPoint;
		}
		
		// EVENTS HANDLERS
		// ----------------------------------------
		
	}

}