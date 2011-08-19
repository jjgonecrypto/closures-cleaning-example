package org.justinjmoses.examples.closures.types
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.rpc.events.ResultEvent;
	
	import org.justinjmoses.examples.closures.IDoesSomethingWithSignals;
	import org.justinjmoses.examples.closures.util.MyTimer;
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.osflash.signals.natives.NativeSignal;

	public class SomethingSignalsAddOnce implements IDoesSomethingWithSignals
	{
		public function doSomething(index:int):ISignal
		{
			//create a Signal to return
			const response:ISignal = new Signal(int);
			
			const timer:MyTimer = new MyTimer(index * 100,-1);
			
			//create a signal from the Timer event
			const signal:NativeSignal = new NativeSignal(timer, TimerEvent.TIMER_COMPLETE, TimerEvent);
			
			//once TIMER COMPLETE has occurred, we can dispatch our signal, addOnce() ensures listeners to 
			//Timer will be cleaned up
			signal.addOnce(function(evt:TimerEvent):void
			{
				response.dispatch(index);
			});
			
			timer.start();
			
			return response;
		}
	}
}