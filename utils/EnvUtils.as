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
	import flash.display.DisplayObject;
	import flash.system.Capabilities;
	
	/**
	 * 
	 * Classe utilitaire qui permet d'avoir des infos sur l'environnement du player.
	 * @author Pascal Achard
	 * @version 1.0
	 * @since 11 mars 2010
	 * 
	 * @example <listing version="3.0"> 
	 * trace("Je suis en ligne ? --> " + EnvUtils.isHTTP(stage));
	 * trace("Je suis dans le browser ? --> " + EnvUtils.isInBrowser());
	 * trace("Je suis dans l'IDE --> " + EnvUtils.isInIDE());
	 * trace("Je suis dans le player standalone --> " + EnvUtils.isStandAlone());
	 * </listing> 
	 */
	
	public final class EnvUtils 
	{
		/**
		 * @private
		 */
		public function EnvUtils() 
		{
			throw new Error( this + " Ne pas instancier cette classe utilitaire" );
		}
		
		
		/**
		 * On vérifie si on est sur le net ou pas.
		 * @param	pLocation		Pour récupérer l'URL il nous faut un LoaderInfo, on peut taper celui du stage.
		 * @return	True, si le swf est sur le net ou pas (false);
		 */
		public static function isHTTP(pLocation:DisplayObject):Boolean
		{
			return pLocation.loaderInfo.url.substr(0, 4) == "http";
		}
		
		/**
		 * On test si on est dans un browser ou pas.
		 * @return	True si on est dans un browser, si non, false.
		 */
		public static function isInBrowser():Boolean
		{
			return Capabilities.playerType == "PlugIn" || Capabilities.playerType == "ActiveX";
		}
		
		/**
		 * On test si on est dans l'IDE de Flash.
		 * @return True si on est dans L'IDE sinon false.
		 */
		public static function isInIDE():Boolean
		{
			return Capabilities.playerType == "External";
		}
		
		/**
		 * On test si le swf est joué dans le player autonome.
		 * @return	True si on est dans le player StandAlone.
		 */
		public static function isStandAlone():Boolean
		{
			return Capabilities.playerType == "StandAlone";
		}
		
	}
	
}