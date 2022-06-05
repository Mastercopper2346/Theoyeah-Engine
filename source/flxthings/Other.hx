package flxthings;

//HaxeFlixel API Packages
import flash.*;
import flixel.*;
import haxe.*;
import hscript.*;
import lime.*;
import nape.*;
import openfl.*;
import spinehaxe.*;


//Game States
import Shaders;
import PlayState;
import Character;
import HealthIcon;
import BGSprite;
import Controls;
import CoolUtil;
import CreditsState;
import ClientPrefs;
import Discord;
import GameOverSubState;
import InputFormatter;
import Main;
import MainMenuState;
import MusicBeatState;
import MusicBeatSubState;
import Note;
import StrumNote;
import NoteSplash;
import Paths;
import Song;
import StageData;
import WeekData;
import animateatlas.AtlasFrameMaker;
import animateatlas.JSONData;
import animateatlas.JSONData2020;
import animateatlas.HelperEnums;
import animateatlas.Main;
import animateatlas.displayobject.SpriteAnimationLibrary;
import animateatlas.displayobject.SpriteMovieClip;
import animateatlas.displayobject.SpriteSymbol;
import animateatlas.tilecontainer.TileAnimationLibrary;
import animateatlas.tilecontainer.TileContainerMovieClip;
import animateatlas.tilecontainer.TileContainerSymbol;

using StringTools;


class MoreArray
{
	public function deleteItemsExcept(array:Array, except:Int = 1):Void { //can someone please prove it for me?
		for (i in 0...array.length-except) {
			array.pop();
		}
	}
}
class SaveThings extends ClientPrefs
{
	public function createSaveVar(varUsed:Dynamic, loadPrefsFunction:Bool):Void { // THIS ISN'T PROVED!! MAY CAUSE ERRORS!!
		FlxG.save.data.varUsed = varUsed;
		if(loadPrefsFunction && FlxG.save.data.varUsed != null)
			varUsed = FlxG.save.data.varUsed;
	}
}

class MouseThings extends FlxMouse
{
	/**
	 * Checks if the mouse is currently pressed
	 * @param returnFalse 
	 * @return Dynamic
	 */
	public function mousePressed():Dynamic {
		return FlxG.mouse.pressed;
	}

	/**
	 * Checks if the `click` param has been clicked
	 * @param click for evaluating
	 * @param returnFalse returns false if it didn´t 
	 * @return Dynamic
	 */
	public function mouseJustPressed(click:String = 'left'):Dynamic {
		var clicker:String = click.toLowerCase();
		var right:Bool = switch(clicker) {
			case 'right' | 'rightclick': true;
			default: false;
		}
 		var left:Bool = switch(clicker) {
			case 'left' | 'leftclick': true;
			default: false;
		}
 		var middle:Bool = switch(clicker) {
			case 'middle' | 'middleclick': true;
			default: false;
		}

 		if (FlxG.mouse.justPressedRight && right)
 			// The right button has just been pressed
 			return true;
 		else if (FlxG.mouse.justPressedMiddle && middle)
 			// The middle button has just been pressed
 			return true;
 		else if (FlxG.mouse.justPressed && left)
			// The left mouse button has just been pressed
			return true;
		return false;
	}

	/**
	 * Cheks if the `click` param has been released
	 * @param click for evaluating
	 * @param returnFalse returns false if it didn't
	 * @return Dynamic
	 */
	public function mouseJustReleased(click:String = 'left'):Dynamic {
 		var clicker:String = click.toLowerCase();
 		var right:Bool = switch(clicker) {
			case 'right' | 'rightclick': true;
			default: false;
		}
 		var left:Bool = switch(clicker) {
			case 'left' | 'leftclick': true;
			default: false;
		}
 		var middle:Bool = switch(clicker) {
			case 'middle' | 'middleclick': true;
			default: false;
		}

 		if(FlxG.mouse.justReleasedRight && right)
 			return true;
 		else if (FlxG.mouse.justReleased && left)
 			// The left mouse button has just been released
 			return true;
 		else if (FlxG.mouse.justReleasedMiddle && middle)
 			return true;
		return false;
	}

	/**
	 * Cheks if the `click` param has been pressed
	 * @param click for evaluating
	 * @param returnFalse returns false if it didn't
	 * @return Dynamic
	 */
	public function mousePressed(click:String = 'left'):Dynamic {
 		var clicker:String = click.toLowerCase();
 		var right:Bool = switch(clicker) {
			case 'right' | 'rightclick': true;
			default: false;
		}
 		var left:Bool = switch(clicker) {
			case 'left' | 'leftclick': true;
			default: false;
		}
 		var middle:Bool = switch(clicker) {
			case 'middle' | 'middleclick': true;
			default: false;
		} 

 		if(FlxG.mouse.pressedRight && right)
 			return true;
 		else if (FlxG.mouse.pressed && left)
 			// The left mouse button has pressed
 			return true;
 		else if (FlxG.mouse.pressedMiddle && middle)
 			return true;
 		return false;
 	}

 	public function mouseJustPressedTimeInTicks(click:String = 'left'):Dynamic {
 		/**
 		 * Time in ticks of last click input mouse button press.
 		 */
 		var clicker:String = click.toLowerCase();
 		var right:Bool = switch(clicker) {
			case 'right' | 'rightclick': true;
			default: false;
		}
 		var left:Bool = switch(clicker) {
			case 'left' | 'leftclick': true;
			default: false;
		 }
 		var middle:Bool = switch(clicker) {
			case 'middle' | 'middleclick': true;
			default: false;
		}

 		if(right)
 			return FlxG.mouse.justPressedTimeInTicksRight;
		else if (left)
 			return FlxG.mouse.justPressedTimeInTicks;
 		else if (middle)
 			return FlxG.mouse.justPressedTimeInTicksMiddle;
 	}

}
class MoreCamera extends Camera
{
	public function getWidthHeight(camera:Camera, returnWidth:Bool, ?returnHeight:Bool = false):Dynamic {
		var heightt:Bool = !returnWidth;
		var widthh:Bool = !returnHeight;
		var theTwoOfUs:Bool = if(returnHeight && returnWidth) true else false;
		if(!theTwoOfUs) {
			if(widthh)
				return camera.width;
			return camera.height;
		}
	}

	public function getMotion(camera:Camera, returnLevel, ?returnTimeout = false):Int {
		if(returnLevel)
			return camera.motionLevel;
		return camera.motionTimeout;
	}

}

class MoreFlxCamera extends FlxCamera
{
		public function getScale(camera:Camera, returnX:Bool, ?returnY:Bool = false):Float {
			if (returnX)
				return camera.scaleX;
			return camera.scaleY;
		}

}
