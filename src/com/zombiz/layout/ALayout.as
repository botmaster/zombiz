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

package com.zombiz.layout 
{
	import flash.geom.Point;
	import flash.display.DisplayObject;
	import flash.utils.getQualifiedClassName;
	
	/**
	 * Classe Abstraite
	 * @author Pascal Achard
	 * @version 1.0.0
	 * @since 12 mars 2010.
	 */
	
	public class ALayout implements ILayout
	{
		
		public function ALayout() 
		{
			// Cette classe ne doit pas être instanciée directement.
			super ();
			if (getQualifiedClassName(this) == "com.zombiz.layout::ALayout") {
				throw new Error ("Cette classe est abstraite et ne peut être instanciée !");
			}
		}
		
		
		/* INTERFACE com.zombiz.layout.ILayout */
		
		final public function addToLayout(object:DisplayObject):void
		{
			var point:Point = getNextPoint();
			object.x = point.x;
			object.y = point.y;
		}
		
		/**
		 * Méthode abstraite, doit être redéfinies par sa sous-classe.
		 * @return
		 */
		public function getNextPoint():Point
		{
			throw new Error ("Cette méthode est abstraite et doit être redéfinie dans les sous-classes");
			return null;
		}
		
	}
	
}