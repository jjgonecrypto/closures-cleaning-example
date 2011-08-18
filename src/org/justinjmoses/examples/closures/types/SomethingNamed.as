package org.justinjmoses.examples.closures.types
{
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import org.justinjmoses.examples.closures.IDoesSomething;
	import org.justinjmoses.examples.closures.util.MyTimer;
	import org.justinjmoses.examples.closures.events.SomethingEvent;

	public class SomethingNamed extends EventDispatcher implements IDoesSomething
	{
		public function doSomething(index:int):void
		{
			var timer:MyTimer = new MyTimer(1000,-1);
			
			var timerHandler:Function = function(evt:TimerEvent):void
			{
				dispatchEvent(new SomethingEvent(SomethingEvent.SOMETHING_HAPPENED, index));
				
				//cleanup after ourselves
				timer.removeEventListener(TimerEvent.TIMER_COMPLETE, timerHandler);
			};
			
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, timerHandler);
			
			timer.start();
		}
	}
}