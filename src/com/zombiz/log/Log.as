package com.zombiz.log {

	// _________________________________________________________________ //
	// <=__________________________ IMPORTS __________________________=> //
	
	
	
	
	
	// _________________________________________________________________ //
	// <=___________________________ EVENTS __________________________=> //

	
	
	
	
	public class Log {

		
		// _________________________________________________________________ //
		// <=_________________________ CONSTANTS _________________________=> //
		
		
		
		
		
		// _________________________________________________________________ //
		// <=_________________________ VARIABLES _________________________=> //
		
		
		/**
		 * Les paramètres passés au log par "l'utilisateur". Ils constituent le message essentiel du log
		 * et seront convertis en String et concaténés avec un séparateur.
		 */
		protected var _parameters : Array;

		/**
		 * La date du log.
		 */
		protected var _date : Date;

		/**
		 * Le LogLevel permet de définir les contexte des logs : le label de ce contexte, la priorité (importance)
		 * du log, et la couleur par défaut à utiliser pour l'afficher.
		 */
		protected var _level : LogLevel;

		
		// _________________________________________________________________ //
		// <=________________________ CONSTRUCTOR ________________________=> //

		
		public function Log( pParameters : Array, pLevel : LogLevel, pDate : Date = null ) {
			_parameters = pParameters;
			_level = pLevel;
			_date = pDate ? pDate : new Date() ;
		}

		
		// _________________________________________________________________ //
		// <=_______________________ PUBLIC METHODS ______________________=> //
		
		
		
		
		
		// _________________________________________________________________ //
		// <=______________________ INTERNAL METHODS _____________________=> //
		
		
		
		
		
		// _________________________________________________________________ //
		// <=_____________________ PROTECTED METHODS _____________________=> //
		
		
		
		
		
		// _________________________________________________________________ //
		// <=______________________ PRIVATE METHODS ______________________=> //
		
		
		
		
		
		// _________________________________________________________________ //
		// <=_____________________ PUBLIC PROPERTIES _____________________=> //

		
		public function get parameters() : Array {
			return _parameters;
		}

		public function get date() : Date {
			return _date;
		}

		public function get level() : LogLevel {
			return _level;
		}
		
		
		// _________________________________________________________________ //
		// <=____________________ INTERNAL PROPERTIES ____________________=> //
	}
}