package
{
	import flash.display.Sprite;
	import flash.text.Font;
	
	[SWF(width='128', height='128', backgroundColor='#eeeeee', frameRate='30')] 
	public class cinecaption_onlyNOTcff extends Sprite
	{
		
		//[Embed(source="../cinecaption227.ttf", fontFamily="cinecaption",fontWeight="normal",mimeType="application/x-font",embedAsCFF="true")]
		//protected static const SOURCE_CINECAPTION_CFF:Class;
		
		[Embed(source="../cinecaption227.ttf",fontFamily="cinecaption",fontWeight="normal",mimeType="application/x-font",embedAsCFF="false")]
		protected static const SOURCE_CINECAPTION:Class;
		
		public function cinecaption_onlyNOTcff()
		{
			//Font.registerFont(SOURCE_CINECAPTION_CFF);		
			Font.registerFont(SOURCE_CINECAPTION);		
		}
		
		//下記の実装はデバッグ用なので特に必要ない
		public function getFontNames():Vector.<String>
		{
			return new <String>["cinecaption"];
		}
		
	}
}