﻿/*
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

package com.zombiz.layout.layouts 
{
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author Pascal Achard
	 */
	public class Flow extends ALayout
	{
		
		// PROPERTIES
		// ----------------------------------------
		private var _x:Number;							// La position en x du layout.
		private var _y:Number;							// La position en y du layout.
		private var _width:Number;						// La largeur du flow.
		private var _isVertical:Boolean;
		private var _snapToPixel:Boolean;
		
		// GETTERS - SETTERS
		// ----------------------------------------
			
		// CONSTRUCTOR
		// ----------------------------------------		
		public function Flow(pX:Number, pY:Number, pWidth:Number, pIsVertical:Boolean = false, pSnapToPixel:Boolean = true) 
		{
			super();
			_x = pX;
			_y = pY;
			_isVertical = pIsVertical;
			_snapToPixel = pSnapToPixel;
			_width = pWidth;
			
		}
		
		// METHODS
		// ----------------------------------------
		override public function addToLayout(pDisplayItem:DisplayObject):void 
		{
			throw new Error("Ce layout n'est pas terminé !!!");
		}
		
	}
	
}