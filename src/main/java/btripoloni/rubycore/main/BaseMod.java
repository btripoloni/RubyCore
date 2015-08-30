package btripoloni.rubycore.main;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;

import net.minecraft.client.Minecraft;

import org.jruby.embed.ScriptingContainer;

import btripoloni.rubycore.proxy.ClientProxy;
import btripoloni.rubycore.proxy.CommonProxy;
import cpw.mods.fml.common.Mod;
import cpw.mods.fml.common.Mod.EventHandler;
import cpw.mods.fml.common.SidedProxy;
import cpw.mods.fml.common.event.FMLInitializationEvent;
import cpw.mods.fml.common.event.FMLPostInitializationEvent;
import cpw.mods.fml.common.event.FMLPreInitializationEvent;

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
    }

    @EventHandler
    public void preInit(FMLPreInitializationEvent event){
	    try {
	    	// Load the proxies for the assets
	    	//proxy.reloadResourceListener();
	    	//proxy.renderAssetsInDevelopment();
	    	
	    	
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
}
