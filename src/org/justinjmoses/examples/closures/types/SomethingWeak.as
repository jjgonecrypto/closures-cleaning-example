package org.justinjmoses.examples.closures.types
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;
	import org.justinjmoses.examples.closures.IDoesSomething;
	import org.justinjmoses.examples.closures.util.MyTimer;
	import org.justinjmoses.examples.closures.events.SomethingEvent;
	
	public class SomethingWeak extends EventDispatcher implements IDoesSomething
	{
		public function doSomething(index:int):void
		{
			var timer:MyTimer = new MyTimer(index * 100,-1);
			
			//WARNING! Nothing is holding a reference to timer, and it may be garbage collected before this listener is hit!
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, 
				function(evt:TimerEvent):void
				{
					dispatchEvent(new SomethingEvent(SomethingEvent.SOMETHING_HAPPENED, index));
				}, false, 0, true);
			
			timer.start();
		}
	}
}