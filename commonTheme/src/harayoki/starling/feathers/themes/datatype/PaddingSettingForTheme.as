package harayoki.starling.feathers.themes.datatype
{
	public class PaddingSettingForTheme
	{
		public var top:int = 0;
		public var right:int = 0;
		public var bottom:int = 0;
		public var left:int = 0;
		
		public function PaddingSettingForTheme(top:int=0,right:int=0,bottom:int=0,left:int=0)
		{
			this.top = top;
			this.right = right;
			this.bottom = bottom;
			this.left = left;
		}
		
		public function toString():String
		{
			return "(top="+this.top+", right="+this.right+", bottom="+this.bottom+", left="+this.left+")";
		}
		
		public function resetByArray(paddings:Array):void
		{
			if(!paddings) paddings = [];
			while(paddings.length<4)
			{
				paddings.push(0);
			}
			this.top = paddings[0] as int;
			this.right = paddings[1] as int;
			this.bottom = paddings[2] as int;
			this.left = paddings[3] as int;
		}
	}
}