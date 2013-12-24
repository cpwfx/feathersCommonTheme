package harayoki.starling.feathers.themes
{
	import flash.display.Loader;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;

	public class FontSwfLoader
	{
		private var _loader:Loader;
		private var _callback:Function;
		
		public function FontSwfLoader()
		{
		}
		
		public function clean():void
		{
			_cleanLoader();
			_loader = null;
			_callback = null;
		}
		
		public function load(path:String,callback:Function):void
		{
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
			_callback && _callback.apply(null,[_loader.content]);
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