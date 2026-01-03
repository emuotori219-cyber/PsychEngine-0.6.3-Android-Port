import psychlua.LuaUtils;
import hxvlc.flixel.FlxVideoSprite;

var globalData:Array<FlxVideoSprite> = [];

createGlobalCallback('makeVideoSprite', function(tag:String, videoFile:String, ?x:Float = 0, ?y:Float = 0, ?camera:String = 'game', ?shouldLoop:Bool = false)
{
	if (game.modchartSprites.exists(tag + '_video'))
	{
		debugPrint('makeVideoSprite: This tag is not available! Use a different tag.', FlxColor.RED);
		return;
	}
	
	var videoPath:String = Paths.video(videoFile);
	if (!FileSystem.exists(videoPath))
	{
		debugPrint('makeVideoSprite: The video file "' + videoFile + '" cannot be found!', FlxColor.RED);
		return;
	}
	

	var videoSprite:FlxVideoSprite = new FlxVideoSprite(x, y);
	videoSprite.camera = LuaUtils.cameraFromString(camera);
	videoSprite.alpha = 1;
	videoSprite.visible = true;
	

	game.modchartSprites.set(tag + '_video', videoSprite);
	add(videoSprite);
	

	videoSprite.load(videoPath);
	

	videoSprite.bitmap.onEndReached.add(function()
	{
		if (shouldLoop)
		{
		
			videoSprite.bitmap.play();
		}
		else
		{
		
			if (globalData.indexOf(videoSprite) >= 0)
				globalData.remove(videoSprite);
			
			if (game.modchartSprites.exists(tag + '_video'))
			{
				game.modchartSprites.get(tag + '_video').destroy();
				game.modchartSprites.remove(tag + '_video');
			}
			
			game.callOnLuas('onVideoFinished', [tag]);
		}
	});
	

	videoSprite.play();
	

	globalData.push(videoSprite);
});

function onPause()
{
	for (videoSprite in globalData)
	{
		if (videoSprite != null && videoSprite.bitmap != null)
		{
			videoSprite.bitmap.pause();
		}
	}
}

function onResume()
{
	for (videoSprite in globalData)
	{
		if (videoSprite != null && videoSprite.bitmap != null)
		{
			videoSprite.bitmap.resume();
		}
	}
}

function onDestroy()
{
	for (videoSprite in globalData)
	{
		if (videoSprite != null)
		{
			if (videoSprite.bitmap != null)
				videoSprite.bitmap.stop();
			videoSprite.destroy();
		}
	}
	globalData = [];
}

var cache:Array<String> = ['mewhenthe'];

function precacheVideos()
{
	for (videoName in cache)
	{
		var videoPath:String = Paths.video(videoName);
		if (FileSystem.exists(videoPath))
		{
			
			var tempVideo:FlxVideoSprite = new FlxVideoSprite(0, 0);
			tempVideo.load(videoPath);
	
			tempVideo.destroy();
		}
	}
}

precacheVideos();