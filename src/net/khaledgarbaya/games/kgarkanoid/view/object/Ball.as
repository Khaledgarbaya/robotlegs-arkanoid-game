package net.khaledgarbaya.games.kgarkanoid.view.object
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	import net.khaledgarbaya.games.kgarkanoid.view.event.GameLoopEvent;
	
	/**
	 * the ball object class 
	 * @author Khaled Garbaya
	 * 
	 */
	public class Ball extends Sprite implements IBall
	{
		/**
		 * @private
		 * 
		 */		
		private  var _xDirection : Number =  10.0;
		/**
		 * @private
		 * 
		 */		
		private  var _yDirection : Number = -10.0;
		/**
		 * @private
		 * 
		 */		
		private  var ballSkin:BallSkin;
		/**
		 * @private
		 * 
		 */		
		private  var _paddle:Paddle; 
		
		public function Ball( paddle:Paddle )
		{
			this.paddle = paddle;
		}
		
		
		/**
		 * add the skin to the ball 
		 * and reset it to initial position in the game 
		 * 
		 */
		public function init():void
		{
			ballSkin ||= new BallSkin();
			this.addChild( ballSkin );
			this.x = paddle.x + paddle.width/2 - this.width/2;
			this.y = paddle.y - this.height;
		}
		
		/**
		 * update the ball position on the stage
		 * if the ball hitt one of the edges top, right and left
		 * it reflect its direcetion(xDirection or yDirection) 
		 * it depends on the hitted edge
		 */
		public function move():void
		{
			if( this.x <= 0)
			{
				xDirection *= -1;
			}
			else if( this.x >= stage.stageWidth - this.ballSkin.width )
			{
				xDirection *= -1;
			}
			if( this.hitTestObject( this.paddle ) )
			{
				yDirection *= -1;
				this.y = this.paddle.y - this.ballSkin.height - this.paddle.height/2;
			}
			if( this.y <= 0)
			{
				yDirection *= -1;
			}
			else if( this.y >= stage.stageHeight - this.ballSkin.height )
			{
				dispatchEvent( new GameLoopEvent(GameLoopEvent.STOP_LOOP) );
			}
			
			this.x += xDirection;
			this.y += yDirection;
		}
		
		/**
		 * value gets added to the x property of the ball each tick
		 * @return xDirection Number
		 * 
		 */
		public function get xDirection():Number
		{
			return _xDirection;
		}
		/**
		 * @private
		 * 
		 */		
		public function set xDirection ( dir : Number ) : void
		{
			_xDirection = dir;
		}
		
		/**
		 * value gets added to the y property of the ball each tick
		 * @return yDirection Number
		 * 
		 */
		public function get yDirection():Number
		{
			return _yDirection;
		}
		/**
		 * @private
		 * 
		 */	
		public function set yDirection ( dir : Number ) : void
		{
			_yDirection = dir;
		}
		public function destroy() : void
		{
			this.parent.removeChild( this );
		}
		public function hittedBy( object:DisplayObject ):void
		{	
		}
		/**
		 * the paddle that will interact with the ball
		 * @return paddle Paddle
		 * 
		 */
		public function get paddle():Paddle
		{
			return _paddle;
		}
		/**
		 * @private
		 * 
		 */
		public function set paddle(value:Paddle):void
		{
			_paddle = value;
		}

		
		/**
		 * reflect the y Direction of the ball 
		 * 
		 */
		public function reflect():void
		{
			yDirection *= -1;
		}
		
	}
}