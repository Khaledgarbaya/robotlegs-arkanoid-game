package net.khaledgarbaya.games.kgarkanoid.view
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import net.khaledgarbaya.games.kgarkanoid.view.object.Ball;
	import net.khaledgarbaya.games.kgarkanoid.view.object.Brick;
	import net.khaledgarbaya.games.kgarkanoid.view.object.Paddle;
	import net.khaledgarbaya.games.kgarkanoid.view.score.ScoreView;
	
	
	/**
	 * the main game view
	 * @author Khaled Garbaya
	 * 
	 */
	public class InGameView extends Sprite
	{
		/**
		 * @private 
		 */		
		private var scoreView:ScoreView;

		/**
		 * @private 
		 */		
		private var bg:BackgroundSkin;
		
		/**
		 * @private 
		 */		
		private var ball:Ball;
		
		/**
		 * @private 
		 */		
		private var paddle:Paddle;
		
		/**
		 * @private 
		 */		
		private var brick:Brick;
		/**
		 * @private 
		 */				
		private var messageText:TextField;
		/**
		 * @private 
		 */				
		private var verdanaFont:Verdana;
		
		public function InGameView()
		{
		}
		
		/**
		 * init the game view by adding all necessery component
		 * @param bricksCount Number
		 * 
		 */
		public function init( bricksCount : Number = 21 ):void
		{
			bg = new BackgroundSkin();
			this.addChild( bg );

			
			// setup the paddle
			paddle = new Paddle(  );
			this.addChild( paddle );
			
			//setup the ball
			ball   = new Ball( paddle );
			this.addChild( ball );
			
			//setup bricks
			createBricks( bricksCount );
			
			scoreView = new ScoreView();
			this.addChild( scoreView );			
		}
		
		/**
		 * Creates basic bricks grid
		 * @param bricksCount Number
		 * 
		 */
		public function createBricks( bricksCount : Number ):void
		{
			for( var i:uint=0; i< bricksCount ; i++)
			{
				brick = new Brick( ball );
				brick.y = 60 + int(i / 7) * 60;
				brick.x = 100 + (i % 7) * 90;
				this.addChild( brick );
			}
			ball.init();
		}
		
		/**
		 * Show Message in the middle of the screen 
		 * @param message String
		 * @param score Number dafult 0.0
		 * 
		 */
		public function showMessage( message : String , score : Number = 0.0 ) : void
		{
			var __scoreTextFormat:TextFormat = new TextFormat();
			verdanaFont ||= new Verdana();
			__scoreTextFormat.size  = 36;
			__scoreTextFormat.align = "center";
			__scoreTextFormat.color = 0xFFFFFF;
			__scoreTextFormat.font = verdanaFont.fontName;
			
			messageText      = new TextField();
			messageText.defaultTextFormat = __scoreTextFormat;
			messageText.multiline = true;
			
			if( score > 0 )
				message += score.toString();

			messageText.text = message;
			messageText.autoSize = TextFieldAutoSize.LEFT;			
			messageText.x = stage.stageWidth /2 - messageText.width/2;
			messageText.y = stage.stageHeight /2 - messageText.height/2;
			
			
			this.addChild( messageText );
		}
		/**
		 * remove the message from the middle of the screen 
		 * 
		 */
		public function hideMessage() : void
		{
			if( messageText != null )
			{
				this.removeChild( messageText );
				messageText = null;
			}
		}
	}
}