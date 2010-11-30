package com.zombiz.log {
	
	import com.zombiz.log.LogLevel;
	
	import flash.events.IOErrorEvent;
	import flash.events.StatusEvent;
	import flash.net.LocalConnection;	

	// _________________________________________________________________ //
	// <=__________________________ IMPORTS __________________________=> //
	
	
	
	
	
	// _________________________________________________________________ //
	// <=___________________________ EVENTS __________________________=> //

	
	
	
	public class LCLogger extends ALogger {

		
		// _________________________________________________________________ //
		// <=_________________________ CONSTANTS _________________________=> //
		
		
		
		
		
		// _________________________________________________________________ //
		// <=_________________________ VARIABLES _________________________=> //

		
		protected var _lc : LocalConnection;
		protected var _connectionName : String;

		
		// _________________________________________________________________ //
		// <=________________________ CONSTRUCTOR ________________________=> //
		
		
		/**
		 * Ajouter un underscore au début du connectionName pour la communication inter-domaine.
		 * Le récepteur déclare aussi : _lc.allowDomain ( "*" ).
		 * 
		 * @param	pConnectionName	Actuellement, il faut utiliser la chaîne "_defaultConnectionName"
		 * (ou passer null) car le swf remote ouvre une connexion de même nom.
		 * @param	pSeparator
		 * @param	pDefaultLogLevel
		 */
		public function LCLogger( pConnectionName : String = null, pSeparator : String = null, pDefaultLogLevel : LogLevel = null ) {
			super(pSeparator, pDefaultLogLevel) ;
			
			if ( !pConnectionName ) _connectionName = "_defaultConnectionName";
			
			_lc = new LocalConnection() ;
			_lc.addEventListener(StatusEvent.STATUS, _lcStatusHandler) ;
			_lc.addEventListener(IOErrorEvent.IO_ERROR, _lcIOErrorEvent) ;
		}

		
		
		
		// _________________________________________________________________ //
		// <=_______________________ PUBLIC METHODS ______________________=> //

		
		override protected function _log( pLog : Log ) : void {
			_lc.send(_connectionName, "print", formatToString(pLog), pLog.level.color) ;
		}

		
		// _________________________________________________________________ //
		// <=______________________ INTERNAL METHODS _____________________=> //
		
		
		
		
		
		// _________________________________________________________________ //
		// <=_____________________ PROTECTED METHODS _____________________=> //

		
		protected function _lcIOErrorEvent(e : IOErrorEvent) : void {
		}

		protected function _lcStatusHandler(e : StatusEvent) : void {
		}
		
		
		// _________________________________________________________________ //
		// <=______________________ PRIVATE METHODS ______________________=> //
		
		
		
		
		
		// _________________________________________________________________ //
		// <=_____________________ PUBLIC PROPERTIES _____________________=> //
		
		
		
		
		
		// _________________________________________________________________ //
		// <=____________________ INTERNAL PROPERTIES ____________________=> //
	}
}