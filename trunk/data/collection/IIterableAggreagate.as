package com.zombiz.data.collection 
{
	import com.zombiz.data.iterator.IIterator;
	
	/**
	 * Une interface qui doit être implémantée par un type de collection qui à besoin d'un iterator.
	 * @author Pascal Achard
	 */
	
	public interface IIterableAggreagate 
	{
		function getIterator(pType:String = null):IIterator;
	}
	
}