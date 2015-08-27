package btripoloni.rubycore.proxy;

import java.io.File;

import net.minecraft.client.Minecraft;
import net.minecraft.client.resources.FolderResourcePack;
import net.minecraft.client.resources.IResourceManager;
import net.minecraft.client.resources.IResourceManagerReloadListener;
import net.minecraft.client.resources.SimpleReloadableResourceManager;

public class RubyCoreResourceListenerInDevelopment implements IResourceManagerReloadListener{
	@Override
    public void onResourceManagerReload(IResourceManager var1) {
    	if(var1 instanceof SimpleReloadableResourceManager){
    		SimpleReloadableResourceManager simplemanager = (SimpleReloadableResourceManager)var1; 
    		File mods_path = new File(Minecraft.getMinecraft().mcDataDir,"rubymods");
    		FolderResourcePack pack = new FolderResourcePack(new File(mods_path, "development"));
    		simplemanager.reloadResourcePack(pack);
        }
    }
}
