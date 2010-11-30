package com.zombiz.log {

	public interface ILogger {

		
		/**
		 * 
		 * @param	rest ...	Si le 1° param est un LogLevel il sera utilisé pour la mise en forme
		 * du message, selon quel Logger concret est utilisé, et tous les params suivants seront
		 * ajoutés au message avec un separateur. Si le premier n'est pas un LogLevel il sera le 1°
		 * élément du message de sortie au même titre que les suivants.
		 */
		function log( ... rest ) : void;
	}
}