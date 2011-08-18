package org.justinjmoses.examples.closures.util
{
	import flash.utils.Timer;
	
	/**
	 * Custom timer simply to help identify timer instances in Profiler.
	 */
	public class MyTimer extends Timer
	{
		public function MyTimer(delay:Number, repeatCount:int=0)
		{
			super(delay, repeatCount);
		}
	}
}