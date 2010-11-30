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

package com.zombiz.data.collection.simplecollection 
{
	
	import com.zombiz.data.collection.ICollection;
	import com.zombiz.data.iterator.ArrayIterator;
	import com.zombiz.data.iterator.IIterator;
	


	/**
	 * Une colleciton simple qui ajoute des fonctionnalités à Array.
	 * TODO: Compléter cette classe.
	 * @author Pascal Achard
	 * @since 04/24/2010.
	 * @version 1.0
	 */
	
	public class SimpleCollection implements ICollection
	{
		
		// PROPERTIES
		// ----------------------------------------
		protected var _items:Array;
		
		// GETTERS - SETTERS
		// ----------------------------------------
			
		// CONSTRUCTOR
		// ----------------------------------------
		public function SimpleCollection(pElements:Array = null) 
		{
			if( pElements != null && pElements.length > 0 ) 
            {   
                _items = pElements.slice() ;   
            }            
            else 
            {
                _items = new Array();
            }
		}
		
		
		// METHODS
		// ----------------------------------------
		/* INTERFACE com.zombiz.data.collection.ICollection */
		
		public function add(pValue:*):Boolean
		{
			if (!pValue)
			{
				return false;
			}
			_items.push(pValue);
			return true;
		}
		
		public function clear():void
		{
			_items.splice(0);
		}
		
		public function size():int
		{
			return _items.length;
		}
		
		public function isEmpty():Boolean
		{
			return _items.length == 0 ;
		}
		
		public function getIterator(pType:String = null):IIterator
		{
			return new ArrayIterator(_items);
		}
		
		public function toArray():Array 
		{
			return _items.slice();
		}
		
		// EVENTS HANDLERS
		// ----------------------------------------
		
	}

}