package net.khaledgarbaya.games.kgarkanoid.view.object
{
	import flash.display.Sprite;
	
	public class Paddle extends Sprite
	{
		private var paddleSkin:PaddleSkin;
		private var _targetX:Number;
		private var _easing:Number;
		public function Paddle(  )
		{
		}
		
		public function init():void
		{
			this.y = stage.stageHeight - 150;
			this.x = Math.ceil( stage.stageHeight/2 - this.width/2 );

			targetX = this.x;
			easing  = 7;
			paddleSkin ||= new PaddleSkin();
			this.addChild( paddleSkin );
		}
		
		public function move( targetX : Number ) : void
		{
			if( targetX <= this.paddleSkin.width/2 )
				this.targetX = 0;
			else if( targetX >= stage.stageWidth - this.paddleSkin.width/2)
			{
				this.targetX = stage.stageWidth - this.paddleSkin.width;
			}
			else
			{
				this.targetX = targetX - this.paddleSkin.width/2;
			}
			this.x += ( this.targetX - this.x ) / easing;
		}
		public function get targetX():Number
		{
			return _targetX;
		}

		public function set targetX(value:Number):void
		{
			_targetX = value;
		}

		public function get easing():Number
		{
			return _easing;
		}

		public function set easing(value:Number):void
		{
			_easing = value;
		}


	}
}