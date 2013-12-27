package
{
	import flash.display.Sprite;
	import flash.text.Font;
	
	[SWF(width='128', height='128', backgroundColor='#eeeeee', frameRate='30')] 
	public class SourceSansPro extends Sprite
	{
		
		[Embed(source="../SourceSansPro-Regular.ttf", fontFamily="SourceSansPro",fontWeight="normal",mimeType="application/x-font",embedAsCFF="true")]
		protected static const SOURCE_SANS_PRO_REGULAR:Class;
		
		[Embed(source="../SourceSansPro-Semibold.ttf",fontFamily="SourceSansPro",fontWeight="bold",mimeType="application/x-font",embedAsCFF="true")]
		protected static const SOURCE_SANS_PRO_SEMIBOLD:Class;
		
		[Embed(source="../SourceSansPro-Semibold.ttf",fontFamily="SourceSansPro",fontWeight="normal",unicodeRange="U+0030-U+0039",mimeType="application/x-font",embedAsCFF="false")]
		protected static const SOURCE_SANS_PRO_SEMIBOLD_NUMBERS:Class;
		
		public function SourceSansPro()
		{
			Font.registerFont(SOURCE_SANS_PRO_REGULAR);		
			Font.registerFont(SOURCE_SANS_PRO_SEMIBOLD);		
			Font.registerFont(SOURCE_SANS_PRO_SEMIBOLD_NUMBERS);		
		}
		
		//下記の実装はデバッグ用なので特に必要ない
		public function getFontNames():Vector.<String>
		{
			return new <String>["SourceSansPro"];
		}

	}
}