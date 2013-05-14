package net.khaledgarbaya.games.kgarkanoid.view.object
{
	import net.khaledgarbaya.games.kgarkanoid.model.BricksModel;
	import net.khaledgarbaya.games.kgarkanoid.model.ScoreModel;
	import net.khaledgarbaya.games.kgarkanoid.view.signal.GameLoopSignal;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class BrickMediator extends Mediator
	{
		[Inject]
		public var brick:Brick;
		
		[Inject]
		public var gameLoopSignal:GameLoopSignal;
		
		[Inject]
		public var scoreModel:ScoreModel;
		
		[Inject]
		public var bricksModel:BricksModel;
		
		public function BrickMediator()
		{
			//Again  :p 
			//Forever alone
			//override the onRegister Method instead
		}
		
		override public function onRegister():void
		{
			gameLoopSignal.add( brickLoop );
			addViewListener( BrickEvent.BRICK_DESTROYED, stopBrickLoop, BrickEvent);
			super.onRegister();
		}
		
		private function stopBrickLoop( event : BrickEvent ):void
		{
			gameLoopSignal.remove( brickLoop );
			//random range between 10 and 50
			scoreModel.score += Math.floor(Math.random() * (50 - 10 + 1)) + 10;
			bricksModel.bricksCount--;
			brick.destroy();
		}
		
		private function brickLoop():void
		{
			brick.update();
		}		
		
	}
}