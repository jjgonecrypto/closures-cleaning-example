package org.justinjmoses.examples.closures
{
	import org.osflash.signals.ISignal;

	public interface IDoesSomethingWithSignals
	{
		function doSomething(index:int):ISignal;
	}
}