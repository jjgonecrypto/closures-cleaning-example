package org.justinjmoses.examples.closures.events
{
	import flash.events.Event;
	
	public class SomethingEvent extends Event
	{
		public static const SOMETHING_HAPPENED:String = "somethingHappened";
		
		public var index:int; 
		
		public function SomethingEvent(type:String, index:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.index = index;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new SomethingEvent(type, index, bubbles, cancelable);
		}
	}
}