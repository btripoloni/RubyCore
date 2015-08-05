package btripoloni.rubycore.main;

import java.awt.Color;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;

import net.minecraft.block.Block;
import net.minecraft.block.material.Material;
import net.minecraft.client.Minecraft;
import net.minecraft.client.resources.IReloadableResourceManager;
import net.minecraft.client.resources.model.ModelResourceLocation;
import net.minecraft.creativetab.CreativeTabs;
import net.minecraft.init.Blocks;
import net.minecraft.init.Items;
import net.minecraft.item.Item;
import net.minecraft.item.ItemStack;
import net.minecraft.world.gen.feature.WorldGenMinable;
import net.minecraftforge.fml.common.Mod;
import net.minecraftforge.fml.common.Mod.EventHandler;
import net.minecraftforge.fml.common.SidedProxy;
import net.minecraftforge.fml.common.event.FMLInitializationEvent;
import net.minecraftforge.fml.common.event.FMLPostInitializationEvent;
import net.minecraftforge.fml.common.event.FMLPreInitializationEvent;
import net.minecraftforge.fml.common.IWorldGenerator;

import org.jruby.embed.LocalVariableBehavior;
import org.jruby.embed.PathType;
import org.jruby.embed.ScriptingContainer;





import btripoloni.rubycore.proxy.ClientProxy;
import btripoloni.rubycore.proxy.CommonProxy;
import btripoloni.rubycore.proxy.RubyCoreResourceListener;


//inform to Forge than this class is a mod
@Mod(name = BaseMod.NAME, modid = BaseMod.MODID, version = BaseMod.VERSION)
public class BaseMod {
    //call the Resource Proxies
	@SidedProxy(clientSide = "btripoloni.rubycore.proxy.ClientProxy", serverSide = "btripoloni.rubycore.proxy.CommonProxy")

	public static CommonProxy proxy;
    public static ClientProxy cproxy;

    //Mod info
	public static final String NAME = "Ruby Core";
	public static final String MODID = "rubycore";
    public static final String VERSION = "0.1";


    @Mod.Instance("rubycore")
    public static BaseMod instance;

    ScriptingContainer container = new ScriptingContainer();
    private Object core = null;

    @EventHandler
    public void postInit(FMLPostInitializationEvent event){
    	container.callMethod(core, "post_init");
    }

    @EventHandler
    public void init(FMLInitializationEvent event)
    {
    	container.callMethod(core, "init");
    	Item n = new Item();
    	Minecraft.getMinecraft().getRenderItem().getItemModelMesher().register(n, 0, new ModelResourceLocation("", "inventory"));
    }

    @EventHandler
    public void preInit(FMLPreInitializationEvent event){
    	//core = container.runScriptlet(PathType.CLASSPATH, "btripoloni/rubycore/ruby/loader.rb");
    	//container.callMethod(core, "pre_init");

	    try {
	    	// Load the proxies for the assets
	    	proxy.reloadResourceListener();
	    	proxy.renderAssetsInDevelopment();
	    	
	    	//container.
	    	container.setClassLoader(BaseMod.class.getClassLoader());
	    	URL url = getClass().getResource("/loader.rb");
	    	System.out.print(Minecraft.getMinecraft().mcDataDir);
	    	String unescapedurl = URLDecoder.decode(url.toString(), "UTF-8");
	    	Object brainClass = container.runScriptlet(url.openStream(), unescapedurl);
	    	core = container.callMethod(brainClass, "new");
	    	container.callMethod(core, "pre_init");
	    } catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
    }

    /*@EventHandler
    public void preInit(FMLPreInitializationEvent event){
    	core = container.runScriptlet(PathType.CLASSPATH, "btripoloni/rubycore/ruby/loader.rb");
    	container.callMethod(core, "pre_init");
    	proxy.reloadResourceListener();
    	proxy.renderAssetsInDevelopment();
    }*/
}
