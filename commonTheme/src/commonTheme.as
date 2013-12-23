package
{
	import flash.display.Sprite;
	
	import starling.utils.AssetManager;
	
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
