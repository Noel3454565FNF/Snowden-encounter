package states;

import flixel.*;
import flixel.FlxSubState;
import flixel.addons.ui.FlxUIButton;
import flixel.addons.ui.FlxUIPopup;
import flixel.ui.FlxButton;

import openfl.display.BitmapData;
import openfl.geom.Rectangle;

import openfl.display.Sprite;
import openfl.events.Event;

import flash.system.System;

import backend.WeekData;


#if VIDEOS_ALLOWED
#if (hxCodec >= "3.0.0") import hxcodec.flixel.FlxVideo as VideoHandler;
#elseif (hxCodec >= "2.6.1") import hxcodec.VideoHandler as VideoHandler;
#elseif (hxCodec == "2.6.0") import VideoHandler;
#else import vlc.MP4Handler as VideoHandler; #end
#end



class FirstVideo extends MusicBeatState
{
	// var cornerSize:Int = 10;
	// var loadedWeeks:Array<WeekData> = [];

	// var panel:FlxSprite;
	// var panelbg:FlxSprite;
    // var vid:Array<FlxSprite>;
	// var game = states.PlayState;



    // override function create()
    // {
	// 	FlxG.sound.music.stop();
	// 	startVideo('pipe');
    // }


	// public function startVideo(name:String)
	// {
	// 	#if VIDEOS_ALLOWED

	// 	var filepath:String = Paths.video(name);
	// 	#if sys
	// 	if(!FileSystem.exists(filepath))
	// 	#else
	// 	if(!OpenFlAssets.exists(filepath))
	// 	#end
	// 	{
	// 		FlxG.log.warn('Couldnt find video file: ' + name);
	// 		System.exit(0);
	// 		return;
	// 	}

	// 	var video:VideoHandler = new VideoHandler();
	// 		#if (hxCodec >= "3.0.0")
	// 		// Recent versions
	// 		video.play(filepath);
	// 		video.onEndReached.add(function()
	// 		{
	// 			video.dispose();
	// 			System.exit(0);
	// 			return;
	// 		}, true);
	// 		#else
	// 		// Older versions
	// 		video.playVideo(filepath);
	// 		video.finishCallback = function()
	// 		{
	// 			System.exit(0);
	// 			return;
	// 		}
	// 		#end
	// 	#else
	// 	FlxG.log.warn('Platform not supported!');
	// 	return;
	// 	#end
		
	// }




}