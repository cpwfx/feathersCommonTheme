package harayoki.starling.feathers.themes
{
	import flash.utils.describeType;

	public class CommonThemeConfig
	{
		public static var verbose:Boolean = true;
		
		private static var _variablesAndTypes:Object;
		private static function _analyzeVariables(instance:Object):void
		{
			if(!_variablesAndTypes)
			{
				_variablesAndTypes = {};
				var xl:XMLList = describeType(instance).variable;
				for each(var x:XML in xl) {
					_variablesAndTypes[x.@name] = x.@type;
				}
			}			
		}
		
		//public var の名前は jsonのパラメータと同じです
		public var fontName:String = "_sans";
		public var atlasName:String = "";
		public var backgroundColor:uint = 0x4a4137;
		
		public var lightTextColor:uint = 0xe5e5e5;
		public var darkTextColor:uint = 0x1a1816;
		public var selectedTextColor:uint = 0xff9900;
		public var disabledTextColor:uint = 0x8a8a8a;
		public var darkDisabledTextColor:uint = 0x383430;
		public var listBackgroundColor:uint = 0x383430;
		public var tabBackgroundColor:uint = 0x1a1816;
		public var tabDisabledBackgroundColor:uint = 0x292624;
		public var groupedListHeaderBackgroundColor:uint = 0x2e2a26;
		public var groupedListFooterBackgroundColor:uint = 0x2e2a26;
		public var modalOverlayColor:uint = 0x29241e;
		public var modalOverlayAlpha:Number = 0.8;

		public function CommonThemeConfig()
		{
			_analyzeVariables(this);
		}
		
		public function applyJsonData(jsonObject:Object):void
		{
			var o:Object = jsonObject || {};
			var key:String, type:String, temp:String;
			var value:Object;
			for (key in _variablesAndTypes)
			{
				type = _variablesAndTypes[key];
				value = o[key];
				//verbose && trace(key,type,value);
				switch(type)
				{
					case "String":
						_setupStringData(key,value);
						break;
					case "uint":
						temp = value as String;
						if(temp && temp.indexOf("#")==0)
						{
							_setupColor(key,temp);
						}
						else
						{
							_setupUintData(key,value);
						}
						break;
				}
			}
		}
		
		private function _setupStringData(key:String,value:Object):void
		{
			this[key] = _selectParam(value,this[key]) as String;
			verbose && trace("string : ",key,this[key]);
		}
		
		private function _setupUintData(key:String,value:Object):void
		{
			this[key] = _selectParam(value,this[key]) as uint;
			verbose && trace("uint : ",key,this[key]);
		}
		
		private function _setupColor(key:String,colorString:String):void
		{
			colorString = colorString.replace("#","");
			if(colorString.length==3)
			{
				var a:Array = colorString.split("");
				colorString = a[0]+a[0]+a[1]+a[1]+a[2]+a[2];
			}
			this[key] = parseInt("0x" + colorString,16) as uint;
			verbose && trace("color : ",key,"#"+this[key]);
		}
		
		private function _selectParam(newVal:Object,defaltValue:Object):Object
		{			
			if(newVal == null || typeof newVal == "undefined")
			{
				return defaltValue;
			}
			else
			{
				return newVal;
			}
		}
		
	}
}