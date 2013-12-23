package
{
	import flash.display.Sprite;
	
	import starling.utils.AssetManager;
	
	[SWF(width='1024', height='760', backgroundColor='#111111', frameRate='60')] 
	public class commonTheme extends Sprite
	{
		public function commonTheme()
		{
			Objects.stage = stage;
			Objects.assetManager = new AssetManager();
			Objects.assetManager.verbose = true;
			ThemeTest.main();
		}
	}
}
