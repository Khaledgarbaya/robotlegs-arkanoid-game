package net.khaledgarbaya.games.kgarkanoid.command
{
	import flash.events.Event;
	
	import net.khaledgarbaya.games.kgarkanoid.view.signal.GameLoopSignal;
	
	import org.robotlegs.mvcs.Command;
	
	public class StartGameLoopCommand extends Command
	{
		[Inject]
		public var gameLoopSignal:GameLoopSignal;
		
		override public function execute():void {
			contextView.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(ev:Event):void{
			gameLoopSignal.dispatch();
		}
	}
}