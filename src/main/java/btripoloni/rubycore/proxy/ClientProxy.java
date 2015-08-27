package btripoloni.rubycore.proxy;

import org.jruby.embed.ScriptingContainer;


public class ClientProxy extends CommonProxy{

	ScriptingContainer container = new ScriptingContainer();
	
	@Override
	public void reloadResourceListener(){
		super.reloadResourceListener();
	}
	
	@Override
	public void renderAssetsInDevelopment(){
		super.renderAssetsInDevelopment();
	}
}
