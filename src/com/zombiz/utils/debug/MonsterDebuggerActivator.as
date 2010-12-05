/*
  Copyright (c) 2009, La Haute Société (http://www.lahautesociete.com).
  All rights reserved.
*/

package com.zombiz.utils.debug 
{   
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.net.SharedObject;
	import nl.demonsters.debugger.MonsterDebugger;
	
	/**
	 * ...
	 * @author Pascal Achard
	 */
	
	public class MonsterDebuggerActivator
	{
		
		// PROPERTIES
		// ----------------------------------------
		
		private var _appSO:SharedObject;									// Le SharedObject de l'application.
		private var _isInit:Boolean;										// On sctock si on à fait l'init ou pas.
		private static var _SOName:String;									// Le nom du SO.
		private static var _instance:MonsterDebuggerActivator;				// Singleton instance.
		
		// SINGLETON CONSTRUCTOR
		// ----------------------------------------
		public function MonsterDebuggerActivator(pvt:PrivateClass)
		{
			if (pvt == null)
			{
				throw new Error("SINGLETON !!!")
			}
		}
		
		// SINGLETON CONSTRUCTOR METHOD
		public static function getInstance():MonsterDebuggerActivator 
		{
			if(MonsterDebuggerActivator._instance == null) 
			{
				MonsterDebuggerActivator._instance = new MonsterDebuggerActivator(new PrivateClass());
			}
			return MonsterDebuggerActivator._instance;
		}
		
		// METHODS
		// ----------------------------------------
		public function init(pStage:Stage, pSOName:String = "debug"):void 
		{
			if (!_isInit) _isInit = true;
			else 
			{
				throw new Error("MonsterDebuggerActivator a déjà été activé !");
				return;
			}
			
			_SOName = pSOName;
			
			// On efface la sortie.
			if(MonsterDebugger.enabled) MonsterDebugger.clearTraces();			
			
			// On récupère le SO en local si il existe. Si il existe pas il est créé en mémoire mais il n'est pas créer sur le disk !!!
			// Pour qu'il soit écrit sur le disk, il faut attribuer une valeur dans l'objet data du SO et faire un flush.
			_appSO = SharedObject.getLocal(MonsterDebuggerActivator._SOName);
			
			// Si _appSO.data.debugMode = true c'est que MonsterDebugger à été activé
			MonsterDebugger.enabled = (_appSO.data.debugMode) ? true : false;
			trace("MonsterDebugger.enabled = " + MonsterDebugger.enabled);
			
			// On écoute le keydown.
			pStage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		}
		
		// EVENTS HANDLERS
		// ----------------------------------------
		
		private function keyDownHandler(e:KeyboardEvent):void 
		{
			// Si on clique sur ctrl+alt+shift+w
			if (e.ctrlKey && e.shiftKey && e.altKey && e.keyCode == 87) {
				_appSO.data.debugMode = !_appSO.data.debugMode;
				trace( "_appSO.data.debugMode : " + _appSO.data.debugMode );	
				
				MonsterDebugger.enabled = _appSO.data.debugMode;
				trace( "MonsterDebugger.enabled : " + MonsterDebugger.enabled );
				_appSO.flush();
				
			}
		}
		
	}
}

class PrivateClass 
{
	public function PrivateClass() 
	{
	}
}