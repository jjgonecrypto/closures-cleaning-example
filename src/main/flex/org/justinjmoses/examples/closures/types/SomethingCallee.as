package org.justinjmoses.examples.closures.types
{
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import org.justinjmoses.examples.closures.IDoesSomething;
	import org.justinjmoses.examples.closures.util.MyTimer;
	import org.justinjmoses.examples.closures.events.SomethingEvent;

	public class SomethingCallee extends EventDispatcher implements IDoesSomething
	{
		public function doSomething(index:int):void
		{
			const timer:MyTimer = new MyTimer(index * 100,-1);
			
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, 
				function(evt:TimerEvent):void
				{
					dispatchEvent(new SomethingEvent(SomethingEvent.SOMETHING_HAPPENED, index));
					
					//cleanup after ourselves
					timer.removeEventListener(TimerEvent.TIMER_COMPLETE, arguments.callee);
				});
			
			timer.start();
		}
	}
}