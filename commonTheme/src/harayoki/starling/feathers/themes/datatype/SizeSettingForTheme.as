package harayoki.starling.feathers.themes.datatype
{
	public class SizeSettingForTheme
	{
		public var width:int = 0;
		public var height:int = 0;
		public function SizeSettingForTheme(width:int=0,height:int=0)
		{
			this.width = width;
			this.height = height;
		}
		
		public function toString():String
		{
			return "(width="+this.width+", height="+this.height+")";
		}
		
		public function resetByArray(paddings:Array):void
		{
			if(!paddings) paddings = [];
			while(paddings.length<2)
			{
				paddings.push(0);
			}
			this.width = paddings[0] as int;
			this.height = paddings[1] as int;
		}
	}
}