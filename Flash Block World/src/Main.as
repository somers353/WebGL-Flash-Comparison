package
{
	
	//Flare3D
	import flare.basic.*;
	import flare.collisions.*;
	import flare.materials.*;
	import flare.primitives.*;
	import flare.system.*;
	import flare.utils.*;
	import flare.core.*;
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Keith Somers
	 */
	public class Main extends Sprite
	{
		private var scene:Scene3D;
		private var container:Sprite;
		private var collisions:SphereCollision;
		private var floor:Pivot3D;
		private var axis:Pivot3D;
		private var cube:Cube;
		
		public function Main() 
		{	
			scene = new Viewer3D(this,"",0,0);
			
			scene.camera = new Camera3D("playerCamera");
			scene.camera.setPosition( 5, 1, 5);
			scene.camera.lookAt(0, 1, 0);
			
			var fpsCounter:FPSCounter = new FPSCounter();
			addChild(fpsCounter);
			
			//scene.addEventListener(Scene3D.PROGRESS_EVENT, progressEvent);
			//scene.addEventListener(Scene3D.COMPLETE_EVENT, completeEvent);
			
			cube = new Cube("", 3, 1, 3, 1);
			cube.setPosition(0, 0, 0);
			scene.addChild(cube);
			
			//scene.pause();
			
			scene.addEventListener(Scene3D.UPDATE_EVENT, updateEvent);
		}
		
		private function progressEvent(e:Event):void
		{
			// display loading progress
			trace(scene.loadProgress);
		}
		
		private function completeEvent(e:Event):void
		{
			scene.resume();
			
			scene.addEventListener(Scene3D.UPDATE_EVENT, updateEvent);
		}
		
		private function updateEvent(e:Event):void
		{
		
			scene.camera.rotateY( Input3D.mouseXSpeed * scene.camera.getPosition().length / 300 );
			scene.camera.rotateX( Input3D.mouseYSpeed * scene.camera.getPosition().length / 300 );
		 
			if ( Input3D.keyDown( Input3D.UP ) ) scene.camera.translateZ( 1 );
			if ( Input3D.keyDown( Input3D.DOWN ) ) scene.camera.translateZ( -1 );
 
			if ( Input3D.keyDown( Input3D.LEFT ) ) scene.camera.translateX( -1 );
			if ( Input3D.keyDown( Input3D.RIGHT ) ) scene.camera.translateX( 1 );
		
			scene.camera.translateY(0 - scene.camera.y);
		}
		
	}
	
}