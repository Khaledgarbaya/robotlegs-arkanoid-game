package net.khaledgarbaya.games.kgarkanoid.view.signal
{
	import flash.display.Shape;
	import flash.events.Event;
	
	import org.osflash.signals.Signal;
	
	/**
	 * Game Loop Signal based on https://github.com/bardic/Robotlegs-AS3-Signal-Game-Loop
	 *  
	 * @author Khaled Garbaya
	 * 
	 */
	public class GameLoopSignal extends Signal
	{
		private var shape:Shape;
		public function GameLoopSignal() {
			shape = new Shape();
		}
		
		private function onEnter(ev:Event):void {
			this.dispatch();
		}
		
		public function start():void{
			shape.addEventListener(Event.ENTER_FRAME, onEnter);
		}
		
		public function stop():void{
			shape.removeEventListener(Event.ENTER_FRAME, onEnter);
		}
	}
}