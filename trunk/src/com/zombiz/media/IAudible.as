
package com.zombiz.media
{
	
	/**
	 * Interface pour les classes sui gèrent le son.
	 * @author Pascal Achard
	 * @since 24 mai 2010
	 * @version 1.0.0
	 */
	
	import flash.media.SoundTransform;
	
	public interface IAudible
	{
	
		
		/**
		 * Renvoie la valeur du volume.
		 * @return Un nombre entre 0 et 1.
		 */
		function get volume():Number; 
		
		/**
		 * Affecte la valeur du volume.
		 * @param	pVolume Le volume entre 0 et 1.
		 */
		function set volume(value:Number):void; 
		
		
		/**
		 * Retourne la valeure du 'pan'.
		 * @return Un nombre entre -1 et 1.
		 */
		//function getPan():Number;
		
		
		/**
		 * Affecte la valeur du 'pan' du son.
		 * @param	pPan Un nombre entre -1 et 1.
		 */
		//function setPan(pPan:Number):void;
		
		
		/**
		 * retourne l'instance de l'objet SoundTransform du média en cours.
		 * @return Une instance d'un objet SoundTransform.
		 */
		//function get soundTransform():SoundTransform;
		
		
		/**
		 * Affect un objet SoundTransform au son en cours.
		 * @param	value  Une instance d'un objet SoundTransform.
		 */
		//function set soundTransform(value:SoundTransform):void;
	
	}
	
}