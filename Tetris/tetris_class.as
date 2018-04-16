package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.utils.Timer; 
    import flash.events.KeyboardEvent;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import fl.transitions.*;
    import fl.transitions.easing.*;
    import flash.text.engine.EastAsianJustifier;	
	import flash.net.Socket;
	import flash.net.LocalConnection;
	import flash.net.SecureSocket;
	import flash.net.NetConnection;
	import flash.net.XMLSocket;
	import flash.ui.Keyboard;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class tetris_class extends MovieClip {
		
		var bla:Socket= new Socket();
		var ser:XMLSocket= new XMLSocket();
		public function tetris_class() {
			
		}
		public function fbp(event:MouseEvent){
			gotoAndStop(2);
		}
	
public function fbj(event:MouseEvent):void{
	gotoAndStop(4);
}
public function ftet(event:MouseEvent):void{
	var url1:URLRequest= new URLRequest("test.html");
		navigateToURL(url1, "safe");
}
}
}