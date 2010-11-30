package com.zombiz.log {
	
	import com.zombiz.utils.DateFormater;					

	// _________________________________________________________________ //
	// <=__________________________ IMPORTS __________________________=> //
	
	
	
	
	
	// _________________________________________________________________ //
	// <=___________________________ EVENTS __________________________=> //

	
	
	
	public class ALogger implements ILogger {

		
		// _________________________________________________________________ //
		// <=_________________________ CONSTANTS _________________________=> //
		
		
		
		
		
		// _________________________________________________________________ //
		// <=_________________________ VARIABLES _________________________=> //

		
		protected var _logsCount : uint = 0;
		protected var _separator : String = "  ";
		protected var _defaultLogLevel : LogLevel = LogLevel.INFO;
		protected var _dateFormater : DateFormater;

		// _________________________________________________________________ //
		// <=________________________ CONSTRUCTOR ________________________=> //

		
		public function ALogger( pSeparator : String = null, pDefaultLogLevel : LogLevel = null ) {
			if ( pSeparator )
				_separator = pSeparator;
			if ( pDefaultLogLevel )
				_defaultLogLevel = pDefaultLogLevel;
			
			_dateFormater = new DateFormater();
			_dateFormater.defaultFormat = _dateFormater.hoursPattern + ":" + _dateFormater.minutesPattern + ":" + _dateFormater.secondsPattern;
		}

		
		
		
		// _________________________________________________________________ //
		// <=_______________________ PUBLIC METHODS ______________________=> //

		
		final public function log( ... rest ) : void {
			_logsCount++;
			
			var log : Log,
//				parameters : Array,
				logLevel : LogLevel;
			
			if ( rest[0] is LogLevel )
				logLevel = rest.shift() as LogLevel;
			else
				logLevel = _defaultLogLevel;
			
			log = new Log(rest, logLevel, new Date()) ;
			
			_log(log) ;
		}

		
		protected function formatToString( pLog : Log ) : String {
			var output : String = "";
			
			// /!\ on perd les valeurs null et undefined dans le join() sur les parameters.
			output += _logsCount +"\t" + _separator + pLog.level.label + _separator + pLog.parameters.join(" ") + _separator + formatDateToString(pLog.date);
			
			return 	output;
		}

		
		protected function formatDateToString( pDate : Date ) : String {
			return _dateFormater.format(pDate);
		}

		
		
		
		
		// _________________________________________________________________ //
		// <=______________________ INTERNAL METHODS _____________________=> //
		
		
		
		
		
		// _________________________________________________________________ //
		// <=_____________________ PROTECTED METHODS _____________________=> //
		
		
		/**
		 * Méthode abstraite.
		 * @param	pLog
		 */
		protected function _log( pLog : Log ) : void {
		}

		
		// _________________________________________________________________ //
		// <=______________________ PRIVATE METHODS ______________________=> //
		
		
		
		
		
		// _________________________________________________________________ //
		// <=_____________________ PUBLIC PROPERTIES _____________________=> //

		
		public function get separator() : String {
			return _separator;
		}

		public function set separator(value : String) : void {
			_separator = value;
		}
		
		
		// _________________________________________________________________ //
		// <=____________________ INTERNAL PROPERTIES ____________________=> //
	}
}