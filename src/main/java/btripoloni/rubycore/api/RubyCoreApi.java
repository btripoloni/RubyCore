package btripoloni.rubycore.api;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

import net.minecraft.block.Block;
import net.minecraft.client.Minecraft;
import net.minecraft.item.Item;


public class RubyCoreApi {
	
	public static Item[] item = new Item[10];
	
	public static File minecraft_home(){
		return Minecraft.getMinecraft().mcDataDir;
	}
	
	public static Method[] get_methods_from_a_class(String name) throws ClassNotFoundException{
		Class<?> cls = Class.forName(name);
    	Method[] m = cls.getMethods();
		return m;
    }
	
	public static Field[] get_fields_from_a_class(String name) throws ClassNotFoundException{
		Class<?> cls = Class.forName(name);
    	Field[] m = cls.getFields();
		return m;
    }
	
	public static Class<?> get_class(String name) throws ClassNotFoundException{
		Class<?> cls = Class.forName(name);
		return cls;
	}
}
