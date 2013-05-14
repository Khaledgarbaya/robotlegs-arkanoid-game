package
{
	import flash.display.Sprite;
	import net.khaledgarbaya.games.kgarkanoid.KGAnrkanoidContext;
	
	/**
	 * Main Game Class it has one task is initializing the Context
	 * @author Khaled Garbaya
	 * 
	 */
	[SWF(frameRate=30,width=800,height=600)]
	public class KGArkanoid extends Sprite
	{
		private var gameContext:KGAnrkanoidContext;
		public function KGArkanoid()
		{
			this.gameContext = new KGAnrkanoidContext(this);
		}
	}
}