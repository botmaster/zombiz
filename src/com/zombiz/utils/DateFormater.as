package com.zombiz.utils {
	import flash.utils.Dictionary;					

	public class DateFormater {
		public var yearPattern : String = "{y}";
		public var monthPattern : String = "{m}";
		public var monthNamePattern : String = "{mN}";
		public var datePattern : String = "{d}";
		public var dayNamePattern : String = "{dN}";
		public var hoursPattern : String = "{h}";
		public var minutesPattern : String = "{min}";
		public var secondsPattern : String = "{s}";
		public var deciPattern : String = "{10}";
		public var centiPattern : String = "{100}";
		public var milliPattern : String = "{1000}";

		public var monthsNames : Array = ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"];
		public var daysNames : Array = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"];

		public var defaultFormat : String = "{dN} {d} {mN} {m} {y} - {h}:{min} {s} {10} {100} {1000}";

		private var _rules : Array;
		private var _rulesByPattern : Dictionary;

		
		public function DateFormater( pDefaultFormat : String = null ) {
			if ( pDefaultFormat ) defaultFormat = pDefaultFormat;
			_rules = new Array();
			_rulesByPattern = new Dictionary(false);
		}

		
		public function format( pDate : Date ) : String {
			var	string : String = defaultFormat;
			
			if ( string.indexOf(yearPattern) != -1 )
				string = string.replace(yearPattern, String(pDate.fullYear));
			
			if ( string.indexOf(monthPattern) != -1 )
				string = string.replace(monthPattern, pDate.month < 9 ? "0" + pDate.month + 1 : String(pDate.month + 1));
			
			if ( string.indexOf(monthNamePattern) != -1 )
				string = string.replace(monthNamePattern, monthsNames[pDate.month]);
			
			if ( string.indexOf(datePattern) != -1 )
				string = string.replace(datePattern, String(pDate.date));
			
			if ( string.indexOf(dayNamePattern) != -1 )
				string = string.replace(dayNamePattern, daysNames[pDate.day - 1] || daysNames[daysNames.length - 1]); // Date.day vaut zéro pour dimanche

			if ( string.indexOf(hoursPattern) != -1 )
				string = string.replace(hoursPattern, pDate.hours < 10 ? "0" + pDate.hours : String(pDate.hours));
			
			if ( string.indexOf(minutesPattern) != -1 )
				string = string.replace(minutesPattern, pDate.minutes < 10 ? "0" + pDate.minutes : String(pDate.minutes));
			
			if ( string.indexOf(secondsPattern) != -1 )
				string = string.replace(secondsPattern, pDate.seconds < 10 ? "0" + pDate.seconds : String(pDate.seconds));
			
			if ( string.indexOf(deciPattern) != -1 )
				string = string.replace(deciPattern, String(int(pDate.milliseconds / 100)));
			
			if ( string.indexOf(centiPattern) != -1 ) {
				var centi : int = pDate.milliseconds / 10;
				string = string.replace(centiPattern, centi < 10 ? "0" + centi : String(centi));
			}
			
			if ( string.indexOf(milliPattern) != -1 ) {
				var stringMilli : String = String(pDate.milliseconds);
				
				while (stringMilli.length < 3)
					stringMilli = "0" + stringMilli;
				
				string = string.replace(milliPattern, stringMilli);
			}
			
			if ( _rules.length > 0 ) {
				for each ( var rule:Rule in _rules ) {
					if ( string.indexOf(rule.pattern) != -1 )
						string = string.replace(rule.pattern, rule.replace);
				}
			}
			
			return string;
		}

		
		public function addRule( pPattern : String, pReplace : String ) : void {
			removeRule(pPattern);
			
			var rule : Rule = new Rule(pPattern, pReplace);
			_rules.push(rule);
			_rulesByPattern[pPattern] = rule;
		}

		public function removeRule( pPattern : String ) : void {
			if (ruleExists(pPattern)) {
				_rules.splice(getRuleIndex(pPattern), 1);
				delete _rulesByPattern[pPattern];
			}
		}

		protected function getRuleIndex(pPattern : String) : int {
			return _rules.indexOf(_rulesByPattern[pPattern]);
		}

		protected function ruleExists(pPattern : String) : Boolean {
			return _rulesByPattern[pPattern] != null;
		}
	}
}

class Rule {
	public var pattern : String;
	public var replace : String;

	public function Rule(pPattern : String, pReplace : String) {
		pattern = pPattern;
		replace = pReplace;
	}
}