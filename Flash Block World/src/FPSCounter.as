package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
    import flash.events.Event;
    import flash.utils.getTimer;
	
	/**
	 * ...
	 * @author Keith Somers
	 */
	public class  FPSCounter extends MovieClip
	{
        public var startTime:Number;
        public var framesNumber:Number = 0;
        public var fps:TextField = new TextField();
     
        public function FPSCounter()
        {
            fpsCounter();
        }
     
        public function fpsCounter():void
        {
            startTime = getTimer();
			fps.x = 50;
			fps.y = 50;
			fps.textColor = 0xFFFFFF
            addChild(fps);
 
            addEventListener(Event.ENTER_FRAME, checkFPS);
        }
 
        public function checkFPS(e:Event):void
        {
            var currentTime:Number = (getTimer() - startTime) / 1000;
 
            framesNumber++;
             
            if (currentTime > 1)
            {
                fps.text = "FPS: " + (Math.floor((framesNumber/currentTime)*10.0)/10.0);
                startTime = getTimer();
                framesNumber = 0;
            }
        }
	}
	
}