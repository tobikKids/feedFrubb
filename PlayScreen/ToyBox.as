package  PlayScreen{
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	
	public class ToyBox extends MovieClip {
		public var btnExit:SimpleButton;
		public var mcOutside:MovieClip;
		
		public function ToyBox() {
			btnExit.addEventListener(MouseEvent.CLICK, _exit);
		}
		
		private function _exit(e:MouseEvent):void
		{
			visible = false;
		}
	}
	
}
