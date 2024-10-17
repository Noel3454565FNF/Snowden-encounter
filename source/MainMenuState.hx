package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;

using StringTools;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.6.3'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	
	var optionShit:Array<String> = [
		'story_mode',
		'freeplay',
		//#if MODS_ALLOWED 'mods', #end
	//	#if ACHIEVEMENTS_ALLOWED 'awards', #end
		'credits',
		//#if !switch 'donate', #end
		'options'
	];

	var magenta:FlxSprite;
	var camFollow:FlxObject;
	var camFollowPos:FlxObject;
	var debugKeys:Array<FlxKey>;

	override function create()
	{
		#if MODS_ALLOWED
		Paths.pushGlobalMods();
		#end
		WeekData.loadTheFirstEnabledMod();

		FlxG.mouse.visible = true;

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end
		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement, false);
		FlxG.cameras.setDefaultDrawTarget(camGame, true);

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var yScroll:Float = 0;
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.set(0, yScroll);
		bg.setGraphicSize(Std.int(bg.width * 1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		camFollowPos = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		add(camFollowPos);

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.scrollFactor.set(0, yScroll);
		magenta.setGraphicSize(Std.int(magenta.width * 1.175));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = ClientPrefs.globalAntialiasing;
		magenta.color = 0xFFfd719b;
		add(magenta);
		
		// magenta.scrollFactor.set();

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 1;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/

		for (i in 0...optionShit.length)
		{
        // UI CODE!
 // Story Mode
 var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
 var menuItem:FlxSprite = new FlxSprite(100, 550);
 menuItem.scale.x = scale;
 menuItem.scale.y = scale;
 menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[0]);
 menuItem.animation.addByPrefix('idle', optionShit[0] + " idle", 24);
 menuItem.animation.addByPrefix('selected', optionShit[0] + " idle", 24);
 menuItem.animation.play('idle');
 menuItem.ID = 0;
 menuItem.x = 100 + 100 * 1;
//  menuItem.setGraphicSize(Std.int(menuItem.width * 0.50));
 menuItems.add(menuItem);
 var scr:Float = (optionShit.length - 4) * 0.135;
 if (optionShit.length < 6) scr = 0;
 menuItem.scrollFactor.set(0, scr);
 //menuItem.antialiasing = ClientPrefs.globalAntialiasing;
 menuItem.updateHitbox();

 // Freeplay Mode
 offset = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
 menuItem = new FlxSprite(100, 550);
 menuItem.scale.x = scale;
 menuItem.scale.y = scale;
 menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[1]);
 menuItem.animation.addByPrefix('idle', optionShit[1] + " idle", 24);
 menuItem.animation.addByPrefix('selected', optionShit[1] + " idle", 24);
 menuItem.animation.play('idle');
 menuItem.ID = 1;
 menuItem.x = 100 + 250 * 2;
//  menuItem.setGraphicSize(Std.int(menuItem.width * 0.50));
 menuItems.add(menuItem);
 scr = (optionShit.length - 4) * 0.135;
 if (optionShit.length < 6) scr = 0;
 menuItem.scrollFactor.set(0, 0);
 //menuItem.antialiasing = ClientPrefs.globalAntialiasing;
 menuItem.updateHitbox();

 // Credits
 offset = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
 menuItem = new FlxSprite(100, 550);
 menuItem.scale.x = scale * 2;
 menuItem.scale.y = scale * 2;
 menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[2]);
 menuItem.animation.addByPrefix('idle', optionShit[2] + " idle", 24);
 menuItem.animation.addByPrefix('selected', optionShit[2] + " idle", 24);
 menuItem.animation.play('idle');
 menuItem.ID = 2;
 menuItem.x = 100 + 225 * 3;
//  trace(menuItem.y);
 menuItem.setGraphicSize(Std.int(menuItem.width * 0.70));
 menuItems.add(menuItem);
 scr = (optionShit.length - 4) * 0.135;
 if (optionShit.length < 6) scr = 0;
 menuItem.scrollFactor.set(0, 0);
 //menuItem.antialiasing = ClientPrefs.globalAntialiasing;
 menuItem.updateHitbox();

 // Options
 offset = -108 - (Math.max(optionShit.length, 4) - 8) * 80;
 menuItem = new FlxSprite(100, 0);
 menuItem.scale.x = scale * 2;
 menuItem.scale.y = scale * 2;
 menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[3]);
 menuItem.animation.addByPrefix('idle', optionShit[3] + " White", 24);
 menuItem.animation.addByPrefix('selected', optionShit[3] + " Selected", 24);
 menuItem.animation.play('idle');
 menuItem.ID = 3;
 menuItem.x = 900;
 menuItem.setGraphicSize(Std.int(menuItem.width * 0.70));
 menuItems.add(menuItem);
 scr = (optionShit.length - 4) * 0.135;
 if (optionShit.length < 6) scr = 0;
 menuItem.scrollFactor.set(0, 0);
 //menuItem.antialiasing = ClientPrefs.globalAntialiasing;
 menuItem.updateHitbox();
		}


		FlxG.camera.follow(camFollowPos, null, 1);

		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Psych Engine v" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		// NG.core.calls.event.logEvent('swag').send();

		#if ACHIEVEMENTS_ALLOWED
		Achievements.loadAchievements();
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18) {
			var achieveID:Int = Achievements.getAchievementIndex('friday_night_play');
			if(!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2])) { //It's a friday night. WEEEEEEEEEEEEEEEEEE
				Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				giveAchievement();
				ClientPrefs.saveSettings();
			}
		}
		#end

		super.create();
	}

	#if ACHIEVEMENTS_ALLOWED
	// Unlocks "Freaky on a Friday Night" achievement
	function giveAchievement() {
		add(new AchievementObject('friday_night_play', camAchievement));
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
		trace('Giving achievement "friday_night_play"');
	}
	#end

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
			if(FreeplayState.vocals != null) FreeplayState.vocals.volume += 0.5 * elapsed;
		}

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 1);
		camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));

		menuItems.forEach(function(spr:FlxSprite){
			if (FlxG.mouse.overlaps(spr)) {
				curSelected = spr.ID;

				if (spr.ID == curSelected){
					spr.alpha = 1;
				}else{
					spr.alpha = 0.6;
				}
					if(FlxG.mouse.pressed) {
						switch (spr.ID){
							case 0:
								MusicBeatState.switchState(new StoryMenuState());

							case 1:
								MusicBeatState.switchState(new FreeplayState());


							case 2:
								MusicBeatState.switchState(new CreditsState());

							case 3:
								LoadingState.loadAndSwitchState(new options.OptionsState());
					
						}
					}
			}else{
				spr.alpha = 0.6;
			}
		});

		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			// spr.screenCenter(X);
		});
	}
}