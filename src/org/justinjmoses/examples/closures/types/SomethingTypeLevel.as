package org.justinjmoses.examples.closures.types
{
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import org.justinjmoses.examples.closures.IDisposable;
	import org.justinjmoses.examples.closures.IDoesSomething;
	import org.justinjmoses.examples.closures.util.MyTimer;
	import org.justinjmoses.examples.closures.events.SomethingEvent;

	public class SomethingTypeLevel extends EventDispatcher implements IDoesSomething, IDisposable
	{
		//handler is now defined at a type (class) level
		private var timerHandler:Function;
		
		//we have to also scope the timer to the type level in order to remove listeners
		private var timer:MyTimer;
		
		public function doSomething(index:int):void
		{
			timer = new MyTimer(1000);
			
			timerHandler = function(evt:TimerEvent):void
			{
				dispatchEvent(new SomethingEvent(SomethingEvent.SOMETHING_HAPPENED, index));
			};
			
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
			
			timer.start();
		}
		
		public function dispose():void
		{
			if (!timer) return;
			
			if (timer.hasEventListener(TimerEvent.TIMER, timerHandler))
			{
				timer.removeEventListener(TimerEvent.TIMER, timerHandler);
			}
			
			timer.stop();
			timer = null;
		}
	}
}