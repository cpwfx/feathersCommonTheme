package
{
	import flash.display.Sprite;
	
	[SWF(width='128', height='128', backgroundColor='#eeeeee', frameRate='30')] 
	public class cinecaption extends Sprite
	{
		
		[Embed(source="cinecaption227.ttf", fontFamily="cinecaption",fontWeight="normal",mimeType="application/x-font",embedAsCFF="true")]
		protected static const SOURCE_CINECAPTION_CFF:Class;
		
		[Embed(source="cinecaption227.ttf",fontFamily="cinecaption",fontWeight="normal",mimeType="application/x-font",embedAsCFF="false")]
		protected static const SOURCE_CINECAPTION:Class;
		
		public function cinecaption()
		{
		}
		
		public function getFontClasses():Vector.<Class>
		{
			var vec:Vector.<Class> = new Vector.<Class>();
			vec.push(SOURCE_CINECAPTION_CFF);
			vec.push(SOURCE_CINECAPTION);
			return vec;
		}
	}
}