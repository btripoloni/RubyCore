#RubyCore

###RubyCore is a easy way to create mods for minecraft using ruby.

---

####**FAQ**

**What the mods i can create?**
Anyone you can acess all Java, Minecraft, Forge Api using ruby, so feel free to create!

**Can I use gems?**
Sure, but the gems need to be all in Ruby, native gems(C language) don’t work because the framework has writed in Ruby/Java.

**Can I create gems for outhers moders?**
Yes, please.

**Can i use other dev mods(BuildCraft, IndustrialCraft, etc)**
	I don’t know :D, but i belive than yes.

**Why Ruby?**
	Ruby is a awesome language is made for humans not for machines, is easy to learn and write code, you can create everything with ruby, desktop and mobile apps, web servers, etc, so why not we can create mods for Minecraft?

**So don’t be lazy, so download the RubyCore and:**
![just do it](http://i.ytimg.com/vi/loYr1_A5qU4/maxresdefault.jpg)
---

#Geting started:

Develop a mod using RubyCore is very similar with a normal forge mod.

First, download the Rubycore, unpack the zip in any folder, run the command 'gradlew setupdecompworkspace'.

Donwload the '[jruby-complete.jar](http://jruby.org/download)' and puts in the 'libs/' folder

Run the command '`gradlew runClient`' for start minecraft


---

If you want to mix java code with your mod you can use eclipe for this, just run the command "gradlew eclipse" and open the project on eclipse.

You code will be in the “src/main/resources/mod” folder (ruby only)

the main file of your mod need to contain the prefix “mod_”, ex: mod_newSword.rb

---
##Create a mod using RubyCore is easy:

```ruby
class TutorialMod #create a class
  def pre_init #like a nomal forge mod
    @block = QuickBlock.new(Material.wood) #QuickBlock is a class to create blocks more easily
    @block.setUnlocalizedName("tutorial_block")# normal
    @block.setCreativeTab(CreativeTabs.tabBlocks)# normal
    GameRegistry.registerBlock(@block, "tutorial_block")
  end
end

add_mod(TutorialMod, "Tutorial Mod", "0.1") # tells to rubycore that your mod exists
```

####This code will make a simple block, but this can be better:

```ruby
class TutorialMod #create a class
  def pre_init #like a nomal forge mod
    @block = QuickBlock.new(:wood) # You can use a symbol to inform a Material
    @block.setUnlocalizedName("tutorial_block")# normal
    @block.setCreativeTab(:blocks)# You can use symbols to inform tabs too
    GameRegistry.registerBlock(@block, "tutorial_block")
  end
end
```

####You can render models too:

```ruby
class TutorialMod #create a class
  def pre_init #like a nomal forge mod
    @block = QuickBlock.new(:wood) # You can use a symbol to inform a Material
    @block.setUnlocalizedName("tutorial_block")# normal
    @block.setCreativeTab(:blocks)# You can use symbols to inform tabs too
    GameRegistry.registerBlock(@block, "tutorial_block")
  end
end
```

####Create Items:

```ruby
@item = QuickItem.new() #create a new item
@item.setUnlocalizedName("tutorial_item")
@item.setCreativeTab(:tools)
GameRegistry.registerItem(@item, "tutorial_item")
```

####Create tabs:

```ruby
@tutorial_tab = QuickTab("Tutorial", @item)
@block.setCreativeTab(@tutorial_tab)
@item.setCreativeTab(@tutorial_tab)
```
