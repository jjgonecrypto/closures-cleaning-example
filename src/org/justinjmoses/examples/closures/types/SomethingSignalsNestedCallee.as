package org.justinjmoses.examples.closures.types
{
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.rpc.events.ResultEvent;
	
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.osflash.signals.natives.NativeSignal;
	import org.justinjmoses.examples.closures.IDoesSomethingWithSignals;
	import org.justinjmoses.examples.closures.util.MyTimer;
	
	public class SomethingSignalsNestedCallee implements IDoesSomethingWithSignals
	{
		
		public function doSomething(index:int):ISignal
		{
			//create a Signal to return
			const response:ISignal = new Signal(int);
			
			const timer:MyTimer = new MyTimer(100);
			
			//create a signal from the Timer event
			const signal:NativeSignal = new NativeSignal(timer, TimerEvent.TIMER, TimerEvent);
			
			var numTicks:int = 0;
			
			signal.add(function(evt:TimerEvent):void
			{
				var t:MyTimer = new MyTimer(1000, -1);
				
				t.addEventListener(TimerEvent.TIMER_COMPLETE, 
					function(evt:TimerEvent):void
					{
						response.dispatch(index);
						t.removeEventListener(TimerEvent.TIMER_COMPLETE, arguments.callee);
					});
				
				t.start();
				
				signal.remove(arguments.callee);
				
				timer.stop();
			});
			
			timer.start();
			
			return response;
		}
	
	}
}