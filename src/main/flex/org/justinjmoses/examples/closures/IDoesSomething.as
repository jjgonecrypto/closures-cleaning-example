package org.justinjmoses.examples.closures
{
	[Event(name="somethingHappened",type="org.justinjmoses.examples.closures.events.SomethingEvent")]
	public interface IDoesSomething
	{
		function doSomething(index:int):void;
	}
}