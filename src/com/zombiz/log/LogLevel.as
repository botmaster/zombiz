package com.zombiz.log {

	// _________________________________________________________________ //
	// <=__________________________ IMPORTS __________________________=> //
	
	
	
	
	
	// _________________________________________________________________ //
	// <=___________________________ EVENTS __________________________=> //

	
	
	
	public class LogLevel {

		
		// _________________________________________________________________ //
		// <=_________________________ CONSTANTS _________________________=> //

		
		public static const BENCH : LogLevel = new LogLevel("BENCH", 0x37BBF2, 0) ;
		public static const INFO : LogLevel = new LogLevel("INFO", 0xF4F4F4, 0) ;
		public static const CARE : LogLevel = new LogLevel("CARE", 0xC9C102, 100) ;
		public static const WARNING : LogLevel = new LogLevel("WARNING", 0xFFBF00, 200) ;
		public static const ERROR : LogLevel = new LogLevel("ERROR", 0xF26304, 300);
		public static const BUG : LogLevel = new LogLevel("BUG", 0xF70000, 400);

		
		// _________________________________________________________________ //
		// <=_________________________ VARIABLES _________________________=> //

		
		protected var _label : String;
		protected var _color : uint;
		protected var _priority : int;

		
		// _________________________________________________________________ //
		// <=________________________ CONSTRUCTOR ________________________=> //

		
		public function LogLevel( pLabel : String, pColor : uint, pPriority : int = 0 ) {
			_label = pLabel;
			_color = pColor;
			_priority = pPriority;
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

		
		public function get label() : String {
			return _label;
		}

		public function get color() : uint {
			return _color;
		}

		public function get priority() : int {
			return _priority;
		}
		
		
		// _________________________________________________________________ //
		// <=____________________ INTERNAL PROPERTIES ____________________=> //
	}
}