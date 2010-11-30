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

package com.zombiz.core 
{
	import flash.utils.getQualifiedClassName;
	
	/**
	 * Classe de base qui définit les comportements de base à tous les objets.
	 * @author Pascal Achard
	 * @since 28/04/2010
	 * @version 1.0.0
	 */
	
	public class BaseClass implements IBaseClass
	{
		
		public function BaseClass() 
		{
			super();
		}
		
		/**
		 * Version "enrichie" du toString classique. On peut passer un param de infos suplémantaires comme une valeur de propriété par exemple.
		 * La classe Event utilise le même principe avec la méthode formatToString
		 * @param	...args
		 * @return	Une représentation de l'objet sous forme de string.
		 * 
		 * @example
		 * <pre>
		 * 	// Dans une classe qui étend BaseClass, on override la méthode toString. On peux passer des params de la classe.
		 *  override public function toString(... args):String 
		 *	{
		 *		return super.toString(false, myProp, [true, false, "test"], {test:3});
		 *	}
		 * </pre>
		 */
		 
		public function toString(...args):String
		{
			var s:String = "";
			for each (var i:String in args) s += " | " + i;
			return "[" + getQualifiedClassName(this) + " ----> " + s + "]";
		}
		
	}
	
}