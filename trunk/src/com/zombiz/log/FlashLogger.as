package com.zombiz.log {

	// _________________________________________________________________ //
	// <=__________________________ IMPORTS __________________________=> //
	
	
	
	
	
	// _________________________________________________________________ //
	// <=___________________________ EVENTS __________________________=> //

	
	
	
	
	public class FlashLogger extends ALogger {

		
		// _________________________________________________________________ //
		// <=_________________________ CONSTANTS _________________________=> //
		
		
		
		
		
		// _________________________________________________________________ //
		// <=_________________________ VARIABLES _________________________=> //
		
		
		
		
		
		// _________________________________________________________________ //
		// <=________________________ CONSTRUCTOR ________________________=> //

		
		public function FlashLogger( pSeparator : String = null, pDefaultLogLevel : LogLevel = null ) {
			super(pSeparator, pDefaultLogLevel) ;
		}

		
		override protected function _log( pLog : Log ) : void {
			trace(formatToString(pLog)) ;
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
		
		
		
		
		
		// _________________________________________________________________ //
		// <=____________________ INTERNAL PROPERTIES ____________________=> //
	}
}