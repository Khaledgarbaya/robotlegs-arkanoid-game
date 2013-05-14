package net.khaledgarbaya.games.kgarkanoid.view.score
{
	import net.khaledgarbaya.games.kgarkanoid.model.ScoreModel;
	import net.khaledgarbaya.games.kgarkanoid.model.event.ScoreModelEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ScoreViewMediator extends Mediator
	{
		[Inject]
		public var view:ScoreView;
		
		[Inject]
		public var scoreModel:ScoreModel;
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function ScoreViewMediator()
		{
			//nothing to do here and we should avoid that also
			//override the onRegister Method instead
			// -___-' sorry but I am used to write this down for every Mediator so I can remind Other developers
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		/**
		 * Initialize the view and register for events. 
		 * 
		 */
		override public function onRegister():void
		{
			addContextListener( ScoreModelEvent.SCORE_UPDATED, updateScore, ScoreModelEvent);
			super.onRegister();
		}
		
		private function updateScore( event : ScoreModelEvent ):void
		{
			trace( scoreModel.score )
			view.updateScore( scoreModel.score );
		}		
		
	}
}