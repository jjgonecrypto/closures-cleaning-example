package org.justinjmoses.examples.closures.types
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.rpc.events.ResultEvent;
	
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.osflash.signals.natives.NativeSignal;
	import org.justinjmoses.examples.closures.IDisposable;
	import org.justinjmoses.examples.closures.IDoesSomethingWithSignals;

	public class SomethingSignalsRemoveAll implements IDoesSomethingWithSignals, IDisposable
	{
		private var timerSignal:ISignal;
		
		public function doSomething(index:int):ISignal
		{
			//create a Signal to return
			const response:ISignal = new Signal(int);
			
			const timer:Timer = new Timer(index * 100);
			
			//create a signal from the Timer event
			timerSignal = new NativeSignal(timer, TimerEvent.TIMER, TimerEvent);
			
			timerSignal.add(function():void
			{
				response.dispatch(index);
			});
			
			timer.start();
			
			return response;
		}
		
		public function dispose():void
		{
			timerSignal.removeAll();
		}
	}
}