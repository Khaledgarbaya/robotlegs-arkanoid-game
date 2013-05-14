package net.khaledgarbaya.games.kgarkanoid.command
{
	import net.khaledgarbaya.games.kgarkanoid.view.signal.GameLoopSignal;
	
	import org.robotlegs.mvcs.Command;
	
	public class StopGameLoopCommand extends Command
	{
		[Inject]
		public var gameLoopSignal:GameLoopSignal;
		
		override public function execute():void {
			gameLoopSignal.stop();
		}
	}
}