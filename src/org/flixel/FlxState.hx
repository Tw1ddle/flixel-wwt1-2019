package org.flixel;

import nme.display.BitmapData;
import org.flixel.system.layer.Atlas;
import org.flixel.system.layer.DrawStackItem;
import org.flixel.system.layer.TileSheetData;

/**
 * This is the basic game "state" object - e.g. in a simple game
 * you might have a menu state and a play state.
 * It is for all intents and purpose a fancy FlxGroup.
 * And really, it's not even that fancy.
 */
class FlxState extends FlxGroup
{
	public function new()
	{
		super();
	}
	
	/**
	 * This function is called after the game engine successfully switches states.
	 * Override this function, NOT the constructor, to initialize or set up your game state.
	 * We do NOT recommend overriding the constructor, unless you want some crazy unpredictable things to happen!
	 */
	public function create():Void { }
	
	/**
	 * Gets the layer for specified key from bitmap cache in FlxG. Creates new layer for it if there wasn't such a layer 
	 * @param	KeyInBitmapCache	key from bitmap cache in FlxG
	 * @return	required layer
	 */
	public function getAtlasFor(KeyInBitmapCache:String):Atlas
	{
		#if (cpp || neko)
		var bm:BitmapData = FlxG._cache.get(KeyInBitmapCache);
		if (bm != null)
		{
			var tempAtlas:Atlas = Atlas.getAtlas(KeyInBitmapCache, bm);
			return tempAtlas;
		}
		else
		{
			#if debug
			throw "There isn't bitmapdata in cache with key: " + KeyInBitmapCache;
			#end
		}
		#end
		return null;
	}
	
	/**
	 * This method is called after application losts its focus.
	 * Can be useful if you using third part libraries, such as tweening engines.
	 * Override it in subclasses
	 */
	public function onFocusLost():Void
	{
		
	}
	
	/**
	 * This method is called after application gets focus.
	 * Can be useful if you using third part libraries, such as tweening engines.
	 * Override it in subclasses
	 */
	public function onFocus():Void
	{
		
	}
}