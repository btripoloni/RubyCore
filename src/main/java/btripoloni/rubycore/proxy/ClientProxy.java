package btripoloni.rubycore.proxy;

import net.minecraft.client.Minecraft;
import net.minecraft.client.resources.IReloadableResourceManager;

public class ClientProxy extends CommonProxy{
	
	@Override
	public void reloadResourceListener(){
		super.reloadResourceListener();
	}
	
	@Override
	public void renderAssetsInDevelopment(){
		super.renderAssetsInDevelopment();
	}
}
