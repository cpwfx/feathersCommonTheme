package harayoki.starling.feathers.themes.util
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;
	import flash.text.Font;

	public class FontSwfLoader
	{
		private var _loader:Loader;
		private var _fontClassList:Array;
		private var _callback:Function;
		
		public function FontSwfLoader()
		{
		}
		
		public function clean():void
		{
			_cleanLoader();
			_loader = null;
			_fontClassList = null;
			_callback = null;
		}
		
		public function load(path:String,fontClassList:Array,callback:Function):void
		{
			_fontClassList = fontClassList;
			
			var req:URLRequest = new URLRequest(path);
			_callback = callback;
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE,_handleComplete);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,_handleError);
			_loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,_handleError);
			_loader.load(req);
		}
		
		private function _handleComplete(ev:Event):void
		{
			
			var swf:MovieClip = _loader.content as MovieClip;
			swf.stop();
			
			for each(var fontClassName:String in _fontClassList)
			{
				if(_loader.contentLoaderInfo.applicationDomain.hasDefinition(fontClassName))
				{
					var MyFont:Class = _loader.contentLoaderInfo.applicationDomain.getDefinition("MyCinecaption") as Class;
					Font.registerFont(MyFont);					
				}
				else
				{
					trace("font class",fontClassName,"not found");
				}
			}
			
			
			var fonts:Array = Font.enumerateFonts(false);
			for each(var font:Font in fonts)
			{
				trace("font:",font.fontName,font.fontStyle,font.fontType);
			}
						
			_callback && _callback.apply(null,[swf]);
			clean();
		}
		
		private function _handleError(ev:ErrorEvent):void
		{
			_callback && _callback.apply(null,[null]);
			clean();
		}
		
		private function _cleanLoader():void
		{
			if(_loader)
			{
				_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,_handleComplete);			
				_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,_handleError);
				_loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,_handleError);
			}
		}
	}
}