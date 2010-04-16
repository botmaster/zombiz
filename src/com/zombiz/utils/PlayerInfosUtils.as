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
	import flash.system.Capabilities;
	
	/**
	 * Classe utilitaire qui permet de récuperer les specs du player.
	 * @author Pascal Achard.
	 * @since 14 aout 2009.
	 * @version 1.0
	 */
	
	public class PlayerInfosUtils 
	{
		
		// PROPERTIES
		// ----------------------------------------
		
		private static var _platform:String;
		private static var _majorVersion:Number;
		private static var _minorVersion:Number;
		private static var _buildNumber:Number;
		
		// METHODS
		// ----------------------------------------		
		
		/**
		 * On récupère la platfomer sur laquel fonctionne le player en cours. (PC, Mac, Lin ?).
		 * @return Retourne la platforme du player.
		 */
		public static function getPlatform():String 
		{
			if (!_platform) _getPlayerInfos();
			return _platform;
		}
		
		
		/**
		 * On récupère le numéro majeur de version du player.
		 * @return Le numéro majeur du player.
		 */
		public static function getMajorVersion():Number 
		{
			if (!_majorVersion) _getPlayerInfos();
			return _majorVersion;
		}
		
		
		/**
		 * On récupère le numéro mineur de version du player.
		 * @return Le numéro mineur du player.
		 */
		public static function getMinorVersion():Number 
		{
			if (!_minorVersion) _getPlayerInfos();
			return _minorVersion;
		}
		
		
		/**
		 * On récupère la build du player.
		 * @return Retourne le numéro de build du player.
		 */
		public static function getBuildNumber():Number 
		{
			if (!_buildNumber) _getPlayerInfos();
			return _buildNumber;
		}
		
		
		static public function toString():String 
		{
			var output:String = "----------------------------\n" +
								"PLATFORM: " + PlayerInfosUtils.getPlatform() + "\n" +
								"MAJOR_VERSION: " + PlayerInfosUtils.getMajorVersion() + "\n" +
								"MINOR_VERSION: " + PlayerInfosUtils.getMinorVersion() + "\n" +
								"BUILD_NUMBER: " + PlayerInfosUtils.getBuildNumber() + "\n" +
								"-----------------------------\n";
			return output;
			/*// On affiche les infos du player.			
			MonsterDebugger.trace(this, "PLATFORM: " + PlayerInfosUtils.getPlatform(), MonsterDebugger.COLOR_INFO);
			MonsterDebugger.trace(this, "MAJOR_VERSION: " + PlayerInfosUtils.getMajorVersion(), MonsterDebugger.COLOR_INFO);
			MonsterDebugger.trace(this, "MINOR_VERSION: " + PlayerInfosUtils.getMinorVersion(), MonsterDebugger.COLOR_INFO);
			MonsterDebugger.trace(this, "BUILD_NUMBER: " + PlayerInfosUtils.getBuildNumber(), MonsterDebugger.COLOR_INFO);
			MonsterDebugger.trace(this, "///////////////////////////////////////////////////////////////////////", MonsterDebugger.COLOR_INFO);*/
		}
		
		
		protected static function _getPlayerInfos():void 
		{
			var versionNumber:String = Capabilities.version;
			var versionArray:Array = versionNumber.split(",");
			var platformAndVersion:Array = versionArray[0].split(" ");
			
			_platform = platformAndVersion[0];
			_majorVersion = parseInt(platformAndVersion[1]);
			_minorVersion = parseInt(versionArray[1]);
			_buildNumber = parseInt(versionArray[2]);
		}	
		
	}
	
}