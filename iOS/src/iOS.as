package
{
	import flash.display.Sprite;
	
	import starling.core.Starling;
	import starling.utils.AssetManager;
	
	[SWF(width='480', height='640', backgroundColor='#111111', frameRate='60')] 
	public class iOS extends Sprite
	{
		public function iOS()
		{
			Objects.stage = stage;
			Objects.assetManager = new AssetManager(Starling.contentScaleFactor);
			Objects.assetManager.verbose = true;
			ThemeTest.main();
		}
	}
}