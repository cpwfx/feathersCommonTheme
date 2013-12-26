package
{
	import flash.display.Sprite;
	
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
		}
		
		public function getFontClasses():Vector.<Class>
		{
			var vec:Vector.<Class> = new Vector.<Class>();
			vec.push(SOURCE_SANS_PRO_REGULAR);
			vec.push(SOURCE_SANS_PRO_SEMIBOLD);
			vec.push(SOURCE_SANS_PRO_SEMIBOLD_NUMBERS);
			return vec;
		}
	}
}