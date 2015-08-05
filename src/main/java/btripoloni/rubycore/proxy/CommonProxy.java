package btripoloni.rubycore.proxy;

import net.minecraft.client.Minecraft;
import net.minecraft.client.resources.IReloadableResourceManager;
import net.minecraft.client.resources.SimpleReloadableResourceManager;

public class CommonProxy {
	public void reloadResourceListener() {
		((SimpleReloadableResourceManager)Minecraft.getMinecraft().getResourceManager()).registerReloadListener(new RubyCoreResourceListener());
	}
	
	public void renderAssetsInDevelopment(){
		((SimpleReloadableResourceManager)Minecraft.getMinecraft().getResourceManager()).registerReloadListener(new RubyCoreResourceListenerInDevelopment());
	}
}
