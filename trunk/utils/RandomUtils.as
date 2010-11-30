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
	
	/**
	 * Classe utilitaire de gestion des randoms.
	 * @author Pascal Achard
	 * @since 04/16/10
	 * @version 1.0
	 */
	public class RandomUtils 
	{
		
		public function RandomUtils() 
		{
			throw new Error( this + " Ne pas instancier cette classe utilitaire" );
		}
		
		/**
		 * Retourne une valeure flotantte aléatoire entre deux valeurs.
		 * @param	pMin	La valeur minimum.
		 * @param	pMax	La valeur maximum.
		 * @return	La valeur random.
		 * @throws	Error Une erreur si la valeur maximale est supérieur à la valeur minimale.
		 */
		public static function randomFloat(pMin:Number, pMax:Number):Number
		{
			if (pMax < pMin) throw new Error("La valeur maximale ne peux pas être supérieur à la valeur minimale.");
			return _random() * (pMax - pMin) + pMin;
		}
		
		public static function randomInt(pMin:Number, pMax:Number):int 
		{
			if (pMax < pMin) throw new Error("La valeur maximale ne peux pas être supérieur à la valeur minimale.");
			return int(randomFloat(pMin, pMax));
		}
		
		/**
		 * Retoune true ou false aléatoirement
		 * @return true ou false;
		 */
		public static function trueOrFalse():Boolean 
		{
			return _random() < 0.5;
		}
		
		
		protected static function _random():Number 
		{
			return Math.random();
		}
		
	}
	
}