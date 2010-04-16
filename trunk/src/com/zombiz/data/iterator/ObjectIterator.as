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

package com.zombiz.data.iterator 
{
	
	/**
	 * Iterateur d'un Objet.
	 * @author Pascal Achard
	 */
	public class ObjectIterator implements IIterator
	{
		
		private var _index:uint;
		private var _collection:Object;
		private var _keys:Array;
		
		public function ObjectIterator(pCollection:Object) 
		{
			_collection = pCollection;
			_index = 0;
			_keys = new Array ();
			for (var key:* in _collection) {
				_keys.push(key);
			}
		}
		
		/* INTERFACE com.zombiz.data.iterator.IIterator */
		
		public function reset():void
		{
			_index = 0;
		}
		
		public function next():Object
		{
			return _collection[_keys[_cursor++]];
		}
		
		public function hasNext():Boolean
		{
			return _index < _keys.length;
		}
		
		private function _cloneObject (pObject:Object):Object
		{
			var clone:Object = { };
			
			for (var all:String in pObject) {
				clone[all] = pObject[all];
			}
			
			return clone;
		}
		
	}
	
}