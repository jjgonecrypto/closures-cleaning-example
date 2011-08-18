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
	
	public class SomethingSignalsCallee implements IDoesSomethingWithSignals
	{
		
		public function doSomething(index:int):ISignal
		{
			//create a Signal to return
			const response:ISignal = new Signal(int);
			
			const timer:MyTimer = new MyTimer(100 + index * 10);
			
			//create a signal from the Timer event
			const signal:NativeSignal = new NativeSignal(timer, TimerEvent.TIMER, TimerEvent);
			
			var numTicks:int = 0;
			
			signal.add(function(evt:TimerEvent):void
			{
				if (numTicks++ == 5)
				{
					response.dispatch(index);
					signal.remove(arguments.callee);
					timer.stop();
				}
			});
			
			timer.start();
			
			return response;
		}
	
	}
}