package org.justinjmoses.examples.closures
{
	import flash.events.IEventDispatcher;

	[Event(name="somethingHappened",type="org.justinjmoses.examples.closures.events.SomethingEvent")]
	public interface IDoesSomething extends IEventDispatcher
	{
		function doSomething(index:int):void;
	}
}