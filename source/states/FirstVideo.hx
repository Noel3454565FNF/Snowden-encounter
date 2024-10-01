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
	var cornerSize:Int = 10;
	var loadedWeeks:Array<WeekData> = [];

	var panel:FlxSprite;
	var panelbg:FlxSprite;
    var vid:Array<FlxSprite>;
	var game = states.PlayState;



    override function create()
    {
		FlxG.sound.music.stop();
		startVideo('pipe');
    }


	public function startVideo(name:String)
	{
		#if VIDEOS_ALLOWED

		var filepath:String = Paths.video(name);
		#if sys
		if(!FileSystem.exists(filepath))
		#else
		if(!OpenFlAssets.exists(filepath))
		#end
		{
			FlxG.log.warn('Couldnt find video file: ' + name);
			System.exit(0);
			return;
		}

		var video:VideoHandler = new VideoHandler();
			#if (hxCodec >= "3.0.0")
			// Recent versions
			video.play(filepath);
			video.onEndReached.add(function()
			{
				video.dispose();
				return;
			}, true);
			#else
			// Older versions
			video.playVideo(filepath);
			video.finishCallback = function()
			{
				return;
			}
			#end
		#else
		FlxG.log.warn('Platform not supported!');
		return;
		#end
		
	}




	function selectWeek()
	{
		if (true)
		{
			// We can't use Dynamic Array .copy() because that crashes HTML5, here's a workaround.
			var songArray:Array<String> = [];
			var loadedWeeks:Json = 
			var leWeek:Array<Dynamic> = loadedWeeks[curWeek].songs;
			for (i in 0...leWeek.length) {
				songArray.push(leWeek[i][0]);
			}
			if (loadedWeeks[curWeek].fileName == "weekSands")
			{
				MusicBeatState.switchState(new FirstVideo());
			}

			// Nevermind that's stupid lmao
			try
			{
				PlayState.storyPlaylist = songArray;
				PlayState.isStoryMode = true;
				selectedWeek = true;
	
				var diffic = Difficulty.getFilePath(curDifficulty);
				if(diffic == null) diffic = '';
	
				PlayState.storyDifficulty = curDifficulty;
	
				PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + diffic, PlayState.storyPlaylist[0].toLowerCase());
				PlayState.campaignScore = 0;
				PlayState.campaignMisses = 0;
			}
			catch(e:Dynamic)
			{
				trace('ERROR! $e');
				return;
			}
			
			if (stopspamming == false)
			{
				FlxG.sound.play(Paths.sound('confirmMenu'));

				grpWeekText.members[curWeek].isFlashing = true;
				for (char in grpWeekCharacters.members)
				{
					if (char.character != '' && char.hasConfirmAnimation)
					{
						char.animation.play('confirm');
					}
				}
				stopspamming = true;
			}

			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				LoadingState.loadAndSwitchState(new PlayState(), true);
				FreeplayState.destroyFreeplayVocals();
			});
			
			#if (MODS_ALLOWED && DISCORD_ALLOWED)
			DiscordClient.loadModRPC();
			#end
		}
		else FlxG.sound.play(Paths.sound('cancelMenu'));
	}

}