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

package com.zombiz.utils 
{
	import flash.utils.ByteArray;
	
	/**
	 * Classe utilitaire de gestion des Array.
	 * @author Pascal Achard
	 * @since 04/16/10
	 * @version 1.0
	 */
	
	public class ArrayUtils 
	{
		
		public function ArrayUtils() 
		{
			throw new Error( this + " Ne pas instancier cette classe utilitaire" );
		}
		
		
		/**
		 * Vérifie si une valeur est présente dans un Array.
		 * @param	pArray		L'Array qui va être testée.
		 * @param	pValue		L'Object qui va être cherché.
		 * @return	true si l'object est trouvé, false si il n'y est pas.
		 */
		public static function containsValue(pArray:Array, pValue:Object):Boolean 
		{
			return (pArray.indexOf(pValue) != -1);
		}
		
		/**
		 * Copy un array. Attention si l'array contient des références, celle ci resteront des références !
		 * @param	pArray		L'array qui va être copié.
		 * @return	Un array.
		 */
		public static function copy(pArray:Array):Array
		{
			return pArray.slice();
		}
		
		/**
		 * Fait une copie unique d'un array.
		 * @param	pArray		L'array qui va être clonné.
		 * @return	Un Array.
		 */
		public static function clone(pArray:Array):Array
		{
			var cloner:ByteArray = new ByteArray();
			cloner.writeObject(pArray);
			cloner.position = 0;
			return(cloner.readObject());
		}
		
		/**
		 * Mélange un tableau
		 * @param	pArray	Le tableau à mélanger.
		 */
		public static function shuffle(pArray:Array):Array 
		{
			var souceArray:Array = ArrayUtils.copy(pArray);
			var shuffleArray:Array = new Array();
			while (souceArray.length > 0) 
			{
				var index:int = Math.floor(Math.random() * souceArray.length);
				shuffleArray.push(souceArray[index]);
				souceArray.splice(index, 1);
			}
			return shuffleArray;
		}
		
		/**
		 * Retourne un tableau sous la forme d'une string
		 * @param	array	Le tableau source
		 * @param	separator	le séparateur.
		 * @return	Une chaine
		 */
		public static function toString(array:Array, separator:String = ","):String
		{
			return (!array) ? "" : array.join(separator);
		}
	}
	
}