package btripoloni.rubycore.api;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;

import net.minecraft.block.Block;
import net.minecraft.block.material.Material;
import net.minecraft.client.Minecraft;
import net.minecraft.creativetab.CreativeTabs;
import net.minecraft.init.Blocks;
import net.minecraft.init.Items;
import net.minecraft.item.Item;
import net.minecraft.item.ItemStack;

import org.jruby.runtime.ThreadContext;
import org.jruby.runtime.builtin.IRubyObject;
import org.jruby.RubyHash;
import org.jruby.ir.operands.Hash;
import org.jruby.javasupport.proxy.JavaProxyClass;

import net.minecraftforge.fml.common.registry.GameRegistry;
import net.minecraftforge.fml.relauncher.Side;
import net.minecraftforge.fml.relauncher.SideOnly;

public class RubyCoreApi {
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
