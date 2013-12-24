package harayoki.starling.feathers.themes
{
	import flash.geom.Rectangle;
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;

	public class ThemeConfig
	{
		
		protected static var _variablesAndTypes:Object;
		protected static function _analyzeVariables(instance:Object):void
		{
			trace(describeType(instance));
			
			if(!_variablesAndTypes)
			{
				_variablesAndTypes = {};
				var xl:XMLList = describeType(instance).factory.variable;
				for each(var x:XML in xl) {
					_variablesAndTypes[x.@name] = x.@type;
				}
			}	
			
		}
		
		public var verbose:Boolean = true;
		public function ThemeConfig()
		{
		}
		
		public function applyJsonData(jsonObject:Object):void
		{
			var o:Object = jsonObject || {};
			
			const PADDING_CLASS_NAME:String = flash.utils.getQualifiedClassName(PaddingSettingForTheme);
			const SIZE_CLASS_NAME:String = flash.utils.getQualifiedClassName(SizeSettingForTheme);
			
			var key:String, type:String, temp:String;
			var value:Object;
			for (key in _variablesAndTypes)
			{
				type = _variablesAndTypes[key];
				value = o[key];
				//verbose && trace(key,type,value);
				switch(type)
				{
					
					case "Boolean":
						_setupBooleanData(key,value);
						break;						
					case "String":
						_setupStringData(key,value);
						break;
					case "Number":
						_setupNumberData(key,value);
					case "int":
						_setupIntData(key,value);
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
					case "flash.geom::Rectangle":
						_setupRectangle(key,value);
						break;
					case PADDING_CLASS_NAME:
						_setUpPadding(key,value);
						break;
					case SIZE_CLASS_NAME:
						_setUpSize(key,value);
						break;
				}
			}
		}
		
		protected function _setupBooleanData(key:String,value:Object):void
		{
			this[key] = _selectParam(value,this[key]) as Boolean;
			verbose && trace("Boolean : ",key,"'"+this[key]+"'");
		}		
		
		protected function _setupStringData(key:String,value:Object):void
		{
			this[key] = _selectParam(value,this[key]) as String;
			verbose && trace("string : ",key,"'"+this[key]+"'");
		}
		
		protected function _setupIntData(key:String,value:Object):void
		{
			this[key] = _selectParam(value,this[key]) as int;
			verbose && trace("int : ",key,this[key]);
		}
		
		protected function _setupUintData(key:String,value:Object):void
		{
			this[key] = _selectParam(value,this[key]) as uint;
			verbose && trace("uint : ",key,this[key]);
		}
		
		protected function _setupNumberData(key:String,value:Object):void
		{
			this[key] = _selectParam(value,this[key]) as Number;
			verbose && trace("Number : ",key,this[key]);
		}		
		
		protected function _setupRectangle(key:String,value:Object):void
		{
			if(value)
			{
				if(!(value is Array))
				{
					throw(new Error("Rectangle setting needs array(length:4) data."));
				}
				else
				{
					value = new Rectangle(value[0],value[1],value[2],value[3]);
				}
			}
			this[key] = _selectParam(value,this[key]) as Rectangle;
			verbose && trace("Rectangle : ",key,this[key]);
		}
		
		protected function _setUpPadding(key:String,value:Object):void
		{
			if(value)
			{
				if(!(value is Array) || (value as Array).length!=4)
				{
					throw(new Error("Padding setting needs array(length:4) data."));
				}
				else
				{
					value = new PaddingSettingForTheme(value[0],value[1],value[2],value[3]);
				}
			}
			this[key] = _selectParam(value,this[key]) as PaddingSettingForTheme;
			verbose && trace("PaddingSettingForTheme : ",key,this[key]);
		}
		
		protected function _setUpSize(key:String,value:Object):void
		{
			if(value)
			{
				if(!(value is Array) || (value as Array).length!=2)
				{
					throw(new Error("Padding setting needs array(length:2) data."));
				}
				else
				{
					value = new SizeSettingForTheme(value[0],value[1]);
				}
			}
			this[key] = _selectParam(value,this[key]) as SizeSettingForTheme;
			verbose && trace("SizeSettingForTheme : ",key,this[key]);
		}
		
		
		protected function _setupColor(key:String,colorString:String):void
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
		
		protected function _selectParam(newVal:Object,defaltValue:Object):Object
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